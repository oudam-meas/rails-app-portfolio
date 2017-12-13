class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
  end
  
  def create
    @portfolio = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))
    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to portfolios_path, notice: 'Your new portfolio is live.' }
        format.json { render :show, status: :created, location: @portfolio }
      else
        format.html { render :new }
      end
    end
  end
end
