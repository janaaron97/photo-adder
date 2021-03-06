class PostsController < ApplicationController
    
    def index
        @posts = Post.all
    end
    
    def show
        @post = Post.find(params[:id])
    end
    
    def create
        @post = Post.create(post_params)
        if @post.save
            redirect_to posts_path
        else
            render 'new'
        end
    end
    
    def new
         @post = Post.new
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end
    
    private
    def post_params
        params.require(:post).permit(:title, :post, :image)
    end
    
    
end