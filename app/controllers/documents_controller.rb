class DocumentsController < ApplicationController
before_action :login?
before_action :set_document, only: [ :edit, :update, :destroy, :show ]

FIRST_PAGE = 1
PER_PAGE = 5
def index
    # documents_path(feed: params[:feed], page: 1)のpageの値またはnilの時は1
    page = params[:page].to_i.presence || FIRST_PAGE
    offset = (page - 1) * PER_PAGE

    if params[:feed] == "your"
      @documents = current_user.documents.order(created_at: :desc).offset(offset).limit(5)
    else
      @documents = Document.order(created_at: :desc).offset(offset).limit(5)
    end
  end

  def show
  end

  def new
    @document = Document.new
  end

  def create
    @document = current_user.documents.build(document_params)
    if @document.save
      redirect_to documents_path(feed: "global")
    else
      render :new
    end
  end

  def edit
    unless current_user.id == @document.user_id
      flash[:alert] = "編集権限がありません"
      redirect_to documents_path(feed: "global")
      return
    end
  end

  def update
    if @document.update(document_params)
      redirect_to documents_path(feed: "global")
    else
      render :edit
    end
  end

  def destroy
    unless current_user.id == @document.user_id
      flash[:alert] = "削除権限がありません"
      redirect_to documents_path(feed: "global")
      return
    end
    @document.destroy
    redirect_to documents_path(feed: "global")
  end

private
  def set_document
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(
    :title,
    :article,
    :article_about,
    :article_tag
    )
  end
end
