class WikiPolicy < ApplicationPolicy


  # def permitted_attributes
  #   if user.admin? || user.owner_of?(wiki)
  #     [:title, :body]
  #   else
  #
  #   end
  # end

  def index?
    true
  end

  def create?
    user.admin? || user.present?
  end

  def show?
    record.private != true || (user.present? && ((user.role == 'admin') || record.user == user))
  end

  def update?
    user.admin? || (record.user == user)
  end

  def destroy?
    update?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
       wikis = []
       if user.present? && user.role == 'admin'
         wikis = scope.all
       elsif user.present? && user.role == 'premium'
         all_wikis = scope.all
         all_wikis.each do |wiki|
           if wiki.private != true || wiki.user == user
             wikis << wiki
           end
         end
       else
         all_wikis = scope.all
         wikis = []
         all_wikis.each do |wiki|
           if wiki.private != true 
             wikis << wiki
           end
         end
       end
       wikis
     end

    # def resolve
    #   if user
    #     if user.admin? || user.premium?
    #       scope.all
    #     else
    #       scope.where(private: false)
    #     end
    #   else
    #     scope.where(private: false)
    #   end
    # end
  end
 end
