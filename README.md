# API ROR

Develop an Api RESTful with requirements detailed on gist https://gist.github.com/rodrei/f401fbdc37cd8b68d4f2

# Authentication

	GET /api/sign_up

		curl -H "Content-type: application/json" -X POST \
		-d '{"email":"jimenanasrala@api.com", \
		"password":"jime1234","name":"Jimena Nasrala"}' \
		http://localhost:3000/api/sign_up

	GET /api/sign_in

		curl -H "Content-type: application/json" -X POST \
		-d '{"email":"laranicolas@api.com", "password":"nico1234"}' \
		http://localhost:3000/api/sign_in

	DELETE /api/sign_out

		curl -H "Authorization: Token token=9LqBuORPaw-1_-wcdhbhpA" -X DELETE \
		http://localhost:3000/api/sign_out

# RESTful routes

{entities => [users, comments, blog_posts]}

	GET /api/entities

		Example:

			curl -H "Authorization: Token token=9LqBuORPaw-1_-wcdhbhpA" \
			http://localhost:3000/api/users

		Response:

			{"users":[{"id":1,"name":"Nicolas Lara","email":"laranicolas@api.com", \ 
			"token":"9LqBuORPaw-1_-wcdhbhpA"},{"id":2,"name":"Rodrigo Pavano", \
			"email":"rodrigopavano@api.com","token":"VTXnMaXukR1FNKBODh-p0A"}, \ 
			{"id":3,"name":"Victor Quiroga","email":"victorquiroga@api. com", \
			"token":"0nF9IzUiPy1ie57OZq9bGA"},{"id":4,"name":"Matthew Salerno", \ 
			"email":"matthewsalerno@api.com","token":"NYqORDHrAlhMHa1qjLCGIg"}

	GET /api/entities/:entity_id

		Example:

			curl -H "Authorization: Token token=9LqBuORPaw-1_-wcdhbhpA" \
			-H "Content-type: application/json" -X GET \
			http://localhost:3000/api/users/1

		Response:

			{"id":1,"name":"Nicolas Lara","email":"laranicolas@api.com", \
			"token":"9LqBuORPaw-1_-wcdhbhpA"}

	POST /api/entities/:entity_id

		Example:

			curl -H "Authorization: Token token=9LqBuORPaw-1_-wcdhbhpA" \
			-H "Content-type: application/json" -X POST \
			-d '{"email":"prueba@api.com", "password":"prueba1234"}' \
			http://localhost:3000/api/users

		Response:

			{"id":5,"name":null,"email":"prueba@api.com", \
			"token":"n0yNLIah4FSNL0UgeEJlFA"}

	PUT/PATCH /api/entities/:entity_id

		Example:

			curl -H "Authorization: Token token=9LqBuORPaw-1_-wcdhbhpA" \
			-H "Content-type: application/json" -X PUT \
			-d '{"name":"Prueba CURL"}' http://localhost:3000/api/users/5

		Response:

			{"id":5,"name":"Prueba CURL","email":"prueba@api.com", \ 
			"token":"n0yNLIah4FSNL0UgeEJlFA"}

	DELETE /api/entities/:entity_id

		Example:

			curl -H "Authorization: Token token=9LqBuORPaw-1_-wcdhbhpA" \
			-H "Content-type: application/json" -X DELETE \
			http://localhost:3000/api/users/4

		Response:

			204 no content.