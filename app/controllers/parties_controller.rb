class PartiesController < ApplicationRecord
    def new
        @party = Party.new
        @categories = Category.all
    end

    def create
        @party = Party.create(party_params)
        @party.add_category(params[:party][:category_id], params[:party][:categories][:name])
        if @party.category
          @party.save
          current_user.party << @party
          redirect_to party_path(@party)
        else
          @categories = Category.all
          render 'parties/new'
        end
    end


    private

    def party_params
      params.require(:party).permit(:title, :start_at, :category_id, todo_ids:[], todo_attributes: [:name])
    end
  




end 