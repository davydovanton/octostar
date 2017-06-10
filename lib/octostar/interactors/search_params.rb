require 'hanami/interactor'

class SearchParams
  include Hanami::Interactor
  expose :params, :error_messages

  def initialize(query)
    @query = query

    @params = {}
    @error_messages = []
  end

  def call
    @query.gsub!(INVALID_CHARS, '') if @query

    SearchQueryParser.new(@query).call.each do |key, value|
      if VALID_COMMANDS.include?(key)
        @params[key] = value
      else
        @error_messages << "#{key}:#{value}"
      end
    end
  end

  private

  INVALID_CHARS = /[^\w:\s+-]/
  VALID_COMMANDS = %i[author tag lang text]
end
