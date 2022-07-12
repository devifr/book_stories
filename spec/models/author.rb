require 'rails_helper'

RSpec.describe Author, type: :model do

  subject {
  	described_class.new(name: "Author Name")
  }

  describe "Validations" do
  	it "is valid with valid attribute" do
  		expect(subject).to be_valid
  	end

  	it "is not valid without name" do
	  	subject.name = nil
  		expect(subject).to_not be_valid
  	end
  end

  describe "Associations" do
  	it { should have_many(:books).without_validating_presence }
  	it { should have_many(:social_sources).without_validating_presence }
  end

end