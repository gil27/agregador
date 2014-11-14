class AddImageToUser < ActiveRecord::Migration
  def change
    add_column :users, :image, :string, default: "profile/grey-lamp.png"

    User.find_each do |user|
    	user.update(image: "profile/grey-lamp.png")
    end
  end
end
