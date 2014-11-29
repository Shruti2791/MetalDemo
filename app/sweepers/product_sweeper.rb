class ProductSweeper < ActionController::Caching::Sweeper
  observe Product

  def after_save(post)
    clear_product_cache(post)
  end

  # def after_destroy(post)
  #   clear_product_cache(post)
  # end

  def after_products
    logger.info 'Heyy!! This is a controller hook provided by sweeper'
  end

  def clear_product_cache(product)
    # expire_page action: :index
    expire_page controller: :products, action: :index
    expire_fragment :recent_product
  end
end