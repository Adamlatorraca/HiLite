class CommentsController < ApplicationController
    before_action :redirect_if_not_signed_in

    def new
        if params[:hilite_id] && @hilite = Hilite.find_by_id(params[:hilite_id])
            @comment = @hilite.comments.build
        else
            @comment = Comment.new 
        end
    end

    def create
        @hilite = Hilite.find_by_id(params[:hilite_id])
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to hilite_path(@comment.hilite)
        else
            render :new
        end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content, :hilite_id, :user_id)
    end
  end