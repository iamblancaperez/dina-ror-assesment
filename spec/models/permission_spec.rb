require 'rails_helper'

RSpec.describe Permission, type: :model do
  before :each do
    @permi = Permission.new(name: "PermissionName")
    @role = Role.new
    @role.permissions << @permi
  end

  describe "valid attributes" do
    it "is valid with valid attributes" do
      expect(@permi).to be_valid
    end
    
    it "is not valid without a name" do
      @permi.name = nil
      expect(@permi).to_not be_valid
    end

		it "belongs_to role" do
      assoc = Permission.reflect_on_association(:role)
      expect(assoc.macro).to eq :belongs_to
    end

    it "belongs_to user" do
      assoc = Permission.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end
