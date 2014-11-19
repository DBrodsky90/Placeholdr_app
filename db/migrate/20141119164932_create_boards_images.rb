class CreateBoardsImages < ActiveRecord::Migration
  def change
    	create_join_table :boards, :images
    end
  end
end
