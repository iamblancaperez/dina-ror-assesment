require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: "UserName", status: "status")
  end

  describe "valid attributes" do
    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end
    it "is not valid without a name" do
      @user.name = nil
      expect(@user).to_not be_valid
    end
    it "is not valid without a status" do
      @user.status= nil
      expect(@user).to_not be_valid
    end
  end

  describe "associations" do
    it "should has and belong to many permissions" do
      expect(User.reflect_on_association(:permissions).macro).to eq :has_and_belongs_to_many
    end  

    it "should has_many :permissions through role" do
      should have_many(:role_permissions).through(:role)
    end
  end

  it "should return all permissions of a user" do
    @role = Role.new(name: "One Role")
    
    @role_permission = Permission.new(name: "Role Permission")
    @role.permissions << @role_permission

    @role.users << @user

    @permission = Permission.new(name: "Regular Permission")
    @user.permissions << @permission

    @user.all_permissions.should include (@permission)
    @user.all_permissions.should include (@role_permission)
  end
end
