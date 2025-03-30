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
	docker/run.sh --cmd "bashcov -- ./test/scripts/run_bats.sh 1 && if [ -d doc/build_coverage ]; then rm -rf doc/build_coverage; fi; cp -r coverage doc/build_coverage"

.PHONY: charts
charts:
	docker/run.sh --cmd "termgraph .project_history/shellcheck --color {red,yellow,green}; \
		unbuffer termgraph .project_history/shellcheck --color {red,yellow,green} | \
			/git_repos/ansi2html/ansi2html.sh --bg=dark > test.html; \
		termgraph .project_history/coverage --custom-tick "-" --color {yellow,green} --width 50 ; \
		unbuffer termgraph .project_history/coverage --custom-tick "😀" --width 50 | \
			/git_repos/ansi2html/ansi2html.sh --bg=dark >> test.html; \
		termgraph .project_history/coverage --stacked --color {yellow,green}; \
		unbuffer termgraph .project_history/coverage --stacked --different-scale --vertical --color {yellow,green} | tee -a | \
			/git_repos/ansi2html/ansi2html.sh --bg=dark >> test.html "


.PHONY: shellcheck
shellcheck:
	docker/run.sh --cmd "if [ -d doc/build_shellcheck ]; then rm -rf doc/build_shellcheck; fi;  mkdir doc/build_shellcheck; \
	shellcheck ./src/*.bash ./docker/run.sh ./test/scripts/run_bats.sh > doc/build_shellcheck/checkstyle_shellcheck.xml; \
	shellcheck ./src/*.bash ./docker/run.sh ./test/scripts/run_bats.sh"


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

