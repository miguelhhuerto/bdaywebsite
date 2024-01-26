class PicturesController < ApplicationController
    def index
        @pictures = Picture.all.page(params[:page]).per(9)
        @picture = Picture.new
        
    end

    def new
       @picture = Picture.new
    end

    def create
      @picture = Picture.new(picture_params)
    
      if @picture.save
        redirect_to pictures_path, notice: 'Picture was successfully uploaded.'
      else
        flash[:alert] = 'Picture upload failed'
        redirect_to pictures_path(anchor: 'upload-section')
      end
    end
    
    
  
      def show
        @picture = Picture.find(params[:id])
      end

      def edit
        @picture = Picture.find(params[:id])
      end

    def update
        @picture = Picture.find(params[:id])
        if @picture.update(params.require(:picture).permit(:image,:caption, :author))
        flash[:notice] = 'picture updated successfully'
         redirect_to pictures_path
         else
     flash.now[:alert] = 'picture update failed'
     render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @picture = Picture.find(params[:id])
        @picture.destroy
        flash[:notice] = 'picture destroyed successfully'
        redirect_to pictures_path
    end
    
      private
    
      def greeting_params
        params.require(:greeting).permit(:message, :author)
      end

      def picture_params
        params.require(:picture).permit(:image, :author, :caption)
      end
end
