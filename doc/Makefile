all: collect prepare release_run
all_local: collect_local prepare release_run
prepare_local: prepare release_run

build_docker:
	docker build --target builder -f Dockerfile --tag dischub_mkdocs_build_container .

run: build_docker
	docker run --rm -it -p 81:81 dischub_mkdocs_build_container

up:
	docker run --rm -td -p 81:81 --name testmkd -v "./readme.md":"/app/docs/readme.md":ro -v "./static_html":"/app/site":rw -v "./build_coverage":"/app/docs/build_coverage":ro -v "./build_shellcheck":"/app/docs/build_shellcheck":ro -v "./build_zsdoc":"/app/docs/build_zsdoc":ro -v "./build":"/app/docs/build":rw dischub_mkdocs_build_container

#w	docker run --rm -td -p 81:81 --name testmkd -v "./docs":"/app/docs":rw dischub_mkdocs_build_container
stop:
	docker stop testmkd

into:
	docker exec -it --user testmkd  /bin/sh

offline:
	docker exec -t testmkd  /bin/sh -c "mkdocs build; chmod -R 775 /app/site"


release:
	docker build -f Dockerfile --tag mkdocs_release_container .

release_run:
	docker run --rm -it -p 81:81 mkdocs_release_container

release_up:
	docker run --rm -td -p 81:81 --name release_mkd -v "./static_html":"/app/site":rw -v "./build_coverage":"/app/build_coverage":rw -v "./build":"/app/build":rw mkdocs_release_container

release_offline:
	docker exec -t release_mkd  /bin/sh -c "mkdocs build && cp -r site build/"

release_stop:
	docker stop release_mkd

collect:
	./collect_readmes.sh

prepare:
	./prepare.sh

