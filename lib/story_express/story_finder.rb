require 'pivotal-tracker'

module StoryExpress
  class StoryFinder
    def self.deliverables
      project = PivotalTracker::Project.find(ENV['TRACKER_PROJECT_ID'])
      stories = project.stories.all(state: 'finished', story_type: ['bug', 'feature'])
      stories.select do |story|
        GitReader.grep_log(story.id).length > 0
      end
    end
  end
end
