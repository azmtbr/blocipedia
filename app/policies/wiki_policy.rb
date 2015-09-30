class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # if user.admin?
      #   scope.all
      # else
      #   scope.where(:published => true)
      # end
      scope.all
    end
  end

  # def permitted_attributes
  #   if user.admin? || user.owner_of?(wiki)
  #     [:title, :body]
  #   else
  #
  #   end
  # end

  def update?
    user.admin? || (record.user == user)
  end

  def destroy?
    update?
  end

end
