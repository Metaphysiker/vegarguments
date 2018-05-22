class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :slug, unique: true

      t.timestamps
    end
  end
end
