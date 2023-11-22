class AddIpInfoToViews < ActiveRecord::Migration[7.1]
  def change
    add_column :views, :ip_data, :json, default: {}
  end
end
