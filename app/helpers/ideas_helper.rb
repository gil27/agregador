module IdeasHelper
	def idea_description(idea)
		content_tag :div, class: 'idea' do
			link_to idea.title, idea_path(idea.id)
		end
	end
end
