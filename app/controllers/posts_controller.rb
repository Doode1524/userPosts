class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all

    render json: @posts, include: [:users]
  end

  # GET /posts/1
  def show
    render json: @post, include: [:users]
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    # Remove all user_posts associated with this post
    @post.user_posts.destroy_all
    
    # Add new user_posts based on the authorIds params and the passed in post.id
    params[:authorIds].each do |user|
      @post.user_posts.create(user_id: user, post_id: @post.id)
    end

    if @post.update(post_params)
      render json: @post, include: [:users]
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
