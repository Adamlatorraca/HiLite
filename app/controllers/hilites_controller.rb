class HilitesController < ApplicationController
    before_action :find_hilite, only: [:edit, :update, :show, :destroy]
    before_action :redirect_if_not_signed_in, only: [:new, :create, :edit, :update, :destroy]

    def index
        if params[:category_id] && @category = Category.find_by_id(params[:category_id])
            @hilites = @category.hilites
        else
            @hilites = Hilite.all
        end
    end

    def new
        if params[:category_id] && @category = Category.find_by_id(params[:category_id])
            @hilite = @category.hilites.build
        else
            @hilite = Hilite.new  
            @hilite.build_category
        end
    end

    def create
        @hilite = current_user.hilites.build(hilite_params)
        if @hilite.valid?
            @hilite.save
            redirect_to hilite_path(@hilite)
        else
            @category = Category.find_by_id(params[:category_id]) if params[:category_id]
            render :new
        end
    end

    def show
        @hilite = Hilite.find(params[:id])
    end

    def edit 
        @hilite = Hilite.find(params[:id])
    end

    def update 
        @hilite = Hilite.find_by(id: params[:id])
        if @hilite.user == current_user
            @hilite.update(hilite_params)
            redirect_to hilite_path(@hilite)
        else 
            render :edit 
        end
    end

    def destroy
        if @hilite.user == current_user
            @hilite.destroy
            redirect_to user_path(current_user)
        end
    end
    
private

    def hilite_params
        params.require(:hilite).permit(:title, :content, :category_id)
    end

    def find_hilite
        @hilite = Hilite.find(params[:id])
    end
end
