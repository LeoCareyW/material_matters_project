class BlogsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs = policy_scope(Blog).order(created_at: :desc)
  end

  def new
    @blog = Blog.new
    authorize @blog
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user = current_user
    authorize @blog
      if @blog.save
        redirect_to blog_path(@blog)
      else
        render :new
      end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
    authorize @blog
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice: "The blog #{@blog.title} has been deleted."
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)

    if @blog.save
      redirect_to blog_path(@blog)
    else
      render :new
    end
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
    authorize @blog
  end

  def blog_params
    params.require(:blog).permit(:title, :date, :content, :mp3, photos: [])
  end
end
