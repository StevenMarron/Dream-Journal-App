class UpdateUsers < ActiveRecord::Migration[7.0]
  def change
    @u = User.find_by( email: 'stevomarron@hotmail.com')
    @u.update_attribute :admin, true
  end
end
