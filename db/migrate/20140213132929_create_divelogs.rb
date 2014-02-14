class CreateDivelogs < ActiveRecord::Migration
  def change
    create_table :divelogs do |t|
      t.datetime :date
      t.string :point
      t.text :description
      t.string :picture
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
