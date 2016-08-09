class CreateErrands < ActiveRecord::Migration[5.0]
  def change
    create_table :errands do |t|
      t.string :description, null: false
      t.boolean :completed, null: false, default: false
      t.references :user, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
