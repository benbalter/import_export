module ImportExport
  class Source

    SOURCES = {
      "DPL" => "Denied Persons List",
      "EL"  => "Entity List",
      "FSE" => "Foreign Sanctions Evaders",
      "DTC" => "ITAR Debarred",
      "ISA" => "Non-SDN Iranian Sanctions Act List",
      "ISN" => "Nonproliferation Sanctions",
      "PLC" => "Palestinian Legislative Council List",
      "561" => "Part 561 List",
      "SSI" => "Sectoral Sanctions Identifications List",
      "SDN" => "Specially Designated Nationals",
      "UVL" => "Unverified List"
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
