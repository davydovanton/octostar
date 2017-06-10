RSpec.describe SearchParams do
  let(:result) { SearchParams.new(query).call }
  let(:query) { 'author:plataform lang:ruby tag:rails authentication solution' }

  it { expect(result.params).to eq(text: "authentication solution", author: "plataform", lang: "ruby", tag: "rails") }
  it { expect(result.error_messages).to eq nil }

  context 'when query contain invalid command' do
    let(:query) { 'test:plataform tag:rails solution' }
    it { expect(result.params).to eq(text: "solution", tag: "rails") }
    it { expect(result.error_messages).to eq(['invalid command "test"']) }
  end
end
