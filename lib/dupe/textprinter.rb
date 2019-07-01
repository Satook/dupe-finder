
module Dupe

class TextPrinter
  def print_dupes(paths)
    puts "Duplicates found on paths:"
    paths.each { |p| puts "\t#{p}"}
  end

end # class TextPrinter

end # module Dupe
