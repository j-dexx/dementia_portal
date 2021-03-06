module Optimadmin
  class PagesController < Optimadmin::ApplicationController
    before_action :set_page, only: [:show, :edit, :update, :destroy]

    edit_images_for Page, [[:image, { show: ['fit', 218, 135] }]]

    def index
      @pages = Optimadmin::BaseCollectionPresenter.new(collection: Page.where('title LIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::PagePresenter)
    end

    def show
    end

    def new
      @page = Page.new
    end

    def edit
    end

    def create
      @page = Page.new(page_params)
      if @page.save
        redirect_to pages_url, notice: 'Page was successfully created.'
      else
        render :new
      end
    end

    def update
      if @page.update(page_params)
        redirect_to pages_url, notice: 'Page was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @page.destroy
      redirect_to pages_url, notice: 'Page was successfully destroyed.'
    end

  private


    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:title, :content, :image, :display, :suggested_url)
    end
  end
end
