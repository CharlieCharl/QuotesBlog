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
	
def create
  @quote = Quote.new(quote_params)
 
	if @quote.save
		redirect_to action: "index"
	else
		render 'new'
	end
end

def destroy
  @quote = Quote.find(params[:id])
  @quote.destroy
  redirect_to quotes_path
end
 
private
  def quote_params
    params.require(:quote).permit(:text)
  end
end
