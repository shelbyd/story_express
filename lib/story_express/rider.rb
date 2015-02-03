module StoryExpress
  class Rider
    def deliver(stories)
      stories.each do |story|
        story.notes.create text: 'Delivered by (Story Express)[https://github.com/shelbyd/story_express].'
        story.update 'current_state' => 'delivered'
      end
    end
  end
end