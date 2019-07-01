require 'stringio'

RSpec.describe Dupe::CSVPrinter do
  it "prints as we'd expect" do
    dest = StringIO.new
    paths = ["a", "b", 'path/with/a".quote']
    want = %{"a","b","path/with/a"".quote"\n}
    Dupe::CSVPrinter.new(dest).print_dupes paths

    expect(dest.string).to eq(want)
  end
end
