class CreateCatches < ActiveRecord::Migration[7.0]
  def change
    create_table :catches do |t|
      t.string :name
      t.string :place
      t.float :weight
      t.datetime :date
      t.float :size

      t.timestamps
    end
  end
end
