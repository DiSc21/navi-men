all: collect prepare release_run
all_local: collect_local prepare release_run
prepare_local: prepare release_run

build_docker:
	docker build --target builder -f Dockerfile --tag dischub_mkdocs_build_container .

run: build_docker
	docker run --rm -it -p 81:81 dischub_mkdocs_build_container

up:
	docker run --rm -td -p 81:81 --name testmkd -v "./docs":"/app/docs":rw dischub_mkdocs_build_container

stop:
	docker stop testmkd

into:
	docker exec -it testmkd  /bin/sh

offline:
	docker exec -t testmkd  /bin/sh -c "mkdocs build"


release:
	docker build -f Dockerfile --tag mkdocs_release_container .

release_run:
	docker run --rm -it -p 81:81 mkdocs_release_container

release_up:
	docker run --rm -td -p 81:81 --name release_mkd -v "./build_coverage":"/app/build_coverage":r -v "./build":"/app/build":rw mkdocs_release_container

release_offline:
	docker exec -t release_mkd  /bin/sh -c "cp -r site build/"

release_stop:
	docker stop release_mkd

collect:
	./collect_readmes.sh

prepare:
	./prepare.sh

