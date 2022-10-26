class UsersController < ApplicationController

    before_action :set_beginning_of_week
    
    def show
        @user = User.find(params[:id])    
    end

    private

    def set_beginning_of_week
        Date.beginning_of_week = :sunday
    end
end