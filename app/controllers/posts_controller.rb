class PostsController < ApplicationController
  def new
  end

  def create
    @post = Post.create(post_params)

    if @post.valid?
      redirect_to post_path(@post)
    else  
      render :new
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else  
      render :edit
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
