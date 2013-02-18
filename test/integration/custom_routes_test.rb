require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  test 'Oeffnet /login auch die Login Seite' do
  	get '/login'
  	assert_response :success
  end

  test 'Oeffnet /logout auch die Logout Seite' do
  	get '/logout'
  	assert_response :redirect
  	assert_redirected_to '/'
  end

  test 'Oeffnet /register auch die Registrierungsseite' do
  	get '/register'
  	assert_response :success
  end

end
