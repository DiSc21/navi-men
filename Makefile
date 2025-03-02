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

.PHONY: bashcov
bashcov:
	docker/run.sh --cmd "bashcov -- ./test/scripts/run_bats.sh && mv coverage doc/build_coverage"

.PHONY: shellcheck
shellcheck:
	docker/run.sh --cmd "if [ -d doc/build_shellcheck ]; then rm -rf doc/build_shellcheck; fi;  mkdir doc/build_shellcheck; \
	shellcheck -f checkstyle ./src/navi_men.sh ./docker/run.sh ./test/scripts/run_bats.sh > doc/build_shellcheck/checkstyle_shellcheck.xml; \
	shellcheck -f gcc ./src/navi_men.sh ./docker/run.sh ./test/scripts/run_bats.sh > doc/build_shellcheck/gcc_shellcheck.xml; \
	shellcheck -f checkstyle ./src/navi_men.sh ./docker/run.sh ./test/scripts/run_bats.sh | \
	xmlstarlet tr doc/checkstyle2junit.xslt > doc/build_shellcheck/shellcheck.xml; \
	junit2html doc/build_shellcheck/shellcheck.xml --summary-matrix > doc/build_shellcheck/shellcheck.html; \
	pandoc -f jats -t html doc/build_shellcheck/gcc_shellcheck.xml > doc/build_shellcheck/pandoc_shellcheck.html"
	#/git_repos/cppcheck/htmlreport/cppcheck-htmlreport \
	#	--source-dir=src \
	#	--title=navi_men_quality \
	#	--file=cppref.xml \
	#	--report-dir=doc/build_shellcheck; \

.PHONY: zsdoc
zsdoc:
	docker/run.sh --cmd "zsd --bash --verbose --scomm src/navi_men.sh docker/run.sh; \
		if [ -d doc/build_zsdoc ]; then rm -rf doc/build_zsdoc; fi;  mkdir doc/build_zsdoc; \
		asciidoctor -b docbook -a leveloffset=+1 -o - zsdoc/navi_men.sh.adoc | \
		pandoc --wrap=preserve -t markdown_strict -f docbook - > doc/build_zsdoc/doc_navi_men.md; \
		asciidoctor -b docbook -a leveloffset=+1 -o - zsdoc/run.sh.adoc | \
		pandoc --wrap=preserve -t markdown_strict -f docbook - > doc/build_zsdoc/doc_docker_run.md;"

.PHONY: restart
restart: stop build start

