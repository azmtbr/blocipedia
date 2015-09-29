module WikisHelper

  def user_can_delete_wiki?(wiki)
    current_user && (current_user == @wiki.user || current_user.admin?)
  end

  def user_can_edit_wiki?(wiki)
    current_user && (current_user == @wiki.user || current_user.admin?)
  end
end
