class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = t('posts.created')
      redirect_to @post
    else
      flash[:danger] = t('posts.failed')
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
