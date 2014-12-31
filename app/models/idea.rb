class Idea < ActiveRecord::Base
  acts_as_taggable
  has_many :votes
  belongs_to :user

  validates :title, :description, presence: true

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

  def voted_by? user
    votes.where(user_id: user.id).any?
  end
end