class HilitesController < ApplicationController
    before_action :find_hilite, only: [:edit, :update, :show, :destroy]
    before_action :redirect_if_not_signed_in, only: [:new, :create, :edit, :update, :destroy]
    before_action :redirect_if_not_authorized, only: [:edit, :update, :destroy]

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
    end

    def edit 
    end

    def update 
        if @hilite.valid?
            @hilite.update(hilite_params)
            redirect_to hilite_path(@hilite)
        else 
            render :edit 
        end
    end

    def destroy
        @hilite.destroy
        redirect_to user_path(current_user)
    end
    
private

    def hilite_params
        params.require(:hilite).permit(:title, :content, :category_id)
    end

    def find_hilite
        @hilite = Hilite.find(params[:id])
    end
    
end
