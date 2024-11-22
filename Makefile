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
		2>&1 | tee tmp/local-build.log

remote:
	mkdir -p tmp
	wget 'https://github.com/rancher/product-docs-ui/blob/main/build/ui-bundle.zip?raw=true' -O tmp/ui-bundle.zip
	unzip -o tmp/ui-bundle.zip -d tmp/sp
	npm install && npm update
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		st-remote-playbook.yml \
		2>&1 | tee tmp/remote-build.log

clean:
	rm -rf build
	rm -rf build-ns

environment:
	npm install && npm update
