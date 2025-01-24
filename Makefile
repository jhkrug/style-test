local:
	mkdir -p tmp
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		st-local-playbook.yml \
		2>&1 | tee tmp/local-build.log

local-def:
	mkdir -p tmp
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		st-local-playbook-default.yml \
		2>&1 | tee tmp/local-build-default.log

local-dsc:
	mkdir -p tmp
	unzip -o dsc-style-bundle/default-ui/ui-bundle.zip -d tmp/sp
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		st-local-playbook-dsc-style-bundle.yml \
		2>&1 | tee tmp/local-build-dsc.log

remote:
	mkdir -p tmp
	wget 'https://github.com/rancher/product-docs-ui/blob/main/build/ui-bundle.zip?raw=true' -O tmp/ui-bundle.zip
	unzip -o tmp/ui-bundle.zip -d tmp/sp
	npm ci
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		st-remote-playbook.yml \
		2>&1 | tee tmp/remote-build.log

remote-def:
	mkdir -p tmp
	wget 'https://gitlab.com/antora/antora-ui-default/-/jobs/artifacts/HEAD/raw/build/ui-bundle.zip?job=bundle-stable' -O tmp/ui-bundle.zip
	unzip -o tmp/ui-bundle.zip -d tmp/sp
	npm ci
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		st-remote-playbook-default.yml \
		2>&1 | tee tmp/remote-build-def.log

remote-dsc:
	mkdir -p tmp
	unzip -o dsc-style-bundle/default-ui/ui-bundle.zip -d tmp/sp
	npm ci
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		st-local-playbook-dsc-style-bundle.yml \
		2>&1 | tee tmp/local-build-dsc.log

clean:
	rm -rf build
	rm -rf build-ns
	rm -rf build-def
	rm -rf build-dsc

environment:
	npm install && npm update
