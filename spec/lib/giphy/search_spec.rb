require 'rails_helper'

describe Giphy::Search do
  stub_search_request

  describe '#search' do

    context 'search for terms' do
      subject{ Giphy::Search.new.search({ q: 'funny dogs' }) }

      it do
        subject
        expect(a_request(:get, /api.giphy.com\/v1\/gifs\/search/)).to have_been_made
      end

      it { expect(subject).to eq(response) }
    end

    context 'paginate with search endpoint' do
      subject{ Giphy::Search.new.search({ q: 'funny dogs', offset: 1 }) }

      it do
        subject
        expect(a_request(:get, /offset=1/)).to have_been_made
      end
    end

  end

  describe '#pagination' do
    # Pagination info is available in the search instance object. 
    # The Value for this example is specified in the fixture file.
    subject { Giphy::Search.new }
    before do
      subject.search({ q: 'funny dogs' })
    end
    
    it { expect(subject.pagination).to eq({ "total_count" => 1947, "count" => 25, "offset" => 0 }) }
  end

end