RSpec.describe Dupe::TextPrinter do
  it "prints as we'd expect" do
    paths = ["a", "b"]
    want = "Duplicates found on paths:\n\ta\n\tb\n"

    expect{subject.print_dupes paths}.to output(want).to_stdout
  end
end
