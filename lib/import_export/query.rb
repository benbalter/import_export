module ImportExport
  class Query

    class << self
      def countries
        @countries ||= IsoCountryCodes.all.map { |c| c.alpha2 }
      end

      def endpoint
        @endpoint ||= URI.join(ImportExport::API_BASE, "search").to_s
      end
    end

    PARAMETERS = {
      :q          => nil,
      :sources    => Source.keys,
      :countries  => Query.countries,
      :address    => nil,
      :name       => nil,
      :fuzzy_name => false,
      :type       => nil,
      :size       => 100,
      :offset     => 0
    }

    TYPES = %w[
      Individual
      Entity
      Vessel
    ]

    def initialize(params, api_key)
      params = { :q => params } if params.is_a? String
      @params = PARAMETERS.merge(params)
      @api_key = api_key

      if invalid = @params.find { |key,value| !PARAMETERS.keys.include?(key) }
        raise ArgumentError, "Invalid parameter: #{invalid[0]}"
      end

      if invalid = @params[:sources].find { |source| !Source.find_by_key(source) }
        raise ArgumentError, "Invalid source: #{invalid}"
      end

      if invalid = @params[:countries].find { |country| !Query.countries.include?(country) }
        raise ArgumentError, "Invalid country: #{invalid}"
      end

      if invalid = !UUID.validate(api_key)
        raise ArgumentError, "Invalid API key: #{invalid}"
      end
    end

    def call
      RestClient.get Query.endpoint, {
        :params => params,
        "Authorization" => "Bearer #{@api_key}",
        "User-Agent" => ImportExport.user_agent
      }
    end

    private

    def params
      params = @params.clone
      params[:countries] = params[:countries].join(",")
      params[:sources]   = params[:sources].join(",")
      params.reject { |k,v| v.nil? }
    end
  end
end
