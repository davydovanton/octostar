RSpec.describe SearchQueryParser do
  let(:search) { SearchQueryParser.new }

  it { expect(search.call('')).to eq({}) }
  it { expect(search.call('text')).to eq(author: nil, text: 'text') }
  it { expect(search.call('author:davydovanton')).to eq(author: 'davydovanton', text: nil) }
  it { expect(search.call('author:davydovanton text')).to eq(author: 'davydovanton', text: 'text') }
end
