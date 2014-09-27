class Idea < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def to_param
		"#{id}-#{title.parameterize}"
	end
end