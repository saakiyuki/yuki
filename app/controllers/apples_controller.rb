class ApplesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]  
    def index
        @apples = Apple.all
    end
    
    
    def new
        @apple = Apple.new
      end
    
      def create
        apple = Apple.new(apple_params)
        if apple.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
      def show
        @apple = Apple.find(params[:id])
      end




      def edit
        @apple = Apple.find(params[:id])
      end

      def update
        apple = Apple.find(params[:id])
        if apple.update(apple_params)
          redirect_to :action => "show", :id => apple.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        apple = Apple.find(params[:id])
        apple.destroy
        redirect_to action: :index
      end

      def create
        apple = Apple.new(apple_params)
    
        apple.user_id = current_user.id  #追記
    
        if apple.save
          redirect_to action: "index"
        else
          redirect_to action: "new"
        end
      end 

      private
      def apple_params
        params.require(:apple).permit(:name, :date, :adress, :about, :user_id, :image,:lat,:lng)
      end 


end
