require 'rails_helper'

describe HomeController, type: :controller do

  context 'routes' do
    subject{ get :index }

    it { expect(subject).to be_success }
  end

end
