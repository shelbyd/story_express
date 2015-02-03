require 'spec_helper'

describe StoryExpress do
  it 'has a version number' do
    expect(StoryExpress::VERSION).not_to be nil
  end

  describe '.deliver' do
    it 'delivers all the finished stories' do
      rider = spy(StoryExpress::Rider)
      allow(StoryExpress::Rider).to receive(:new).and_return(rider)
      stories_to_deliver = [double(:story)]
      allow(StoryExpress::StoryFinder).to receive(:deliverables).and_return(stories_to_deliver)

      StoryExpress.deliver

      expect(rider).to have_received(:deliver).with(stories_to_deliver)
    end
  end
end
