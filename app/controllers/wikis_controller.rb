class WikisController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @wikis = Wiki.public_wiki
  end
  
  def new
    @wiki = current_user.wikis.new
    
  end
  
  def create
    @wiki = current_user.wikis.build(wiki_params)
    if @wiki.save
      redirect_to wikis_url, notice: 'Wiki successfully created'
    else
      render :new
    end
  end
  
  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.update_attributes(wiki_params)
      redirect_to @wiki
    else
      flash[:error] = "There's been a problem updating this wiki"
      render :edit
    end
  end
  
  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end
  
  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
