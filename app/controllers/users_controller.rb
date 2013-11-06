class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			SignupMailer.confirm_email(@user).deliver
			redirect_to @user
				flash[:notice] = 'Cadastro criado com sucesso!'
		else
			render :new
		end
	end

	def show
		busca_user
	end

	def edit
		busca_user
	end

	def update
		busca_user
		if @user.update_attributes(params[:user])
			redirect_to @user, :notice => 'Cadastro atualizado com sucesso!'
		else
			render :edit
		end
	end

	private
	def busca_user
		@user = User.find(params[:id])
	end
end