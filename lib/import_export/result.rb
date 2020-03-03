# frozen_string_literal: true

module ImportExport
  class Result
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def inspect
      "#<ImportExport::Result name=\"#{name}\">"
    end

    def method_missing(method_sym, *arguments, &block)
      if data.key?(method_sym.to_s)
        data[method_sym.to_s]
      else
        super
      end
    end

    def respond_to?(method_sym, include_private = false)
      if data.key?(method_sym.to_s)
        true
      else
        super
      end
    end
  end
end
