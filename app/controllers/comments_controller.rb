class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(post_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        format.json { render root_path, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:comment).permit(:user_id, :post_id, :content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
