RSpec.describe FizzBuzzGenerator, type: :request do
  using Refinements::Array::Formatter

  let(:generator) { described_class.new }

  describe '#generate' do
    let(:generator_args) { [to] }
    let(:to) { 15 }
    let :expected_array do
      [nil, nil, 'FIZZ', nil, 'BUZZ', 'FIZZ', nil, nil, 'FIZZ', 'BUZZ', nil, 'FIZZ', nil, nil, 'FIZZBUZZ']
    end

    subject { generator.generate *generator_args }

    it { expect(subject.map(&:classification)).to match_array expected_array }

    context "when 'from' argument provided" do
      let(:generator_args) { [to, from] }
      let(:from) { 5 }
      let :expected_array do
        ['BUZZ', 'FIZZ', nil, nil, 'FIZZ', 'BUZZ', nil, 'FIZZ', nil, nil, 'FIZZBUZZ']
      end

      it { expect(subject.map(&:classification)).to match_array expected_array }
    end
  end
end
