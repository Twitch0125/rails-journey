class CommentsController < ApplicationController
  def create
    @chore = chore.find(params[:chore_id])
    @comment = @chore.comments.create(comment_params)
    redirect_to chore_path(@chore)
  end

  def destroy
    @chore = chore.find(params[:chore_id])
    @comment = @chore.comments.find(params[:id])
    @comment.destroy
    redirect_to chore_path(@chore), :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
