package demo

_myApp: development: mystack: dev: {
	image:     "myrepo/myapp-image"
	image_tag: "1.2.xyz"
	replicas:  2

	hostname: "myappdev.labs.example.com"

	database_host: "dev-database.lab.example.com"
}

_myApp: production: mystack: prd: {
	image:     "myrepo/myapp-image"
	image_tag: "1.2.xyz"
	replicas:  2

	hostname: "myapp.example.com"

	database_host: "prd-database.example.com"
}
