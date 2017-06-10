require 'hanami/interactor'

class SearchParams
  include Hanami::Interactor
  expose :params, :error_messages

  def initialize(query)
    @query = query
    @query.gsub!(INVALID_CHARS, '') if @query
  end

  def call
    options = SearchQueryParser.new(@query).call
    @params = options.select { |key, _| VALID_COMMANDS.include?(key) }
  end

  private

  INVALID_CHARS = /[^\w:\s+-]/
  VALID_COMMANDS = %i[author tag lang text]
end
