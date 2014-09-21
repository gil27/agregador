module IdeasHelper
	def idea_description(idea)
		if idea.id % 2 == 0
			position = 'col-md-6 right-idea'
			span = 'text-right'
		else
			position = 'col-md-6 left-idea'
			span = 'text-left'
		end
		content_tag :div, class: position do
			content_tag :span, class: span do
				idea.description
			end
		end
	end
end
