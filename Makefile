# note, ${base_dir} is defined in the Makefiles that include this Makefile.in

.PHONY: build
build:
	docker/run.sh --build

.PHONY: start
start:
	docker/run.sh --start

.PHONY: into
into:
	docker/run.sh --into

.PHONY: stop
stop:
	docker/run.sh --stop

.PHONY: remove
remove:
	docker/run.sh --remove

.PHONY: restart
restart: stop build start

