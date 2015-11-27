require 'rails_helper'

describe User, type: :model do
  describe 'Associations' do
    # Checking if User has many Gifs
    it { expect(subject.gifs).to be_empty }
  end
end
