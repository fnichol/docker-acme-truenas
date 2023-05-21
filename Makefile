DOCKERFILE_SOURCES := $(shell find . -type f -name 'Dockerfile*'  -o -name 'Dockerfile.*' -not -path './tmp/*' -and -not -path './vendor/*')
CHECK_TOOLS += hadolint

IMAGE := $${IMAGE_NAME:-fnichol/acme-truenas}

include vendor/mk/base.mk
include vendor/mk/shell.mk

build: ## Builds Docker image
	@echo "--- $@"
	./build.sh $(IMAGE) $${CIRRUS_TAG:-$${TAG:-dev}} latest
.PHONY: build

clean:
.PHONY: clean

check: check-shell hadolint ## Checks all linting, styling, & other rules
.PHONY: check

hadolint: ## Checks Dockerfiles for linting rules
	@echo "--- $@"
	hadolint $(DOCKERFILE_SOURCES)
.PHONY: hadolint

test:
	@echo "--- $@"
	@if [ -f /.dockerenv ]; then \
		$(MAKE) check; \
	else \
		$(MAKE) check build; \
		docker run --rm -ti -v "$$(pwd):/src" -w /src \
			--entrypoint /bin/sh \
			$(IMAGE) -c 'apk add make && make versions'; \
	fi

.PHONY: test

tag: ## Create a new release Git tag
	@echo "--- $@"
	version=$$(date -u "+%Y%m%dT%H%M%SZ") \
		&& git tag --annotate "$$version" --message "Release: $$version" \
		&& echo "Release tag '$$version' created." \
		&& echo "To push: \`git push origin $$version\`"
.PHONY: tag

update-toc: ## Update README.md table of contents
	markdown-toc -i README.md
.PHONY: update-toc

versions: ## Prints the versions of key tools
	@echo "--- $@"
	@echo "  - acme.sh version"
	@acme.sh --version | sed 's/^/        /'
	@echo "  - deploy_freenas.py help invocation"
	@{ deploy_freenas.py --help 2>&1 || true; } | sed 's/^/        /'
.PHONY: versions
