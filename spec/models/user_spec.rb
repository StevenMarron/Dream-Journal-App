require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it "user gets created" do
      user = User.new(email:"test@exmaple.com", encrypted_password:"").save
      expect(user).to eq(true)  
    end
  end
end
