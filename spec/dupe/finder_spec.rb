RSpec.describe Dupe::Finder do
  it "has a version number" do
    expect(Dupe::Finder::VERSION).not_to be nil
  end

  it "filters files" do
    Case = Struct.new(:path, :want)
    cases = [
      Case.new(".dontwant", false),
      Case.new("/home/bob/pics/.dontwant", false),
      Case.new("/home/bob/pics/dowant", true),
      Case.new("/home/bob/pics/dowant/.other", false)
    ]

    cases.each do |c|
      expect(Dupe::Finder::interesting_path? c.path).to eq(c.want)
    end
  end

  it "finds files" do
    base_dir = "test-files/dir"
    want = ["dir2/file3", "dir2/file4", "file1", "file2"]
      .map { |x| base_dir + "/" + x }

    got = Dupe::Finder::interesting_files(base_dir).collect { |x| x }

    # the order is deterministic because the find module sorts its output
    expect(got).to eq(want)
  end

  it "hashes files" do

  end
end
