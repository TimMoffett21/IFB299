class FaQSubListsController < ApplicationController
  def index
     @faqmainlist = FaQMainList.all
     @faqsublist = FaQSubList.all
     @increment=0
  end
  
  def new
    @sublist= FaQSubList.new
  end
  
  def create
    @sublist= FaQSubList.new(sublist_params)
    if @sublist.save
      redirect_to fa_q_sub_lists_path
    else
      render 'new'
    end
  end
  
  def show
    @faqmainlist = FaQMainList.all
    @faqsublist = FaQSubList.all
    @sublist = FaQSubList.find(params[:id])
    @increment=0
  end
  
  def edit
    @sublist = FaQSubList.find(params[:id])
  end
  
  def update 
   @sublist =  FaQSubList.find(params[:id])
   if @sublist.update(sublist_params)
     redirect_to fa_q_sub_lists_path
   else
     render 'edit'
   end
  end
  
  
  def destroy
    @sublist = FaQSubList.find(params[:id])
	  @sublist.destroy
	  
	  redirect_to fa_q_sub_lists_path
  end
  
  
	
	 private
	def sublist_params
			params.require(:fa_q_sub_list).permit(:SubFaqQuestion,:SubFaqAnswer,:FaqMainLstId)			
	end
end
