class PagesController < ApplicationController
  before_action :logged_in_user

  def show
    @page = Page.find_by(slug: params[:slug])
    if !@page
      @page = current_user.pages.create(slug: params[:slug], title: params[:slug])
    end
  end

  def create
    @page = current_user.pages.build(page_params)
    if @page.save
      flash[:success] = 'Page created'
      redirect_to show_page_path(@page)
    else
      flash[:danger] = @page.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def edit
    @page = Page.find_by(slug: params[:slug])
    render 'edit'
  end

  def update
    @page = Page.find_by(slug: params[:slug])
    if @page.update_attributes(page_params.merge(updated_at: Time.now))
      flash[:success] = 'Page edited'
      redirect_to page_path(@page)
    else
      flash[:danger] = @page.errors.full_messages.to_sentence
      redirect_to edit_page_path(@page)
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    # redirect_to lists_path
  end

  private

  def page_params
    params.require(:page)
          .permit(:title, :content, :slug, :private)
  end

  def correct_user
    @page ||= Page.find_by(slug: params[:slug])
    redirect_to(login_path) unless current_user?(@page.user)
  end

end
