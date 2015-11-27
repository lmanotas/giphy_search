require 'rails_helper'

describe GifsController, type: :controller do

  context 'search for gifs' do
    subject{ post :search, search: { q: 'funny gifs' } }
    stub_search_request

    it { expect(subject).to be_success }

    it { lambda{ expect_any_instance_of(Giphy::Search).to receive(:search).with('funny gifs') } }
  end
end