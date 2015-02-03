require 'spec_helper'

describe StoryExpress::Rider do
  describe '#deliver' do
    let(:stories) do
      [
          spy(:story_1, notes: spy(:story_1_notes)),
          spy(:story_2, notes: spy(:story_2_notes)),
          spy(:story_3, notes: spy(:story_3_notes)),
      ]
    end

    it 'updates each story to delivered' do
      subject.deliver stories

      stories.each do |story|
        expect(story).to have_received(:update).with({'current_state' => 'delivered'})
      end
    end

    it 'adds a note that each story was delivered by Story Express' do
      subject.deliver stories

      stories.each do |story|
        expect(story.notes).to have_received(:create).with(text: 'Delivered by (Story Express)[https://github.com/shelbyd/story_express].')
      end
    end
  end
end
