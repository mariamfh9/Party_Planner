class PartiesController < ApplicationRecord

    def new
        @party = Party.new
        @categories = Category.all
    end

    def create
        @party = current_user.parties.build(party_params)
        @party.add_category(params[:party][:category_id], params[:party][:categories][:name])
        if @party.category
          @party.save
          redirect_to party_path(current_user, @party)
        else
          @categories = Category.all 
          render 'parties/new'
        end
    end

    def show
        @party = Party.find_by(id: params[:id])
        @todo = Todo.new 
    end 

    def edit
        @party = Party.find(params[:id])
        @categories = Category.all
    end 

    def update
        @party.update(party_params)
        redirect_to party_path(current_user, @party)
    end 

    def destroy
        @party = Party.find(params[:id])
        todo = @party.todos.select {|s| s.party_id == @party.id}.each do |todo|
        end 
        @party.destroy
        redirect_to party_path(current_user, @party)
    end 

    private

    def party_params
      params.require(:party).permit(:title, :date, :time, :category_id, :user_id)
    end

end 