#encoding: UTF-8
require 'test_helper'

class HomeControllerTest < ActionController::TestCase

	def setup
		@r = Room.create(title: "abc", location: "Chapecó", description: "Casa")
		@a = Room.create(title: "abc", location: "Chapecó", description: "Casa")
		@b = Room.create(title: "abc", location: "Chapecó", description: "Casa")
		@c = Room.create(title: "abc", location: "Chapecó", description: "Casa")
	end

	test '01 - Testa a exibição no index' do
		get(:index)
		assert(:success)
		assert_equal(3, assigns(:rooms).count)
	end

end