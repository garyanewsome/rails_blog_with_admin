class PostsController < ApplicationController

  before_action :find_post, only: [:show]

  def index
    @posts = Post.order('id DESC').published #.page(params[:page])
  end

  # The show action renders the individual post after retrieving the the id
  def show
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
