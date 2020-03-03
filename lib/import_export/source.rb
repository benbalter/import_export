module ImportExport
  class Source

    SOURCES = {
      "CAP" => "Correspondent Account or Payable-Through Account Sanctions (CAPTA)",
      "DPL" => "Denied Persons List",
      "DTC" => "ITAR Debarred",
      "EL"  => "Entity List",
      "FSE" => "Foreign Sanctions Evaders",
      "ISN" => "Nonproliferation Sanctions",
      "PIB" => "Persons Identified as Blocked",
      "PLC" => "Palestinian Legislative Council List",
      "SDN" => "Specially Designated Nationals",
      "SSI" => "Sectoral Sanctions Identifications List",
      "UVL" => "Unverified List",
      "561" => "Part 561 List"
    }

    class << self
      def all
        @all ||= SOURCES.map { |key, value| self.new(key) }
      end

      def find_by_key(key)
        all.find { |source| source.key == key }
      end
      alias_method :[], :find_by_key

      def find_by_name(name)
        all.find { |source| source.name == name }
      end

      def keys
        @keys ||= SOURCES.keys
      end
    end

    attr_reader :key

    def initialize(key)
      @key = key
    end

    def inspect
      "#<ImportExport::Source key=\"#{key}\" name=\"#{name}\">"
    end

    def name
      SOURCES[key]
    end
  end
end
