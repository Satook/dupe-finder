require 'stringio'

RSpec.describe Dupe::TextPrinter do
  it "prints as we'd expect" do
    dest = StringIO.new
    paths = ["a", "b"]
    want = "Duplicates found on paths:\n\ta\n\tb\n"
    Dupe::TextPrinter.new(dest).print_dupes paths

    expect(dest.string).to eq(want)
  end
end
