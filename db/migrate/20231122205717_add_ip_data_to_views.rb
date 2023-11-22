class AddIpDataToViews < ActiveRecord::Migration[7.1]
  def change
    remove_column :views, :ip_data
    add_column :views, :city, :string
    add_column :views, :region, :string
    add_column :views, :country, :string
    add_column :views, :loc, :string
    add_column :views, :timezone, :string
  end
end
