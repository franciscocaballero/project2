class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.limit(8).order("created_at desc")
    @email = Email.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params

    if @post.save
    redirect_to @post, notice: "Great News, Your new post has saved!"
else
  render 'new', notice: "We were unabke to save your post."
  end
end

def show
end

def edit
end

def update
  if @post.update post_params
    redirect_to @post, notice: "Your article has been saved!"
  else
    render 'edit'
  end
end

def destroy
  @post.destroy
  redirect_to posts_path
end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end

  def find_post
      @post = Post.find(params[:id])
    end
end
