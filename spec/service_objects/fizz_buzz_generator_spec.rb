RSpec.describe FizzBuzzGenerator, type: :request do
  using Refinements::Array::Formatter

  let(:generator) { described_class.new }

  describe '#generate' do
    let(:generator_args) { [to] }
    let(:to) { 15 }
    let :expected_array do
      [nil, nil, 'Fizz', nil, 'Buzz', 'Fizz', nil, nil, 'Fizz', 'Buzz', nil, 'Fizz', nil, nil, 'FizzBuzz']
    end

    subject { generator.generate *generator_args }

    it { expect(subject.map_key!(:type)).to match_array expected_array }

    context "when 'from' argument provided" do
      let(:generator_args) { [to, from] }
      let(:from) { 5 }
      let :expected_array do
        ['Buzz', 'Fizz', nil, nil, 'Fizz', 'Buzz', nil, 'Fizz', nil, nil, 'FizzBuzz']
      end

      it { expect(subject.map_key!(:type)).to match_array expected_array }
    end
  end
end
