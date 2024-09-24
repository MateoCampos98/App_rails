# frozen_string_literal: true

class CategoryComponent < ViewComponent::Base
  attr_reader :category

  def initialize(category: nil)
    @category = category
  end

  def title
    @category ? @category.name : t('.all') 
  end

  def link
    @category ? products_path(category_id: @category.id) : products_path
  end

  def active?
    return true if !@category && !params[:category_id]
    @category&.id == params[:category_id].to_i
  end

  def background 
    active? ? "category_component" : "category_component_2 "
  end

  def classes
    "category-box #{background}"
  end

end
