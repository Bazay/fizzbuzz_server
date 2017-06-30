RSpec.describe Api::V10::FizzBuzz, type: :request do
  let(:params) { {} }

  def dispatch method = :get
    send method, "/api/v1.0/#{path}"
  end

  describe 'GET /api/v1.0/fizz_buzz' do
    let(:path) { 'fizz_buzz' }

    before { dispatch }

    subject { decoded_json_response }

    its(:size) { is_expected.to eq 100 }
  end
end
