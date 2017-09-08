class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
    	t.string  :name
    	t.float   :price
    	t.string  :produced_by
    	t.integer :quantity
    	t.text    :description
        t.boolean :is_cover
        t.timestamps
    end
  end
end
