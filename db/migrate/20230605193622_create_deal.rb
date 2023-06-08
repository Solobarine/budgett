class CreateDeal < ActiveRecord::Migration[7.0]
  def change
    create_table :deals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
