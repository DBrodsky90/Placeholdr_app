User.destroy_all
Board.destroy_all
Image.destroy_all

User.create({
	username: "llevine",
	first_name: "Lauren",
	last_name: "Levine",
	password: "lauren",
	password_confirmation: "lauren",
	avatar: "http://www.placecage.com/g/200/200"
	})

User.create({
	username: "davidbrodsky",
	first_name: "David",
	last_name: "Brodsky",
	password: "david",
	password_confirmation: "david",
	avatar: "http://placesheen.com/200/200"
	})

User.create({
	username: "mandytrex",
	first_name: "Amanda",
	last_name: "Trexler",
	password: "amanda",
	password_confirmation: "amanda",
	avatar: "http://placekitten.com/g/200/200"
	})

