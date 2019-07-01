RSpec.describe Dupe::HashStore do

  it "can be passed hash/path pairs" do
    fakehash, fakepath = 'notahash', '/home/some/path/to/file'

    subject.push(fakehash, fakepath)

    expect(subject.each_pair.map { |k,v| k }).to eq([fakehash])
    expect(subject.each_pair.map { |k,v| v }.flatten).to eq([fakepath])
  end

  it "handles multiple paths with the same hash" do
    fakehash, fakepath = 'notahash', '/home/some/path/to/file'
    paths = 20.times.map {|x| "#{fakepath}#{x}"}

    paths.each {|p| subject.push(fakehash, p)}

    all_pairs = subject.each_pair.map {|k,v| [k,v] }
    expect(all_pairs.count).to eq(1)
    pair = all_pairs[0]
    expect(pair[0]).to eq(fakehash)
    expect(pair[1]).to eq(paths)
  end
end
