class CreateArguments < ActiveRecord::Migration[5.1]
  def change
    create_table :arguments do |t|
      t.text :argument
      t.string :slug, unique: true
      t.boolean :published, default: false
      t.belongs_to :question, index: true
      t.string :language, default: "en"
      t.string :author, default: ""
      t.string :url, default: ""

      t.timestamps
    end
  end
end
