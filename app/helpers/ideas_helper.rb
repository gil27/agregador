module IdeasHelper
	def idea_description(idea)
		content_tag :div, class: 'idea' do
			link_to idea.title, idea_path(idea.id)
		end
	end

	def total_of_votes idea
		idea.votes.count
	end

	def link_to_vote idea
		if idea.voted_by?(current_user)
			fa_icon('heart')
		else
			link_to vote_path(idea: idea.id), remote: true do
		  	fa_icon('heart')
		  end
		end
	end
end
