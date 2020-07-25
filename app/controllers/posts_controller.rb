class PostsController < ApplicationController

  def index
    @posts = Post.all.order(id: "DESC")
  end

  def new
  end

  def create
    post = Post.create(content: params[:content], checked: false)
    render json:{ post: post }
  end

  def checked
    post = Post.find(params[:id])
    if post.checked then
      # thenって正しいみたいなっことで== trueと同じ意味
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    render json: {post: item}
    # jsonファイルを返却する時には文法上キーバリューの形式で返しており
    # keyになるのは名前はなんでもよくて値は取得したレコードをそのまま返す形とする。
  end
end
