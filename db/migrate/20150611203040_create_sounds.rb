class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
      t.string :name
      t.attachment :soundfile

      t.timestamps null: false
    end
  end
end
