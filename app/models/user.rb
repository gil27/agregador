class User < ActiveRecord::Base
	validates_uniqueness_of :uid

	has_many :votes

	def self.create_from_omniauth(omniauth)
		find_or_create_by!(
				uid: omniauth['uid'],
				provider: omniauth['provider'],
				name: omniauth['info']['name'],
				oauth_token: omniauth['info']['token']
			)
	end
end