class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many   :votes, as: :voteable
  has_many :voters, through: :votes, source: :user
  has_many   :comments, as: :commentable

  validates_presence_of :user_id, :question_id, :text

  def total_votes
    return 0 if self.votes.to_a == []
    self.votes.to_a.map(&:value).reduce(:+)
  end

  def user_has_voted?(current_user)
    # self.votes.all.to_a.map(&:user_id).include? current_user.id
      self.voter_ids.include? current_user.id
  end

  def get_vote_id(user)
    self.votes.find_by(user_id: user.id).id
  end

end
