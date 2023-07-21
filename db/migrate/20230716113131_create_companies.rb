# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.references :culture_type, foreign_key: true

      t.timestamps
    end
  end
end
