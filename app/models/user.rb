class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets


  has_many :relationships
  has_many :friends, through: :relationships

  # defining inverse of relationship
  # this allows us to lookup both sides of the relationship (allowing the user to see their followers)
  # for example:
    # u = User.first
    # x = User.second

    # Relationship.create(user_id: u.id, friend_id: x.id)

    # u.friend.last == x => true
    # x.inverse_friends.last == u  => true

  has_many :inverse_relationships, :class_name => "Relationship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_relationships, :source => :user

  has_many :likes


  validates :username, presence: true, uniqueness: true

  def likes?(tweet)
    tweet.likes.where(user_id: self.id).any?
  end

end
