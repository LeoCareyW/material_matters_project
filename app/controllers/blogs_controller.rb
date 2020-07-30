class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
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

  def blog_params
    params.require(:blog).permit(:title, :date, :content)
  end
end
