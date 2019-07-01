require 'optparse'

module Dupe
  module Args
    ##
    # Type used to collect command line arguments
    Options = Struct.new(:memmax, :csv, :path)

    ##
    # parses arguments from `options`
    # will exit 2 on --help
    # will raise an ArgumentError if an argument is invalid
    #

    def Args.parse(options)
      args = Options.new(100, false)

      opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: dupe-finder [options] SEARCHDIR"

        opts.on("-nMEMTARGET", "--maxmem=MEM", Integer, "Max MB of memory used for storing file hash data. Minimum 10") do |m|

          if m < 10
            raise "MEMTARGET must be 10 or greater"
          end

          args.memmax = m
        end

        opts.on("-c", "--csv", "Print groups of duplicates on a single line") do
          args.csv = true
        end

        opts.on("-h", "--help", "Prints help") do
          puts opts
          exit 2
        end
      end

      rest = opt_parser.parse!(options)

      args.path = rest.pop
      if args.path === nil or !FileTest.directory?(args.path)
        puts opt_parser
        exit 2
      end

      args
    end

  end # module Args
end # module Dupe
