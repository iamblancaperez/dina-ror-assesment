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
end