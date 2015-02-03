require 'story_express/version'
require 'story_express/rider'
require 'story_express/story_finder'
require 'story_express/git_reader'

module StoryExpress
  def self.deliver
    Rider.new.deliver StoryFinder.deliverables
  end
end
