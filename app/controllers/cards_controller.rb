 # app/controllers/api/v1/cards_controller.rb
 class Api::V1::CardsController < Api::V1::BaseController
  before_action :set_card, only: [:show, :update, :destroy]
  def index
   @cards = Card.all
 end

 def show
 end

 def update
   if @card.update(card_params)
     render :show
   else
     render_error
   end
 end

 def destroy
   @card.destroy
   head :no_content
 end

 def create
   @card = Card.new(card_params)
   if @card.save
     render :show, status: :created
   else
     render_error
   end
 end

private

def set_card
 @card = Card.find(params[:id])
end

private

def card_params
 params.require(:card).permit(:name, :description, :user_id)
end

def render_error
 render json: { errors: @card.errors.full_messages }, status: :unprocessable_entity
end

end
