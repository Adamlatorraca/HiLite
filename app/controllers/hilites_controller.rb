class HilitesController < ApplicationController
    before_action :redirect_if_not_signed_in, only: [:new, :create, :destroy]
    before_action :redirect_if_not_authorized, only: [:edit, :update, :destroy]

    def index
        if params[:category_id] && @category = Category.find_by_id(params[:category_id])
            @hilites = @category.hilites
        else
            @hilites = Hilite.all
        end
    end

    def new
        @hilite = Hilite.new
    end

    def create
        @hilite = current_user.hilites.build(hilite_params)
        if @hilite.save
            redirect_to hilite_path(@hilite)
        else
            render :new
        end
    end

    def show
        @hilite = Hilite.find(params[:id])
    end

    def edit 
        @hilite = Hilite.find_by(id: params[:id])
    end

    def update 
        @hilite = Hilite.find_by(id: params[:id])
        if @hilite.save
            @hilite.update(hilite_params)
            redirect_to hilite_path(@hilite)
        else 
            render :edit 
        end
    end

    def destroy
        hilite = Hilite.find(params[:id]).destroy
        redirect_to user_path(current_user)
    end
    
private

    def hilite_params
        params.require(:hilite).permit(:title, :content, :category_id)
    end
end
