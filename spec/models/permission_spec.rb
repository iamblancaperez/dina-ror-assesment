require 'rails_helper'

RSpec.describe Permission, type: :model do
  before :each do
    @permi = Permission.new(name: "PermissionName")
    @role = Role.new
    @role.permissions << @permi
    @user = User.new
    @user.permissions << @permi
  end

  describe "valid attributes" do
    it "is valid with valid attributes" do
      expect(@permi).to be_valid
    end
    
    it "is not valid without a name" do
      @permi.name = nil
      expect(@permi).to_not be_valid
    end


    it "should has and belong to many roles" do
      expect(Permission.reflect_on_association(:roles).macro).to eq :has_and_belongs_to_many
    end

    it "should has and belong to many users" do
      expect(Permission.reflect_on_association(:permissions).macro).to eq :has_and_belongs_to_many
    end
  end
end
