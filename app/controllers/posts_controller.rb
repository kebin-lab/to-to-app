class PostsController < ApplicationController
  def index
    @posts = Post.all.order(create_at: :asc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end
end
