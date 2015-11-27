require 'rails_helper'

describe Gif, type: :model do

  describe 'Associations' do
    # Checking if Gif belongs to User
    it { expect(subject.user).to be_nil }
  end

end