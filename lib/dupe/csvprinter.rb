require "csv"

module Dupe

##
# Prints dupe groups as quoted, comma separated lines
#
# Each path is always quoted instead of only quoting when a " is present in the
# path name.
#

class CSVPrinter

  ##
  # Will print
  #

  def initialize(dest)
    @writer = CSV.new(dest, :force_quotes => true)
  end

  ##
  # Print the file paths for a group of duplicate
  #

  def print_dupes(paths)
    @writer << CSV::Row.new([], paths)
  end

end # class CSVPrinter

end # module Dupe
