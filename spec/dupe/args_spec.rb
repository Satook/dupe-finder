RSpec.describe Dupe::Args do
  it "handles short max mem" do
      expect(Dupe::Args::Parser.parse(['-m','100']).memmax).to eq(100)
  end
end
