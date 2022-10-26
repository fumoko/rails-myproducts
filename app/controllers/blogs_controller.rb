class BlogsController < ApplicationController

    before_action :authenticate_user!, :set_beginning_of_week

    def index
        @blogs = Blog.all
    end
    
    def new
        @blog = Blog.new
    end
    
    def show
        @blog = Blog.find(params[:id])
    end
    
    def create

        blog = Blog.new(blog_parameter)

        blog.user_id = current_user.id

        blog.user_uid = current_user.uid

        if blog.save
            redirect_to  user_path(current_user.id)
        else
            redirect_to :action => "new"
        end
    end
    
    def destroy
        @blog = Blog.find(params[:id])
        @blog.destroy
        @blog.destroy
            redirect_to blogs_path, notice:"削除しました"
    end
    
    def edit
        @blog = Blog.find(params[:id])
    end
    
    def update
        @blog = Blog.find(params[:id])
        if @blog.update(blog_parameter)
            redirect_to blogs_path, notice: "編集しました"
        else
            render 'edit'
        end
    end
    
    private
    
    def blog_parameter
        params.require(:blog).permit(:title, :content, :start_time, :release)
    end

    def set_beginning_of_week
        Date.beginning_of_week = :sunday
    end
end