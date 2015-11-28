require 'rails_helper'

describe GifsController, type: :controller do
  signed_user

  context 'Search for gifs' do
    subject{ get :search, q: 'funny gifs' }
    stub_search_request

    it { expect(subject).to be_success }

    it { lambda{ expect_any_instance_of(Giphy::Search).to receive(:search).with('funny gifs') } }
  end

  context 'Pagination on search action' do
    stub_search_request

    it do
      stub = stub_request(:get, /offset=1/).to_return(body: response_body)
      get :search, q: 'funny gifs', offset: 1
      expect(stub).to have_been_requested
    end

  end

  context 'Save gif' do
    subject { xhr :post, :create, gif: { tags: 'funny, cat', gif_api_id: 'FiGiRei2ICzzG', url: 'http://giphy/gif/url.gif' } }

    it { expect{ subject }.to change(user.gifs, :count).by(1) }
  end

  context 'List saved gifs' do
    subject { get :index }

    it { expect(subject).to be_success }
  end
end