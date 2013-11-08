#encoding: UTF-8
require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
  	# "full_name", "email", "password", "location", "bio", "created_at", "updated_at", "id"
  	@u = User.new(bio: "aaaaaaaaabaaaaaaaaabaaaaaaaaab", email: "aaa@aaa.com.br", full_name: "AAA", location: "AAA, AA", password: "aa")
  end

  test '01 - Cria Novo Livro' do
  	assert @u.save, "Não salvou"
  end

  test '02 - Verifica campos obrigatórios' do
  	@u.bio = nil
  	assert !@u.save, "Bio em branco"
  	@u.bio = "aaaaaaaaabaaaaaaaaabaaaaaaaaab"
  	@u.full_name = nil
  	assert !@u.save, "Nome em branco"
  	@u.full_name = "AAA"
  	@u.location = nil
  	assert !@u.save, "Localização em branco"
  	@u.location = "AAA, AA"
  end

  test '03 - Verifica tamanho dos campos' do
  	@u.bio = "aaaaaaaaabaaaaaaaaabaaaaaaaaa"
  	assert !@u.save, "Bio com menos caracteres"
  	@u.bio = "aaaaaaaaabaaaaaaaaabaaaaaaaaab"
  end

  test '04 - Verifica formato do email' do
  	@u.email = "aaa.com"
  	assert !@u.save, "Email sem @"
  	@u.email = "aaaa"
  	assert !@u.save, "Email invalido"
  	@u.email = "a@a"
  	assert !@u.save, "Email sem .com"
  	@u.email = "aaa@aaa.com.br"
  end

  test '05 - Validacao email único' do
  	assert(@u.save, "Deve Salvar")
  	u_copia = User.new(bio: "aaaaaaaaabaaaaaaaaabaaaaaaaaab", email: "aaa@aaa.com.br", full_name: "AAA", location: "AAA, AA", password: "aa")
  	assert(!u_copia.save, "Salvou com email duplicado")
  end

  test '06 - Geração do token' do
	@u.generate_token()
	assert_not_nil(@u.confirmation_token)
  end

  test '07 - Confirmacao da conta' do
	@u.confirm!
	assert_not_nil(@u.confirmed_at)
  end
end