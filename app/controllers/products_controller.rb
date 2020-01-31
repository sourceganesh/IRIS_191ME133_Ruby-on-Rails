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

  private
    def product_params
      params.require(:product).permit(:name, :description, :age, :cost)
    end

  private
      def productall
        Product.all
      end

      def buy
        @article = Article.find(params(:id))
        @user = User.find(session[:user_id])
        @user2 = @article.user
        if((@user.wallet-@article.cost)>=0)
          @user.wallet = @user.wallet-@article.cost
          @user2.wallet += @article.cost
        else
          flash[:error] = "Cannot Purchase"
        end
        @user.save
        @user2.save
        redirect_to root_path
      end

end
