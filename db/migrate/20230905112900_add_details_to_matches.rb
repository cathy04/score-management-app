class AddDetailsToMatches < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :details, :string
  end
end
