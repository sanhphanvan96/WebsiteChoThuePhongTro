class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :permit_user, only: [:edit, :destroy, :update]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post_category = PostCategory.all
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Đã tạo bài đăng thành công.' }
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
      if @post.update(params.require(:post).permit(:user_id, :title, :description, :image, :acreage, :price, :address,
        :phone_contact, :post_category_id, :toilet_type_id))
        format.html { redirect_to @post, notice: 'Đã chỉnh sửa bài đăng thành công.' }
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
      format.html { redirect_to posts_url, notice: 'Đã xóa bài đăng thành công.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.merge!(user_id: current_user.id, toilet_type_id: "1")
      new_params = params.permit(:user_id, :title, :description, :image, :acreage, :price, :address,
        :phone_contact, :post_category_id, :toilet_type_id)
      puts "new_params", new_params
      new_params.permit! 
    end

    # Check is right user or is admin
    def permit_user
      unless @post.user == current_user || current_user.is_admin?
        flash[:danger] = "Bạn không thể chỉnh sửa bài đăng này."
        redirect_to @post
      end
    end
end
