class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new
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
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)

    if @blog.save
      redirect_to blog_path(@place)
    else
      render :new
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title)
  end
end
