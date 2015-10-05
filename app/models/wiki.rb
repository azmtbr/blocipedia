class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  scope :visible_to, -> (user) { user ? all : joins(:topic).where('wikis.public' => true) }
end
