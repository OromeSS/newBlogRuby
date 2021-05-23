class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]

  # GET /comments/1 or /comments/1.json
  def show; end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to post_path(@post)
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  private
  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body)
  end
end
