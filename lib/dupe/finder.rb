require "find"
require "digest"

module Dupe
  module Finder

    ##
    # Returns false if we should ignore the directory or file
    #
    # Mainly, we ignore . files and directories.
    #

    def Finder.interesting_path?(path)
      # we want to ignore dot files
      File.basename(path)[0] != ?.
    end

    ##
    # Recurses a directory yielding files that are interesting, to us
    #
    # If a block is given, it is called with each file path. Otherwise an
    # enumerator is returned.
    #

    def Finder.interesting_files(path) # :yield: path
      block_given? or return enum_for(__method__, path)

      Find.find(path) do |path|
        if !interesting_path?(path)
          Find.prune
        elsif FileTest.directory?(path)
          next
        else
          yield path
        end
      end
      nil
    end

    ##
    # Calculates the SHA-256 digest of a file and returns it as a byte array
    #

    def Finder.file_digest(path)
      Digest::SHA2.new().file(path).digest
    end

    #
    # TODO: set up filters
    # get sequence of file paths

    #
    # hash files
    # store hashes
    # let hash store sync
    #
    # iterate over (hash, [path]) pairs
    # set hash to ignored
    # print dupes
    #

  end # module Dupe
end # module Finder
