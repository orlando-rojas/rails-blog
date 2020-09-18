class Article < ApplicationRecord
  attr_accessor :category_elements
  has_rich_text :content
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories

  def save_categories
    if category_elements.nil? || category_elements.empty?
      return article_categories.destroy_all
    end
    article_categories.where.not(category_id: category_elements).destroy_all

    category_elements.each do |id|
      ArticleCategory.find_or_create_by(article: self, category_id: id)
    end
  end
end
