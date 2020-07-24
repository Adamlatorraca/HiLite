module HilitesHelper

    def hilites_header
        if @category
            tag.h1("#{@category.name.capitalize} HiLites")
        else
            tag.h1("All HiLites")
        end
    end
end
