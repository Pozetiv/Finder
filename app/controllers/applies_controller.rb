class AppliesController < ApplicationController
   before_action :authenticate_user!

  def create
    @apply = current_user.applies.create(post_id: params[:post_id])
    if @apply.save
      post = Post.find(params[:post_id])
      redirect_to post_path(post), success: 'Added new job to list'
    else
      flash.now[:danger] = 'Opps problem... Report this to an administration'
    end
  end

  def destroy
    @apply = Apply.find(params[:id])
    if @apply.destroy
      redirect_to applies_path, success: 'Apply destroy'
    end
  end

  def index
    @applies = current_user.applies
  end

  def find_owner_post_applies
    @applies = current_user.posts
  end
end