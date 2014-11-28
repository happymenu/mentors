class AddCurrentTimeToSystemSettings < ActiveRecord::Migration
  def change
    add_column :system_settings, :current_time, :string
    add_column :system_settings, :string, :string
  end
end
