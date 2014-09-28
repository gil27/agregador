class Idea < ActiveRecord::Base
  has_many :votes

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  PER_PAGE = 4
  scope :paginate, ->(current_page=1) {
    current_page = (current_page.to_i || 1)
    page(current_page).per(PER_PAGE)
  }

  def to_param
		"#{id}-#{title.parameterize}"
	end
end