class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :language, default: "en"
      t.string :slug, unique: true
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
