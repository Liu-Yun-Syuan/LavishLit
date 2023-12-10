class PostsController < ApplicationController
    before_action :find_post, only: [:show, :destroy, :edit, :update]
    before_action :authenticata_user!, except: [:show, :index]
    
    def index
        @posts = Post.all
    end
    
    def new
    end
    
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
    end
    
    def show
        
    end
    
    def edit
        
    end
    
    def update
        
    end
    
    def destroy
        
    end
    
    private
    def find_post
        @post = Post.find(params[:id])
    end
    
    def post_params
        params.require(:posts)
              .permit(:title, :description, :price)
    end

end
