class V1::PostsController < ApplicationController
  before_action :set_post, only: %i[ show update ]

  # GET /groups
  def index
    @posts = Post.all
    render json: @posts
  end

  # GET /groups/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save

      PostMailer.with(post: @post).post_email.deliver_later

      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :address, :message)
  end
end
