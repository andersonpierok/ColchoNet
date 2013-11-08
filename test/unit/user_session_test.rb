#encoding: UTF-8
require 'test_helper'

class UserSessionTest < ActiveSupport::TestCase
	def setup
		# "full_name", "email", "password", "location", "bio", "created_at", "updated_at", "id"
		@s = UserSession.new(email: "aaa@aaa.com.br", password: "senha")
		@u = User.new(bio: "aaaaaaaaabaaaaaaaaabaaaaaaaaab", email: "aaa@aaa.com.br", full_name: "AAA", location: "AAA, AA", password: "senha")
	end

	# test '01 - Autenticar' do
	# 	assert(@u.save, 'Não Salvou')
	# 	assert_not_nil(User.authenticate(@u.email, @u.password))
	# 	assert_not_nil(@s.store(@u))

		
	# 	# assert_not_equal(User.authenticate(@u.email, @u.password), false)
	# 	# assert_not_equal(@s.authenticate(user), false)
		
	# end

end