RSpec.describe Dupe::Finder do
  it "has a version number" do
    expect(Dupe::Finder::VERSION).not_to be nil
  end

  it "filters files" do
    FCase = Struct.new(:path, :want)
    cases = [
      FCase.new(".dontwant", false),
      FCase.new("/home/bob/pics/.dontwant", false),
      FCase.new("/home/bob/pics/dowant", true),
      FCase.new("/home/bob/pics/dowant/.other", false)
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
    HCase = Struct.new(:path, :hexdigest)
    base_path = "test-files/digest/"
    test_files = [
      HCase.new("test1.txt", "3e62b4bd08faa9bce87955c15fd8e6152d12cfca6a3961e93ace96575156c8bf"),
      HCase.new("test2.txt", "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
    ].map { |x| HCase.new(base_path + x.path, x.hexdigest) }

    test_files.each do |x|
      got = Dupe::Finder.file_digest(x.path).unpack('H*').first
      expect(got).to eq(x.hexdigest)
    end
  end
end
