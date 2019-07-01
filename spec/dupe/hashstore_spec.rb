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
end
