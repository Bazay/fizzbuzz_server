RSpec.describe HomeController, type: :controller do
  let(:params) { {} }

  def dispatch method = :get
    send method, action, params: params
  end

  # TODO: Replace when adding favourite fizzbuzz functionality
  def number_html number
    ":number=&gt;#{number}"
  end

  shared_examples 'paginated collection' do
    render_views

    let(:params) { { per_page: 3, page: page } }
    let(:page) { 1 }

    before { dispatch }

    subject { response.body }

    it { is_expected.to include number_html 1 }
    it { is_expected.to include number_html 3 }
    it { is_expected.to include 'Next' }
    it { is_expected.not_to include number_html 4 }
    it { is_expected.not_to include 'Previous' }

    context 'when on page 2' do
      let(:page) { 2 }

      it { is_expected.to include number_html 4 }
      it { is_expected.to include number_html 6 }
      it { is_expected.to include 'Next' }
      it { is_expected.not_to include number_html 3 }
      it { is_expected.not_to include number_html 7 }
      it { is_expected.to include 'Previous' }
    end
  end

  describe 'GET #index' do
    let(:action) { 'index' }

    subject { dispatch }
      
    it { is_expected.to have_http_status :success }

    it_behaves_like 'paginated collection'
  end
end
