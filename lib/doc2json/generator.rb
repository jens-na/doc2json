module Doc2Json

  require 'yard'
  require 'json'
  require 'fileutils'

  class Generator

    attr_reader :input
    attr_reader :output
    attr_reader :options

    # Creates a new generator to output documentation in JSON
    #
    # input- the input file pattern as an array which will be passed to Yard
    # output - the output directory where to store the JSON files, defaults to doc/json
    # options - an options hash
    def initialize(input = ["{lib,app}/**/*.rb", "ext/**/*.c"], output = "doc/json", options = {})
      @input = input
      @output = output
      @options = options
    end

    # Generates the JSON API and outputs the data to the output
    # directory.
    def generate
      classes = registry.all(:class)
      classes.each do |c|
        data = methods(c)
        output(data, c.to_s)
      end
    end

    private

    # Outputs the data for the given class name to file.
    # Creates directories where neccessary.
    #
    # data - the data to write (a hash)
    # classname - the classname which is used as filename
    def output(data, classname)
      sanitized = File.join(@output, classname.gsub('::', '/')).downcase
      path = Pathname(sanitized).dirname
      FileUtils.mkdir_p path.to_s unless path.exist?

      File.open("#{sanitized}.json", "w") do |f|
        f.write(JSON.pretty_generate(data))
      end
    end

    # Creates a hash with all the methods inside a class
    #
    # c - the class object of Yard
    #
    # Returns a hash. For example:
    #   "generate" => "Generates the JSON API"
    def methods(c)
      data = Hash.new
      c.children.each do |m|
        data[m.name] = m.base_docstring
      end
      data
    end

    # Generates a Yard registry with the specified input file pattern,
    # passed in the constructor
    def registry
      YARD::Registry.load(@input, true)
    end

  end
end
