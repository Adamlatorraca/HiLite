class HilitesController < ApplicationController
    #before_action :redirect_if_not_signed_in

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
            redirect_to hilites_path
        else
            render :new
        end
    end

    def show
        @hilite = Hilite.find(params[:id])
    end

private

    def hilite_params
        params.require(:hilite).permit(:title, :content, :category_id)
    end
end
