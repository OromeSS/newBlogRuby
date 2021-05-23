class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy ]
  before_action :set_post, only: %i[ show edit update destroy ]
  # GET /posts or /posts.json
  def index
    authorize Post
    @posts = Post.filtered(query_params).ordered
  end

  # GET /posts/1 or /posts/1.json
  def show
    authorize @post
  end

  # GET /posts/new
  def new
    authorize Post
    @post = Post.new
    @categories = Category.all
  end

  # GET /posts/1/edit
  def edit
    authorize @post
    @categories = Category.all
  end

  # POST /posts or /posts.json
  def create
    authorize Post

    @post = Post.new(post_params)
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
       else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    authorize @post
    @post.user = current_user
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    authorize @post

    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :category_id, :user_id)
    end

    def query_params
      query_params = params[:query]
      query_params ? query_params.permit(:text, :category) : {}
    end
end
