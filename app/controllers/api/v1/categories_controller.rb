class Api::V1::CategoriesController < Api::V1::BaseController
  before_action :set_category, only: %w[update destroy]

  def index
    @categories = policy_scope(Category)
  end
end
