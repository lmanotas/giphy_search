require 'rails_helper'

describe GifsController, type: :controller do
  signed_user

  context 'Search for gifs' do
    subject{ xhr :post, :search, search: { q: 'funny gifs' } }
    stub_search_request

    it { expect(subject).to be_success }

    it { lambda{ expect_any_instance_of(Giphy::Search).to receive(:search).with('funny gifs') } }
  end

  context 'Save gif' do
    subject { xhr :post, :create, gif: { tags: 'funny, cat', gif_api_id: 'FiGiRei2ICzzG' } }

    it { expect{ subject }.to change(user.gifs, :count).by(1) }
  end

  context 'List saved gifs' do
    subject { get :index }

    it { expect(subject).to be_success }
  end
end