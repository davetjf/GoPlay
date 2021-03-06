class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    if current_user.blocked == true
      redirect_to '/contacts/new'
      flash[:notice] = "You have been blocked! Please contact the admin if you think this is an error"
    else
    @posts = Post.all.order("created_at DESC")
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @users=User.all
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    if user_signed_in? && current_user.admin?
      @posts = Post.all
    else
      redirect_to '/'
      flash[:notice] = "You don't have permissions to view this page."
    end

  end

  def on 
      @post = Post.find_by(id: params[:id])
      @post.update_attribute(:canComment, true)
      redirect_to request.referrer
  end
    
  def off 
      @post = Post.find_by(id: params[:id])
      @post.update_attribute(:canComment, false)
      redirect_to request.referrer
  end
   


  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
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
      params.require(:post).permit(:title, :body)
    end
end
