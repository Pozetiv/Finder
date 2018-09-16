module AppliesHelper
   def added_apply(post)
   if user_signed_in? && current_user.applies.find_by(post: post)
    content_tag( :div, '<i class="fas fa-check">Apply is alredy</i>'.html_safe, class: 'button is-fullwidth is-primary')
   else
      button_to 'Apply', applies_path, params: { post_id: post.id }, class: 'button is-fullwidth is-primary'
   end
  end
end