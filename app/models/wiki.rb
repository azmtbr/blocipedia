class Wiki < ActiveRecord::Base
  belongs_to :user

  scope :visible_to, -> (user) { user ? all : joins(:topic).where('wikis.public' => true) }
end
