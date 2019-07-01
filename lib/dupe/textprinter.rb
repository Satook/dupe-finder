
module Dupe

##
# Prints out in a human readable format
#

class TextPrinter

  ##
  # Sets up the printer to write its output to `dest`
  #

  def initialize(dest)
    @dest = dest
  end

  ##
  # Print the file paths for a group of duplicate
  #

  def print_dupes(paths)
    @dest.puts "Duplicates found on paths:"
    @dest.puts paths.map { |p| "\t#{p}" }
  end

end # class TextPrinter

end # module Dupe
