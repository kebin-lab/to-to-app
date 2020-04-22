class UsersController < ApplicationController

  def login_form
  end

  def login
    @user = User.find_by(
      email: params[:email],
      password: params[:password])

    @email = params[:email]
    @password = params[:password]

    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました。"
      redirect_to("/posts/index")
    else
      render("login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

  def index
    @users = User.all.order(create_at: :asc)
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      image: "default.png",
      authority: params[:authority]
    )
    @name = params[:name]
    @email = params[:email]
    @password = params[:password]

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザ登録が完了しました"
      redirect_to("/posts/index")
    else
      render("new")
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]

    if params[:image]
      @user.image = "#{@user.id}.png"
      image = params[:image]
      File.binwrite("public/images/#{@user.image}",image.read)
    end

    if @user.save
      flash[:notice] = "ユーザ情報を変更しました"
      redirect_to("/users/#{@user.id}")
    else
      render("show")
    end
  end

end
