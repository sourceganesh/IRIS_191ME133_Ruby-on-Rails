class ProductsController < ApplicationController

  def home
    @products = productall
    @users = User.all
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

  def buy
    @product = Product.first
    @user = User.find(session[:user_id])
    if (@user.wallet-@product.cost) >=0
      @user.wallet -=@product.cost
      @user.save
      @user2 = @product.user
      @user2.wallet +=@product.cost
    else
      flash[:error] = "Cannot Purchase"
    end
    @user2.save
    redirect_to root_path
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
