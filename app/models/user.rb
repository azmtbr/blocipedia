class User < ActiveRecord::Base
  has_many :wikis, dependent: :destroy
  has_many :collaborators, dependent: :destroy

  before_save :enum_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  enum role: [:standard, :premium, :admin]

  def enum_role
    self.role ||= :standard
  end

  after_save do
    if role == 'standard'
      wikis.where(private: true).each do |w|
        w.private = false
        w.save
      end
    end
  end
end
