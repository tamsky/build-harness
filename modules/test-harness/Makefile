export TEST_HARNESS_VERSION ?= 0.1.1
## Use CloudPosse url shorterer?
export TEST_HARNESS_REPOSITORY ?= "https://github.com/cloudposse/test-harness"
## $(BUILD_HARNESS_PATH)/vendor
export TEST_HARNESS_PATH ?= $(INSTALL_PATH)/test-harness

## Check if here's cloned test-harness repository
test-harness/check:
	@if [ ! -d $(TEST_HARNESS_PATH) ]; then \
		echo "There's no test-harness $(TEST_HARNESS_VERSION) installed"; \
	else \
		ls $(TEST_HARNESS_PATH); \
	fi

## Install test-harness
test-harness/install:
	@if [ ! -d $(TEST_HARNESS_PATH) ]; then \
		echo "Installing test-harness $(TEST_HARNESS_VERSION)..."; \
		rm -rf $(TEST_HARNESS_PATH); \
		$(GIT) clone -c advice.detachedHead=false --depth=1 -b $(TEST_HARNESS_VERSION) $(TEST_HARNESS_REPOSITORY) $(TEST_HARNESS_PATH); \
		rm -rf $(TEST_HARNESS_PATH)/.git; \
	fi	

## Delete test-harness
test-harness/delete:
	@rm -rf $(TEST_HARNESS_PATH);
