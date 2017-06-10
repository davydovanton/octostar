RSpec.describe SearchParams do
  let(:result) { SearchParams.new(query).call }
  let(:query) { 'author:plataform lang:ruby tag:rails authentication solution' }

  it { expect(result.params).to eq(text: 'authentication solution', author: 'plataform', lang: 'ruby', tag: 'rails') }
  it { expect(result.error_messages).to eq [] }

  context 'when query contain invalid command' do
    let(:query) { 'test:platform other:other tag:rails solution' }

    it { expect(result.params).to eq(text: 'solution', tag: 'rails') }
    it { expect(result.error_messages).to eq(['test:platform', 'other:other']) }
  end
end
