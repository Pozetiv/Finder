module ApplicationHelper
  def created_at(object)
    object.created_at.to_date.strftime("%d %B, %Y")
  end

  def object_owner(object)
    user_signed_in? && current_user.id == object.user_id
  end

end
