class Comment < ApplicationRecord
  include Visible

  belongs_to :chore
  validates :body, presence: true
  validates :commenter, presence: true
end
