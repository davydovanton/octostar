require 'strscan'

class SearchQueryParser
  OPTION_TOKEN = /\w+:\w+/
  SPASE_TOKEN = /\s/

  SEPARATOR_CHAR = ':'

  def initialize(query)
    @scanner = StringScanner.new(query.to_s)
    @options = {}
  end

  def call
    scan_options
    text = scanner.scan(/.+/)
    { text: text, **options }
  end

  private

  def scan_options
    while token = scanner.scan(OPTION_TOKEN)
      process_option_toker(options, token)
      scanner.scan(SPASE_TOKEN)
    end
  end

  def process_option_toker(options, token)
    node, value = token.split(SEPARATOR_CHAR)

    if options[node.to_sym]
      options[node.to_sym] = Array(options[node.to_sym]) << value
    else
      options[node.to_sym] = value
    end
  end

  attr_reader :options, :scanner
end
