class AddDeviceAttrToView < ActiveRecord::Migration[7.1]
  def change
    add_column :views, :bot, :boolean
    add_column :views, :device, :string
    add_column :views, :browser, :string
    add_column :views, :browser_version, :string
    add_column :views, :platform, :string
    add_column :views, :platform_version, :string
  end
end
