class SearchQueryParser
  AUTHOR_REGEXP = /.*author\:(\w+)(\s.+)?/
  EMPTY_STRING = ''

  def call(text)
    return {} if text.nil? || text.empty?

    author = text[AUTHOR_REGEXP] && $1
    text = text.sub(/author:#{author}\s?/, EMPTY_STRING) if author
    text = nil if text.empty?

    {
      author: author,
      text: text
    }
  end
end
