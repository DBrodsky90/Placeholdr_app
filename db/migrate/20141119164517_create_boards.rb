class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
    	t.string :name
    	t.string :theme
    	t.boolean :public
    	t.references :user

    	t.timestamps
    end
  end
end
