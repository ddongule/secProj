class CommentsController < ApplicationController

  # POST /comments
  # POST /comments.json
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(comment_params)

    redirect_to @post
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      # redirect_to @post 로 바꿔준 이유는 그 글로 돌아가기 위한것임. post컨트롤러의 update액션 참고
      format.html { redirect_to @post, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:commenter, :body, :post_id)
    end
end
