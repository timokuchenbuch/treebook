require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "Ein Nutzer sollte den Vornamen eingeben" do
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?
	end

	test "Ein Nutzer sollte den Nachnamen eingeben" do
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end

	test "Ein Nutzer sollte den Profilnamen eingeben" do
		user = User.new
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "Ein Nutzer sollte einen einzigartigen Profilnamen haben" do
		user = User.new
		user.profile_name = users(:jason).profile_name

		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "Profilname darf keine Leerzeichen enthalten" do
		user = User.new
		user.profile_name = 'Timo Kuchenbuch'

		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?('Ohne Leerzeichen')
	end
end
