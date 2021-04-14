class Api::V1::ProductsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: :index
  before_action :set_product, only: %w[update destroy]

  def index
    @products = policy_scope(Product)
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    authorize @product
    if @product.save
      render :index, status: :created
    else
      render_error
    end
  end

  def update
    if @product.update(product_params)
      render :index
    else
      render_error
    end
  end

  def destroy
    @product.destroy
    head :no_content
  end

  private

  def set_product
    @product = Product.find(params[:id])
    authorize @product
  end

  def product_params
    params.require(:product).permit(:name, :code, :brand, :quantity, :price, :category_id)
  end

  def render_error
    render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
  end
end
