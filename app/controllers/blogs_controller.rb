class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ edit update destroy ]

  # GET /blogs
  def index
    @blogs = Blog.order(id: :desc)
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      flash.now.notice = "Blog was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blogs/1
  def update
    if @blog.update(blog_params)
      flash.now.notice = "Blog was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /blogs/1
  def destroy
    @blog.destroy
    flash.now.notice = "Blog was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end
