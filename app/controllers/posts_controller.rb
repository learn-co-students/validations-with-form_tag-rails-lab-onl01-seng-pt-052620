class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
    
    # @post = Post.create(post_params)

    # redirect_to post_path(@post)
  end


  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post.update(post_params)    

    if @post.valid? 
       redirect_to post_path(@post)
    else
      render :edit
    end

  end


  private

  def post_params
    params.permit(:title, :category, :content)
  end

  def set_post!
    @post = Post.find(params[:id])
  end

end
