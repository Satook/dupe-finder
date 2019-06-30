require 'optparse'

module Dupe
  module Args
    ##
    # Type used to collect command line arguments
    Options = Struct.new(:memmax)

    ##
    # Argument parsing for the main app
    #

    class Parser

      ##
      # parses arguments from `options`
      # will exit 2 on --help
      # will raise an ArgumentError if an argument is invalid
      #

      def self.parse(options)
        args = Options.new("world")

        opt_parser = OptionParser.new do |opts|
          opts.banner = "Usage: dupe-finder [options]"

          opts.on("-mMEMTARGET", "--maxmem=MEM", Integer, "Max MB of memory used for storing file hash data. Minimum 10") do |m|

            if m < 10
              raise "MEMTARGET must be 10 or greater"
            end

            args.memmax = m
          end

          opts.on("-h", "--help", "Prints this help") do
            puts opts
            exit 2
          end
        end

        opt_parser.parse!(options)
        return args
      end
    end # class Parser

  end # module Args
end # module Dupe
