class AddPrettyNameToEvents < ActiveRecord::Migration
  def change
    add_column :events, :pretty_name, :string
  end
end
