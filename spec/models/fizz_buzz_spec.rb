RSpec.describe FizzBuzz, type: :model do
  let!(:fizz_buzz) { create :fizz_buzz }

  describe 'validations' do
    subject { fizz_buzz }

    it { is_expected.to be_persisted }

    context 'when number already exists' do
      let(:fizz_buzz) { build :fizz_buzz, number: 1 }
      let!(:existing_fizz_buzz) { create :fizz_buzz, number: 1 }

      it { is_expected.to have(1).error_on :number }
    end
  end
end
