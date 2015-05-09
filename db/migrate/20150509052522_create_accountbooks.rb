class CreateAccountbooks < ActiveRecord::Migration
  def change
    create_table :accountbooks do |t|
    	t.integer :cost
    	t.string :kind
    	t.integer :user_id
      t.timestamps null: false
    end
  end
end
