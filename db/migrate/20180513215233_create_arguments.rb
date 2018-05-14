class CreateArguments < ActiveRecord::Migration[5.1]
  def change
    create_table :arguments do |t|
      t.string :question
      t.text :quickanswer
      t.text :longanswer

      t.timestamps
    end
  end
end
