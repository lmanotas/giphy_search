require 'rails_helper'

describe Giphy::Search do

  describe '#search' do

    subject{ Giphy::Search.new.search('funny dogs') }
    stub_search_request

    it { lambda{ expect(a_request(:get, /api.giphy.com\/v1\/gifs\/search/)).to have_been_made } }

    it { expect(subject).to eq(response) }

  end

end