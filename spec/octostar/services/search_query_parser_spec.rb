RSpec.describe SearchQueryParser do
  let(:search) { SearchQueryParser.new }

  it { expect(SearchQueryParser.new('').call).to eq(text: nil) }
  it { expect(SearchQueryParser.new('text').call).to eq(text: 'text') }
  it { expect(SearchQueryParser.new('author:davydovanton').call).to eq(author: 'davydovanton', text: nil) }
  it { expect(SearchQueryParser.new('author:davydovanton lang:ruby text').call).to eq(author: 'davydovanton', lang: 'ruby', text: 'text') }
  it { expect(SearchQueryParser.new('tag:test tag:other text').call).to eq(tag: %w[test other], text: 'text') }
end
