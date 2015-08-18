class CategoriesController < ApplicationController
  before_action :set_category

  def show
    @presented_resources = BaseCollectionPresenter.new(collection: @presented_category.resources.displayed, view_template: view_context, presenter: ResourcePresenter)
    @presented_related_resources = BaseCollectionPresenter.new(collection: Resource.displayed.categories(@presented_category.id)
                                                  .id_not(@presented_resources.map(&:id)), view_template: view_context, presenter: ResourcePresenter)
    @presented_articles = BaseCollectionPresenter.new(collection: Article.active.categories(@presented_category.id).limit(3),
                                                      view_template: view_context, presenter: ArticlePresenter)
  end

  private

  def set_category
    @presented_category = CategoryPresenter.new(object: Category.friendly.find(params[:id]), view_template: view_context)
    if request.path != category_path(@presented_category)
      redirect_to @presented_category
    end
  end
end