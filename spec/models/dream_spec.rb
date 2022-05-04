require 'rails_helper'

RSpec.describe Dream, type: :model do
  context 'validation tests' do
    
    it "is not valid without a title" do
      dream = Dream.new(nightmare:false, notes:"Failures, so many failures").save
      expect(dream).to eq(false)  
    end 

    it "should save dream" do
      dream = Dream.new(title:"Rails testing", nightmare:true, notes:"Failures, so many failures").save
      expect(dream).to eq(true)
    end
  end
end
