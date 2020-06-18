class PartiesController < ApplicationRecord
    
    def new
        @party = Party.new
        @categories = Category.all
    end

    def create
        @party = current_user.parties.build(party_params)
        if @party.save
          redirect_to party_path(current_user, @party)
        else
          render :new
        end
    end

    def show
        @party = Party.find_by(id: params[:id])
    end 

    def edit
        
    end 

    def update
        @party.update(party_params)
        redirect_to party_path(current_user, @party)
    end 

    def destroy
        @party.destroy
        redirect_to party_path(current_user, @party)
    end 

    private

    def party_params
      params.require(:party).permit(:title, :date, :time, :category_id, :user_id)
    end

end 