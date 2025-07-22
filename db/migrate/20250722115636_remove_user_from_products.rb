class RemoveUserFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_reference :products, :user, foreign_key: true
  end
end
