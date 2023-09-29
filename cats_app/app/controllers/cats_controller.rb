class CatsController < ApplicationController
    def index
        @cats = Cat.all 
        render :index
    end

    def create
        @cat = Cat.new(cat_params)
        if @cat.save
            redirect_to cat_url(@cat)
        else
            render json: cat.errors.full_messages, status:unprocessable_entity
        end
    end

    def show    
        @cat = Cat.find(params[:id])
        render :show
    end

    def update
        @cat = Cat.find(params[:id])
        if @cat.update(cat_params)
            redirect_to cat_url(@cat)
        else
            render json: cat.errors.full_messages, status: 422
        end
    end

    def new
        render :new
    end

    def edit
        @cat = Cat.find(params[:id])
        render :edit
    end

    private
    def cat_params
        params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
    end
end