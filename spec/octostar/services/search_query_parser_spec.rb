RSpec.describe Services::SearchQueryParser do
  it { expect(Services::SearchQueryParser.new('').call).to eq(text: nil) }
  it { expect(Services::SearchQueryParser.new('text').call).to eq(text: 'text') }
  it { expect(Services::SearchQueryParser.new('author:davydovanton').call).to eq(author: 'davydovanton', text: nil) }
  it { expect(Services::SearchQueryParser.new('author:davydovanton lang:ruby text').call).to eq(author: 'davydovanton', lang: 'ruby', text: 'text') }
  it { expect(Services::SearchQueryParser.new(' author:davydovanton lang:ruby text').call).to eq(author: 'davydovanton', lang: 'ruby', text: 'text') }
  it { expect(Services::SearchQueryParser.new('tag:test tag:other text').call).to eq(tag: %w[test other], text: 'text') }
end
