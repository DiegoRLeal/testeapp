class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    if current_user.role == 'admin'
      @pages = Page.all
    else
      @pages = Page.where(user_id: @current_user)
    end
    # raise
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
    @page.user = current_user


    if @page.save
      redirect_to page_path(@page)
    else
      render :new
    end
  end

  def update
    if @page.update(page_params)
      redirect_to @page, notice: "page was sucessfully updated."
    else
      render :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to pages_path, notice: "page was sucessfully destroyed."
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:teacher, :branch, :level, :frequency, :comments, :user_id, photos: [])
  end
end
