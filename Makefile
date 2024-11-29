local:
	mkdir -p tmp
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		st-local-playbook.yml \
		2>&1 | tee tmp/local-build.log

local-ns:
	mkdir -p tmp
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		st-local-playbook-new-style.yml \
		2>&1 | tee tmp/local-build-new-style.log

local-def:
	mkdir -p tmp
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		st-local-playbook-default.yml \
		2>&1 | tee tmp/local-build-default.log

remote:
	mkdir -p tmp
	wget 'https://github.com/rancher/product-docs-ui/blob/main/build/ui-bundle.zip?raw=true' -O tmp/ui-bundle.zip
	unzip -o tmp/ui-bundle.zip -d tmp/sp
	npm install && npm update
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		st-remote-playbook.yml \
		2>&1 | tee tmp/remote-build.log

remote-ns:
	mkdir -p tmp
	wget 'https://github.com/rancher/product-docs-ui/blob/main/build/ui-bundle.zip?raw=true' -O tmp/ui-bundle.zip
	unzip -o tmp/ui-bundle.zip -d tmp/sp
	npm install && npm update
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		st-remote-playbook-new-style.yml \
		2>&1 | tee tmp/remote-build-new-style.log

remote-def:
	mkdir -p tmp
	wget 'https://gitlab.com/antora/antora-ui-default/-/jobs/artifacts/HEAD/raw/build/ui-bundle.zip?job=bundle-stable' -O tmp/ui-bundle.zip
	unzip -o tmp/ui-bundle.zip -d tmp/sp
	npm install && npm update
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		st-remote-playbook-default.yml \
		2>&1 | tee tmp/remote-build-def.log

clean:
	rm -rf build
	rm -rf build-ns
	rm -rf build-def

environment:
	npm install && npm update
