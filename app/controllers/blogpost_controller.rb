class BlogpostController < ApplicationController
  def index
    @posts = Blogpost.all
  end

  def new
    @blogpost = Blogpost.new
  end

  def create
    @post = current_user.blogpost.new(blogpost_params)

    if @post.save
      Rails.logger.info "success"
    else
      Rails.logger.info @post.errors.full_messages.to_sentence
      @blogpost = Blogpost.new
      render :new
    end
    redirect_to blogpost_path(@post)
  end

  def show
    @post = Blogpost.find(params[:id])
  end

  private
    def blogpost_params
      params.require(:blogpost).permit(:title, :content)
    end
end
