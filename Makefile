local-antora-default:
	mkdir -p tmp
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		local-antora-default.yml \
		2>&1 | tee tmp/local-antora-default.log

local-rancher-current:
	mkdir -p tmp
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		local-rancher-current.yml \
		2>&1 | tee tmp/local-rancher-current.log

local-rancher-dsc:
	mkdir -p tmp
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		local-rancher-dsc.yml \
		2>&1 | tee tmp/local-rancher-dsc.log

local-dsc:
	mkdir -p tmp
	unzip -o dsc-style-bundle/default-ui/ui-bundle.zip -d tmp/sp
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		st-local-playbook-dsc-style-bundle.yml \
		2>&1 | tee tmp/local-build-dsc.log

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
	rm -rf build*

environment:
	npm ci || npm install
