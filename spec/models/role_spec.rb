require 'rails_helper'

RSpec.describe Role, type: :model do
  before :each do
    @role = Role.new(name: "RoleName")
  end

  describe "valid attributes" do
    it "is valid with valid attributes" do
      expect(@role).to be_valid
    end
    it "is not valid without a name" do
      @role.name = nil
      expect(@role).to_not be_valid
    end
  end

  describe "associations" do
    it "should has_many and belongs to many :permissions" do
      expect(Role.reflect_on_association(:permissions).macro).to eq :has_and_belongs_to_many
    end
  end

  describe "start with letter" do

    it "NOT WORKING should return all the roles start with letter" do
      @role2 = Role.new(name: "RoleName2")
      @role3 = Role.new(name: "My RoleName2")

      @roles_start_with_r = Role.start_with("r")
      
      expect( @roles_start_with_r).should include(@role, @role2)
      expect( @roles_start_with_r).to have_exactly(2).items
    end
  end
end