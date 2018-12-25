class QuotesController < ApplicationController

	def index
	@quotes = Quote.all
	end
	
	def show
    @quote = Quote.find(params[:id])
	end
	
	def new
	@quote = Quote.new
	end
	
	def edit
	@quote = Quote.find(params[:id])
	end
	
def create
  @quote = Quote.new(quote_params)
 
	if @quote.save
		redirect_to action: "index"
	else
		render 'new'
	end
end

def update
	@quote = Quote.find(params[:id])
	 
	if @quote.update(quote_params)
		redirect_to @quote
	else
		render 'edit'
	end
end
 
private
  def quote_params
    params.require(:quote).permit(:text)
  end
end
