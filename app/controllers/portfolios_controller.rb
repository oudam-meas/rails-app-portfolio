class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :edit, :update]}, site_admin: :all
  layout "portfolio"

  def sort
    params[:order].each do |key, value|
      @update = Portfolio.find(value[:id]).update(position: value[:position])
    end
    render json: "success", status: :ok
  end

  def index
    @portfolio_items = Portfolio.order("position ASC")
  end

  def angular
    @angular_portfolio = Portfolio.angular
  end

  def ruby
    @ruby_portfolio = Portfolio.ruby_on_rails_portfolio
  end

  def new
    @portfolio = Portfolio.new
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

  end

  def show
  end

  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully deleted.' }
    end
  end


  def update
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
                                      :main_image,
                                      :thumb_image,
                                      technologies_attributes: [:id, :name, :_destroy]
                                      )
  end

  def set_portfolio_item
    @portfolio = Portfolio.find(params[:id])
  end
end
