RSpec.describe Dupe::Args do
  it "requires a path" do
    expect{ Dupe::Args::parse([]) }.to raise_error SystemExit
  end

  it "handles short max mem" do
    expect(Dupe::Args::parse(['-m','100', '/']).memmax).to eq 100
  end

  it "handles csv output" do
    expect(Dupe::Args::parse(['-c', '/']).csv).to eq true
  end
end
