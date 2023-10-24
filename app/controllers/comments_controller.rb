class CommentsController < ApplicationController
    
      def index
        @comment = Comment.scoped
      end
    
      def create
        @comment = current_user.coments.new(params[:Comment])
      end
    
      def update
        @comment = Comment.find(params[:id])
      end
    
      def edit
        @comment = Comment.find(params[:id])
      end
    
      def destroy
        Comment = Comment.find(params[:id])
      end
end
