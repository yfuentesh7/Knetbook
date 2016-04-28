class CommentsController < ApplicationController

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

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:comment).permit(:user_id, :post_id, :content)
  end
end
