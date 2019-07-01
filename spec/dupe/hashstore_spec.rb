RSpec.describe Dupe::HashStore do

  before(:example) do
    @hs = Dupe::HashStore.new()
  end

  it "can be passed hash/path pairs" do
    fakehash, fakepath = 'notahash', '/home/some/path/to/file'

    @hs.push(fakehash, fakepath)

    expect(@hs.each_pair.map { |k,v| k }).to eq([fakehash])
    expect(@hs.each_pair.map { |k,v| v }.flatten).to eq([fakepath])
  end

  it "handles multiple paths with the same hash" do
    fakehash, fakepath = 'notahash', '/home/some/path/to/file'
    paths = 20.times.map {|x| "#{fakepath}#{x}"}

    paths.each {|p| @hs.push(fakehash, p)}

    all_pairs = @hs.each_pair.map {|k,v| [k,v] }
    expect(all_pairs.count).to eq(1)
    pair = all_pairs[0]
    expect(pair[0]).to eq(fakehash)
    expect(pair[1]).to eq(paths)
  end
end
