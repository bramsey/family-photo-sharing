class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :file

      t.timestamps
    end
  end
end
