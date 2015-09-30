module UsersHelper

  def display_user_wikis(user)
    if @wikis.count > 0
       render @wikis
    else
      "#{user.name} does not have any wikis."
    end
  end
end
