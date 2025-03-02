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


.PHONY: test
test:
	docker/run.sh --cmd "./test/scripts/run_bats.sh"


.PHONY: restart
restart: stop build start

