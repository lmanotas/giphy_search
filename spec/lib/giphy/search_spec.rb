require 'rails_helper'

describe Giphy::Search do

  describe '#search' do

    subject{ Giphy::Search.new.search('funny dogs') }
    let(:response_body){ File.read(File.join(Rails.root, 'spec', 'fixtures', 'giphy_search_response.json')) }
    let(:response){ JSON.parse(response_body) }

    before do
      stub_request(:get, /api.giphy.com/).to_return(body: response_body)
    end

    it do
      subject
      expect(a_request(:get, /api.giphy.com\/v1\/gifs\/search/)).to have_been_made
    end

    it { expect(subject).to eq(response) }

  end

end