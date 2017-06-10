require 'hanami/interactor'

class SearchParams
  include Hanami::Interactor
  expose :params, :error_messages

  def initialize(query)
    @query = query
  end

  def call
    @query.gsub!(INVALID_CHARS, '') if @query
    @params = SearchQueryParser.new(@query).call
  end

  private

  INVALID_CHARS = /[^\w:\s+-]/
  VALID_COMMANDS = %i[author tag lang text]
end
