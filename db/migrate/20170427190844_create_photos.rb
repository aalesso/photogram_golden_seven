class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.text :source #this is the moment to make changes. at this moment is better to change things.
      t.text :caption

      t.timestamps
    end
  end
end
