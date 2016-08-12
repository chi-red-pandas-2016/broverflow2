class Question < ActiveRecord::Base
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_many :voters, through: :votes, source: :user
  belongs_to :user

  validates_presence_of :title, :user_id

  def total_votes
    self.votes.to_a.map(&:value).reduce(0, :+)
  end

  def user_has_voted?(current_user)
    # self.votes.all.to_a.map(&:user_id).include? current_user.id
      self.voter_ids.include? current_user.id
  end

  def get_vote_id(user)
    self.votes.find_by(user_id: user.id).id
  end

end
