class User < ActiveRecord::Base
	validates_uniqueness_of :uid
	has_many :ideas
	has_many :votes

	def self.create_from_omniauth(omniauth)
		user = find_or_create_by!(
			uid: omniauth['uid'],
			provider: omniauth['provider'],
			name: omniauth['info']['name'],
			oauth_token: omniauth['info']['token']
		)

		user.update(image: omniauth['info']['image'] ||= "profile/grey-lamp.png")
		user
	end
end