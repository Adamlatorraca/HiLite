class HilitesController < ApplicationController
    before_action :redirect_if_not_signed_in

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

private

    def hilite_params
        params.require(:hilite).permit(:title, :content)
    end
end
