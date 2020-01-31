class ProductsController < ApplicationController

  def home

    @products = productall
  end

  def new
    @product = Product.new
  end

  def create
    # render plain: params[:product].inspect
    @product = Product.new(product_params)
    @product.user = User.first
    @product.save
    sleep(7.0)
    redirect_to root_path
  end

  def index
    @product = productall
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :age, :cost)
    end

  private
      def productall
        Product.all
      end

end
