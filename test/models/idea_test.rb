require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  def test_idea_validations
    idea = Idea.new
    refute idea.valid?, 'Idea is invalid'
    idea.title = 'foo'
    idea.description = 'bar'
    assert idea.valid?, 'Idea is valid'
  end
end
