build:
	# This is meant to test building locally. Edit Makefile and change the SSH_IMPORT_ID build-arg as needed.
	sleep 5
	docker build --build-arg SSH_IMPORT_ID=gh:YOURUSERNAMEHERE -t libpam-mysql:latest .
