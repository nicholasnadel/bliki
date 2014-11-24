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
  
  def destroy
     @wiki = Wiki.find(params[:id])
     title = @wiki.title
    
     authorize @wiki
     if @wiki.destroy
       
       flash[:notice] = "\"#{title}\" was deleted successfully."
       redirect_to wikis_path
       else
       flash[:error] = "There was an error deleting the topic."
       render :show
     end
   end
  
  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
