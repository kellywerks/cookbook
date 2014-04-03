class CreateTables < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.column :name, :string
      t.column :text, :text
      t.column :star, :integer

      t.timestamps
    end

    create_table :tags do |t|
      t.column :name, :string
    end

    create_table :recipes_tags do |t|
      t.column :recipe_id, :integer
      t.column :tag_id, :integer
    end
  end
end
