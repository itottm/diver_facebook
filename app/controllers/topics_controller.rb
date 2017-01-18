class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topic = Topic.new
    @topics = Topic.index_all.page(params[:page])
  end

  def show
    @comment = @topic.comments.build
    @comments = @topic.comments
  end

  def create
    @topic = Topic.new(topics_params)
    @topic.user_id = current_user.id
    @topics = Topic.index_all.page(params[:page])

    respond_to do |format|
      if @topic.save
        format.html { redirect_to topics_path, notice: 'トピックを投稿しました！' }
        format.js   { render :index }
      else
        format.html { redirect_to(topics_path) }
      end
    end
  end

  def edit
  end

  def update
    if @topic.update(topics_params)
      redirect_to topics_path, notice: 'トピックを更新しました！'
    else
      render action: 'edit'
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path, notice: 'トピックを削除しました！'
  end

  private
    def topics_params
      params.require(:topic).permit(:content)
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end
end
