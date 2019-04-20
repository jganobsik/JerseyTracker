class AddPictureAndTeamToJersey < ActiveRecord::Migration[5.2]
  def change
    add_column :jerseys, :picture_url, :string
    add_column :jerseys, :team, :string
  end
end
