class ProductPresenter < SimpleDelegator
  attr_reader :product

  def initialize(product)
    @product = product
  end

  def title
    product.title.capitalize
  end

  def showcase
    product.images.first.representation(resize_to_limit: [328, 298])
  end

  def image?
    product.images.attached?
  end

  def description
    product.body.capitalize
  end

  def price
    product.price
  end

  def owner
    "Anunciante: #{product.user.name}"
  end

  def interests
    "#{product.interested_amount}/#{product.amount}"
  end

end