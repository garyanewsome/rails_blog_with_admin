class PostsAdminController < ApplicationController

  before_action :find_post, only: [:edit, :update, :show, :destroy]


  def index
    @posts = Post.order('id DESC')
  end

  def show
    
  end

  def new
    @post = Post.create
    redirect_to edit_posts_admin_path(@post)
  end

  def create
    
  end

  def edit

  end

  # Update action updates the post with the new information
  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "Successfully updated post!"
      redirect_to posts_admin_index_path
    else
      flash[:alert] = "Error updating post!"
      render :edit
    end
  end

  # The destroy action removes the post permanently from the database
  def destroy
    if find_post.destroy
      flash[:notice] = "Successfully deleted post!"
      redirect_to posts_admin_index_path
    else
      flash[:alert] = "Error updating post!"
    end
  end

  # Publish action makes the post visible to the public
  def publish
    @post = find_post
    if @post.update_attribute(:published, Post::STATUS_PUBLISHED)
      flash[:notice] = "Successfully published post!"
      redirect_to posts_admin_index_path
    else
      flash[:alert] = "Error publishing post!"
      render :index
    end
  end

  # Unpublish action makes the post invisible to the public
  def unpublish
    @post = find_post
    if @post.update_attribute(:published, Post::STATUS_UNPUBLISHED)
      flash[:notice] = "Successfully unpublished post!"
      redirect_to posts_admin_index_path
    else
      flash[:alert] = "Error unpublishing post!"
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:post_id, :title, :body, post_attachments_attributes: [:post_image])
  end

  def find_post
    @post = Post::find(params[:id])
  end

end
