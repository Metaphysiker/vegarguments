class AddTagsToArguments < ActiveRecord::Migration[5.1]
  def change
    add_column :arguments, :kind, :string, default: "original"
    add_column :arguments, :language, :string, default: "en"
  end
end
