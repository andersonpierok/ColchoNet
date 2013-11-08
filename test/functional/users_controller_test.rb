#encoding: UTF-8
require 'test_helper'

class UsersControllerTest < ActionController::TestCase

	def setup
		@u = User.create(bio: "aaaaaaaaabaaaaaaaaabaaaaaaaaab", email: "aaa@aaa.com.br", full_name: "AAA", location: "AAA, AA", password: "senha")
	end

	test '01 - Instancia novo usuário' do
		get(:new)
		assert(:success)
		assert(assigns(:user).new_record?)
	end

	# test '02 - Cria novo usuário' do
	# 	assert_difference("#{User}.count", +1) do
	# 		post(:create, user: {bio: "aaaaaaaaabaaaaaaaaabaaaaaaaaab", email: "aaa@bbb.com.br", full_name: "AAA", location: "AAA", password: "senha"})
	# 	end
	# 	assert_redirected_to user_path(User.last)
	# end

	test '03 - Mostra usuário' do
		get(:show, id: @u.id)
		assert(:success)
		assert_equal(assigns(:user), @u)
	end

	test '04 - Atualiza cadastro' do
		put(:update, id: @u.id, user: {email: "anderson@etica-ti.com.br"})
		assert(:success)
		@u.reload
		assert_equal(@u.email, "anderson@etica-ti.com.br")
		assert_redirected_to user_path(@u.id)
	end
end