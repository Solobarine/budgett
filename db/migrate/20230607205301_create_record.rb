class CreateRecord < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.references :group
      t.references :deal
      t.timestamps
    end
  end
end
