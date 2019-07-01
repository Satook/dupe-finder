
module Dupe

  ##
  # Hash based storage for (filehash, path) pairs
  #
  # Allows fast storage and retreval but will eventually break from OOM
  #

  class HashStore

    ##
    # Starts off empty
    #

    def initialize()
      @hashdict = Hash.new {|h,k| h[k] = []}
    end

    ##
    # Add a new hash/path pair to the store
    #

    def push(hash, path)
      @hashdict[hash] << path

      self
    end

    ##
    # Yields each hash, [path] pair that has been stored.
    #

    def each_pair() # :yield: hash, paths
      block_given? or return enum_for(__method__)

      @hashdict.each_pair do |k, v|
        yield k, v
      end

      self
    end

    ##
    # Perform any necessary filesystem sync before we start reading
    #

    def sync()
      self
    end

  end # class HashStore

end # module Dupe
