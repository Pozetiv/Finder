module ApplicationHelper
  def created_at(object)
    object.created_at.to_date.strftime("%d %B, %Y")
  end

  def object_owner(object)
    user_signed_in? && current_user.id == object.user_id
  end

  def bulma_pagination(collection, options = {})
   options[:renderer] ||= BulmaPaginationHelper::LinkRenderer
   options[:class] ||= 'pagination is-centered'
   options[:inner_window] ||= 2
   options[:outer_window] ||= 1
   will_paginate(collection, options)
 end

 def avatar(object)
  if object.user.image?
    image_tag( object.user.image.url(:avatar) )
  else
    image_tag( 'https://bulma.io/images/placeholders/128x128.png')
  end
 end
end
