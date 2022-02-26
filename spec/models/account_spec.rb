RSpec.describe Account do
  describe "associations" do
    it {is_expected.to have_many :users }
  end

  describe "self.valid? to an empty payload" do
    it {expect(Account.valid? "").to be_falsy}
  end
  
  describe "to a non empty payload" do
    it {expect(Account.valid? "a").to be_truthy}
  end
end
