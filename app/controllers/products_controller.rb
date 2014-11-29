
class ProductsController < ApplicationController

  # caches_action :index
  cache_sweeper :product_sweeper, only: [:update, :create]

  def index
  	@products = Product.all
    @recent_product = Product.last unless (fragment_exist? :recent_product)
  end

  def show
  end

  def create
  end

  def edit
    @product = Product.where(id: params[:id]).first
  end

  def update
    @product = Product.where(id: params[:id]).first
    @product.update_attributes(params[:product])
    # expire_page :action => :index
    redirect_to products_path
  end

end
