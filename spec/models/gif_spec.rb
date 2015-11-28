require 'rails_helper'

describe Gif, type: :model do

  describe 'Associations' do
    # Checking if Gif belongs to User
    it { expect(subject.user).to be_nil }
  end

  describe 'Validate url presence' do
    subject{ build(:gif, url: nil) }

    it { expect(subject).not_to be_valid }
  end

  describe 'Validate gif_api_id uniquenes' do
    let(:existing_gif){ create(:gif) }
    subject{ build(:gif, gif_api_id: existing_gif.gif_api_id) }

    it { expect(subject).not_to be_valid }
  end

  describe '#complete_info brings gif info from Giphy API and stores in info attr' do
    subject{ create(:gif, gif_api_id: 'FiGiRei2ICzzG') }
    stub_gifs_request

    it do
      subject.complete_info
      expect(subject.info).not_to be_nil
    end
  end

end