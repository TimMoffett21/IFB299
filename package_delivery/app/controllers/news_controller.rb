class NewsController < ApplicationController
  
  def newsdetail
  end
  
  
  def CustomerNews
    @news= News.all
  end
  
  def show
    @news = News.all
  end
  
  def destroy
    @new = News.find(params[:id])
	  @new.destroy
	  redirect_to news_path
  end
  
  def edit
    @new = News.find(params[:id])
  end
  
  def update 
  @new = News.find(params[:id])
   if @new.update(new_params)
     redirect_to news_path
   else
     render 'edit'
   end
  end
  
  def new
    @new = News.new
  end
  
  def create
     @new= News.new(new_params)
    if @new.save
      redirect_to '/news/show'
    else
      render 'new'
    end
  end
  
   private
  	def new_params
  			params.require(:news).permit(:title,:content)			
  	end
 

end
