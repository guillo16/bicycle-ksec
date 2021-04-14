class Api::V1::CategoriesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: :index
  before_action :set_category, only: %w[update destroy]

  def index
    @categories = policy_scope(Category)
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    authorize @category
    if @category.save
      render :index, status: :created
    else
      render_error
    end
  end

  def update
    if @category.update(category_params)
      render :index
    else
      render_error
    end
  end

  def destroy
    @category.destroy
    head :no_content
  end

  private

  def set_category
    @category = Category.find(params[:id])
    authorize @category
  end

  def category_params
    params.require(:category).permit(:name, :code)
  end

  def render_error
    render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
  end
end
