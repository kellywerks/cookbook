class ChangeStarToFloat < ActiveRecord::Migration
  def change
    change_column :recipes, :star, :float
  end
end
