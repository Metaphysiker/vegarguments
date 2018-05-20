class AddPublishedToArguments < ActiveRecord::Migration[5.1]
  def change
    add_column :arguments, :published, :boolean, default: false
  end
end
