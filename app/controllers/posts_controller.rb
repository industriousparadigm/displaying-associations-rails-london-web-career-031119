class PostsController < ApplicationController
	def index # get /posts
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new # get posts/new
		@post = Post.new
		@categories = Category.all
	end

	def create # post /posts
		post = Post.create(params[:post])
		redirect_to post_path(post)
	end

	def edit # get posts/:id/edit
		@post = Post.find(params[:id])
		@categories = Category.all
	end

	def update # POST posts/:id
		post = Post.find(params[:id])
		post.update(params.require(:post).permit(:title, :description, :post_status))
		redirect_to post_path(post)
	end
end
