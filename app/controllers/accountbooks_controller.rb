class AccountbooksController < ApplicationController
	def index
		if user_signed_in?
			@item = Accountbook.all
			@item = @item.where("user_id = ?", current_user.id).order("created_at desc").page(params[:page]).per(5)
		end
	end
	def new 
		@item = User.find(current_user.id)
		@item = @item.accountbooks.new
	end
	def create
		@item = User.find(current_user.id)
		@item.accountbooks.create(c_params)		
		redirect_to root_path

	end

	def board
		@item = Accountbook.select("kind, sum(cost) as Sum").group("kind")
		@item = @item.where("user_id = ?", current_user.id)
	end

	private
	def c_params
		params.require(:accountbook).permit(:cost,:kind)
	end
end
