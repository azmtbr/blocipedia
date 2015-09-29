class User < ActiveRecord::Base
  has_many :wikis, dependent: :destroy

  before_save :enum_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  enum role: [:standard, :premium, :admin]

  def enum_role
    self.role ||= :standard
  end
end
