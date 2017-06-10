require 'hanami/interactor'

class SearchParams
  include Hanami::Interactor
  expose :params, :errors

  def initialize(query)
    @query = query
  end

  def call
    @query.gsub!(INVALID_CHARS, '') if @query
    @params = SearchQueryParser.new(@query).call
  end

  private

  INVALID_CHARS = /[^\w:\s+-]/
end
