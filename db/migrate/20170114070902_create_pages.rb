class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.string :slug, index: true
      t.text :content
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
