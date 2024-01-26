class GreetingsController < ApplicationController
    def index
        @greetings = Greeting.all.page(params[:page]).per(9)
        @greeting = Greeting.new
    end

    def new
       @greeting = Greeting.new
    end

    def create
        @greeting = Greeting.new(greeting_params)
        if @greeting.save
          # Handle successful save, e.g., redirect to another page
          flash[:notice] = 'Greeting was successfully submitted.'
          redirect_to greetings_path, notice: 'Greeting was successfully submitted.'
        else
            flash.now[:alert] = 'Greeting was not saved!'
          render :new
        end
      end

      def show
        @greeting = Greeting.find(params[:id])
      end

      def edit
        @greeting = Greeting.find(params[:id])
      end

    def update
        @greeting = Greeting.find(params[:id])
        if @greeting.update(params.require(:greeting).permit(:message, :author))
        flash[:notice] = 'greeting updated successfully'
         redirect_to greetings_path
         else
     flash.now[:alert] = 'greeting update failed'
     render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @greeting = Greeting.find(params[:id])
        @greeting.destroy
        flash[:notice] = 'greeting destroyed successfully'
        redirect_to greetings_path
    end
    
      private
    
      def greeting_params
        params.require(:greeting).permit(:message, :author)
      end

end
