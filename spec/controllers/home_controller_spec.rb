RSpec.describe HomeController, type: :controller do
  def dispatch method = :get
    send method, action
  end

  describe 'GET #index' do
    let(:action) { 'index' }

    subject { dispatch }
      
    it { is_expected.to have_http_status :success }
  end
end
