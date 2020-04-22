class PostsController < ApplicationController
  before_action :current_user

  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def index
    @posts = Post.all.order(created_at: "desc")
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new

  end

  def create
    @post = Post.new(content: params[:content],user_id: @current_user.id)
    if @post.save
      flash[:notice] = "投稿が完了しました"
      redirect_to("/posts/index")
    else
      flash[:notice] = "投稿に失敗しました。"
      render("new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "編集が完了しました"
      redirect_to("/posts/index")
    else
      flash[:notice] = "投稿に失敗しました"
      render("update")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      flash[:notice] = "削除が完了しました"
      redirect_to("/posts/index")
    end
  end
end
