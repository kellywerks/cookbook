class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.belongs_to :recipe
      t.column :rating, :integer

      t.timestamps
    end
  end
end
