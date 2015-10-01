class Amount < ActiveRecord::Base

  def self.default
    0
  end

  def self.premium
    default + 500
  end
end
