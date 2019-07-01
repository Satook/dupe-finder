
module Dupe

  ##
  # Hash based storage for (filehash, path) pairs
  #
  # Allows fast storage and retreval but will eventually break from OOM
  #

  class HashStore

    def initialize()
      @hashdict = Hash.new {|h,k| h[k] = []}
    end

    def hashdict
      @hashdict
    end

    def push(hash, path)
      @hashdict[hash] << path
    end

    def each_pair() # :yield: hash
      block_given? or return enum_for(__method__)

      @hashdict.each_pair do |k, v|
        print k, v
        yield k, v
      end
    end

  end # class HashStore

end # module Dupe
