class BlogsController < ApplicationController
  before_action :set_data, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @blogs = Blog.order(created_at: "DESC").page(params[:page]).per(10)
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
    @blog.update(blog_params)
    redirect_to root_path
  end

  def destroy
    @blog.destroy
    redirect_to root_path
  end

  private
  def blog_params
    params.require(:blog).permit(:text).merge(user_id: current_user.id)
  end
  
  def set_data
    @blog = Blog.find(params[:id])
  end

end
