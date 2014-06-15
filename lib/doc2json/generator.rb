module Doc2Json

  class Generator

    attr_reader :input
    attr_reader :output
    attr_reader :options

    def initialize(input = "lib/**/*.rb", output = "doc/json", options = {})
      @input = input
    end

    def generate
      create_yardoc(@input) 
    end

    private

    def create_yardoc(input)
      YARD.parse(File.expand_path(input))
    end

  end
end
