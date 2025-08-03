class AddApiIdToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :api_id, :integer
  end
end
