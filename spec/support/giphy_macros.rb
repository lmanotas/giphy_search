module GiphyMacros
  def signed_user
    let(:user){ create(:user) }

    before do
      begin
        sign_in :user, user
        @request.env["devise.mapping"] = Devise.mappings[:user]
      rescue
        login_as(user, :scope => :user)
      end
    end
  end

  def stub_search_request
    let(:response_body){ File.read(File.join(Rails.root, 'spec', 'fixtures', 'giphy_search_response.json')) }
    let(:response){ JSON.parse(response_body)["data"] }

    before do
      stub_request(:get, /api.giphy.com/).to_return(body: response_body)
    end
  end
end