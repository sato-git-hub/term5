class DocumentsController < ApplicationController
before_action :login?
  def index
    if params[:feed] == "your"
      @documents = Document.limit(2).order(created_at: :desc)
    elsif params[:feed] == "global"
    elsif params[:page] == "1"
      @documents = Document.limit(2).order(created_at: :desc)
    elsif params[:page] == "2"
      @documents = Document.limit(2).offset(2).order(created_at: :desc)
    end
  end

  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to documents_path
    else
      render :new
    end
  end

  def edit
  
    @document = Document.find(params[:id])
    unless current_user.id == @document.user_id
      flash[:alert] = "編集権限がありません"
      redirect_to documents_path
      return
    end
    
  end

  def update
    @document = Document.find(params[:id])
    if @document.update(document_params)
      redirect_to documents_path
    else
      render :edit
    end
  end

  def destroy
    @document = Document.find(params[:id])
    unless current_user.id == @document.user_id
      flash[:alert] = "削除権限がありません"
      redirect_to documents_path
      
      return
    end
    @document.destroy
    redirect_to documents_path
  end

private

  def document_params
    params.require(:document).permit(
    :title,
    :article,
    :article_about,
    :article_tag
    )
  end

end