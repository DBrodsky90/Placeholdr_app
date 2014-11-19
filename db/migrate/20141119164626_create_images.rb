class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.string :title
    	t.text :imgurl
    	t.string :width
    	t.string :height
    	t.string :filesize

    	t.timestamps 
    end
  end
end
