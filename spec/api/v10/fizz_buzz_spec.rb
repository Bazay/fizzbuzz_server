RSpec.describe Api::V10::FizzBuzz, type: :request do
  let(:params) { {} }

  def dispatch method = :get
    send method, '/api/v1.0/fizz_buzz', params: params
  end

  describe 'GET /api/v1.0/fizz_buzz' do
    before { dispatch }

    subject { decoded_json_response['fizz_buzzes'] }

    its(:size) { is_expected.to eq 100 }

    shared_examples 'paginated grape api collection' do
      let(:params) { { per_page: per_page } }
      let(:per_page) { 5 }

      its(:size) { is_expected.to eq per_page }
    end

    it_behaves_like 'paginated grape api collection'
  end

  describe 'POST /api/v1.0/fizz_buzz' do
    let(:params) { { fizz_buzz: { number: number, favourite: favourite } } }
    let(:number) { 4 }
    let(:favourite) { true }

    shared_examples 'json fizz buzz response' do
      before { dispatch :post }

      subject { decoded_json_response['fizz_buzz'] }

      its(['number']) { is_expected.to eq number }
      its(['favourite']) { is_expected.to eq favourite }
    end

    it_behaves_like 'json fizz buzz response'

    context 'when fizz buzz exists' do
      let!(:fizz_buzz) { create :fizz_buzz, number: number, favourite: !favourite }

      before { dispatch :post }

      subject { decoded_json_response['fizz_buzz'] }

      it_behaves_like 'json fizz buzz response'
    end
  end
end
