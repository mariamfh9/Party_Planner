class PartiesController < ApplicationController

  def index 
    @parties = current_user.parties
  end 


  def new
    #if params[:category_id]
      #@category = current_user.categories.find_by(id: params[:category_id])
      #@party = current_user.parties.build
    #else 
     # @party = current_user.parties.build
    #end 
    @party = Party.new 
    @category = @party.build_category 
  end

    def create
      #binding.pry
      @party = current_user.parties.build(party_params)
      #binding.pry
       if @party.save
        #binding.pry 
          redirect_to @party
        else
          redirect_to new_party_path 
        end
    end

    def show
      @party = current_user.parties.find_by(id: params[:id])
    end 

    def edit
      @party = current_user.parties.find_by(id: params[:id])
    end 

    def update
      @party = current_user.parties.find_by(id: params[:id])
        if @party.update(party_params)
          redirect_to @party 
        else 
          render :edit
        end 
    end 

    def destroy
      @party = current_user.parties.find_by(id: params[:id])
    
      @party.destroy
      redirect_to party_path(current_user, @party)
    end 

  private

    def party_params
      params.require(:party).permit(:title, :date, :time, :todos, :category_id, :user_id, category_attributes: [:name])
    end
  
end 