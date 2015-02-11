require 'spec_helper'

describe StoryExpress::StoryFinder do
  describe '.deliverables' do
    let(:project) { double(:project, stories: double(:stories)) }
    let(:finished_marked_story) { double(:finished_marked_story, id: 'finished_marked_story') }
    let(:finished_unmarked_story) { double(:finished_unmarked_story, id: 'finished_unmarked_story') }

    it 'returns finished stories that have been marked finished' do
      allow(PivotalTracker::Project).to receive(:find).with(ENV['TRACKER_PROJECT_ID']).and_return(project)
      allow(project.stories).to receive(:all).with(state: 'finished', story_type: ['bug', 'feature']).and_return([finished_marked_story, finished_unmarked_story])
      allow(StoryExpress::GitReader).to receive(:grep_log).with('finished_marked_story').and_return('[finishes #finished_marked_story]')
      allow(StoryExpress::GitReader).to receive(:grep_log).with('finished_unmarked_story').and_return('')

      expect(StoryExpress::StoryFinder.deliverables).to eq [finished_marked_story]
    end
  end
end
