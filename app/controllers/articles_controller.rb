class ArticlesController < ApplicationController
  # Apply to all: Only show up if user is logged in.

  def index
    @articles = Article.all
    session[:visitor_name] = "Paul"
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    # Only show up if user is logged in.
    @article = Article.new
  end

  def edit
    # Only show up if user is logged in.
    @article = Article.find(params[:id])
  end

  def create
    # Only work if user is logged in.
    @article = Article.new(params[:article])

    if @article.save
      redirect_to articles_path, :notice => "You did it! Nice article."
    else
      flash.now[:alert] = "FAIL."
      render :new
      # In Sinatra, it would be `erb :new`.
    end
  end

  def update
    # Only work if user is logged in.
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      redirect_to articles_path
    else
      render :edit
      # In Sinatra, it would be `erb :edit`.
    end
  end

  def destroy
    # Only show up if user is logged in.
    @article = Article.find(params[:id])

    @article.destroy

    redirect_to articles_path
  end
end
