antora-default:
	mkdir -p tmp
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		antora-default.yml \
		2>&1 | tee tmp/antora-default.log

rancher-current:
	mkdir -p tmp
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		rancher-current.yml \
		2>&1 | tee tmp/rancher-current.log

rancher-dsc:
	mkdir -p tmp
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		rancher-dsc.yml \
		2>&1 | tee tmp/rancher-dsc.log

clean:
	rm -rf build*

environment:
	npm ci || npm install
