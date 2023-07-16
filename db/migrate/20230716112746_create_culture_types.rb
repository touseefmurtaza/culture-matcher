class CreateCultureTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :culture_types do |t|
      t.string :name, unique: true, null: false

      t.timestamps
    end
    add_index :culture_types, :name
  end
end
