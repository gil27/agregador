class User < ActiveRecord::Base

	def self.create_from_omniauth(omniauth)
		create(
				uid: omniauth['uid'],
				provider: omniauth['provider'],
				name: omniauth['info']['name'],
				oauth_token: omniauth['info']['token']
			)
	end
end