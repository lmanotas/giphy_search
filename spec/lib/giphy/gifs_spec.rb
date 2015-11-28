require 'rails_helper'

describe Giphy::Gifs do
  stub_gifs_request

  describe '#get' do

    context 'find gif by id' do
      subject{ Giphy::Gifs.new.get('FiGiRei2ICzzG') }

      it do
        subject
        expect(a_request(:get, /gifs\/FiGiRei2ICzzG/)).to have_been_made
      end

      it { expect(subject).to eq(response) }
    end
  end
end