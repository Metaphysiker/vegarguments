class AddTitleToArguments < ActiveRecord::Migration[5.1]
  def change
    add_column :arguments, :title, :string, default: ""
  end
end
