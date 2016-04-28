class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @post = Post.new
    @all_post = Post.all
    @comment = Comment.new
  end
end
