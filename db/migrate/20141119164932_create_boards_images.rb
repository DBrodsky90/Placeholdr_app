class CreateBoardsImages < ActiveRecord::Migration
  def change
    create_table :boards_images do |t|
    	create_join_table :boards, :images
    end
  end
end
