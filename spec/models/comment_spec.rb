# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe 'relation' do
    it { expect(subject).to belong_to(:author).optional(false).class_name(User.name) }
  end

  describe 'validation' do
    it do
      expect(subject).to validate_presence_of(:title)
      expect(subject).to validate_presence_of(:body)
      expect(subject).to validate_presence_of(:author_id)
    end
  end
end
