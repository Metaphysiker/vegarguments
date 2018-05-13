class CreateArguments < ActiveRecord::Migration[5.1]
  def change
    create_table :arguments do |t|
      t.string :title
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
