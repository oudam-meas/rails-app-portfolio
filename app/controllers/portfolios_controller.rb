class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_portfolio = Portfolio.angular
  end

  def ruby
    @ruby_portfolio = Portfolio.ruby_on_rails_portfolio
  end

  def new
    @portfolio = Portfolio.new
    # create new technology for the portfolio
    3.times {
      @portfolio.technologies.build
    }
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to portfolios_path, notice: 'Your new portfolio is live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully deleted.' }
    end
  end


  def update
    @portfolio = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Your portfolio is updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
  def portfolio_params;
    params.require(:portfolio).permit(:title,
                                      :subtitle, 
                                      :body,
                                      technologies_attributes: [:name]
                                      )
  end

end
