#encoding: UTF-8
require 'test_helper'

class RoomsControllerTest < ActionController::TestCase
	  
	def setup
		@r = Room.create(title: "abc", location: "Chapecó", description: "Casa")
	end 

	test '01 - Lista os arquivos do index' do
		get(:index)
		assert(:success)
		assert_equal(1, assigns(:rooms).count)	
	end

	test '02 - Show mostra um quarto' do
		get(:show, id: @r.id)
		assert(:success)
		assert_equal(assigns(:room), @r)
	end

	test '03 - Instancia novo quarto' do
		get(:new)
		assert(:success)
		assert(assigns(:room).new_record?)
	end

	test '04 - Cria de um quarto' do
		assert_difference("#{Room}.count", +1) do
	  		post(:create, room: {title: "Teste", location: "loclocloc", description: "Padrao"})
	  	end
  		assert_redirected_to room_path(Room.last)
	end

	test '05 - Atualiza um quarto' do
		put(:update, id: @r.id, room:{title: "Alterei"})
		@r.reload
		assert_equal(@r.title, "Alterei")
		assert_redirected_to room_path(@r.id)
	end

	test '06 - Deletando um quarto' do
		assert_difference("#{Room}.count", -1) do
			delete(:destroy, id: @r.id)
		end
		assert_redirected_to rooms_url
	end
 
end
