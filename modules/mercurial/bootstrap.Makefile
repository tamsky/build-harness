ifeq ($(MODULE_GIT__BOOTSTRAP_EXITCODE)$(wildcard .hg/git),)
  $(warning disabling hg+git bootstrapping)
else
  $(warning hg+git bootstrap START)

HG ?= $(shell which hg)

export GIT_COMMIT ?= $(shell $(HG) log --template '{gitnode}\n' -r .)
export GIT_COMMIT_SHORT ?= $(shell $(HG) log --template '{gitnode|short}' -r .)
export GIT_BRANCH ?= $(shell $(HG) id -B -r .)
export GIT_LATEST_TAG ?= $(shell $(HG) log -r . --template '{latesttag}' 2>/dev/null | cut -f1 -d:)

export GIT_TIMESTAMP ?= $(shell $(HG) log -r. --template '{date|hgdate}' 2>/dev/null | cut -f1 -d' ')

ifeq ($(GIT_LATEST_TAG),)
  export GIT_LATEST_TAG="0.0.0"
endif

ifeq ($(GIT_BRANCH),)
  export GIT_IS_BRANCH := 0
else
  export GIT_IS_BRANCH := 1
endif

ifeq ($(shell $(HG) log -r . --template '{latesttagdistance}' 2>/dev/null),0)
  export GIT_IS_TAG := 1
else
  export GIT_IS_TAG := 0
endif

endif

# probably not needed:
$(shell cd $(BUILD_HARNESS_PATH))
