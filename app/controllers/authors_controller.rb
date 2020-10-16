class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    @author = Author.create(author_params)

    if @author.valid?
      redirect_to author_path(@author)
    else  
      render :new
    end
  end
  
  def show
    @author = Author.find(params[:id])
  end

  def edit 
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.update(author_params)

    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else  
      render :edit
    end
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
