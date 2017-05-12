UNAME := $(shell uname)

CONFIGS := \
	.bash_profile \
	.bashrc \
	.bashrc.$(UNAME) \
	.git-prompt.sh \
	.gitconfig \
	.i3 \
	.vim \
	.vimrc \

ifeq ($(UNAME),Linux)
	CONFIGS += \
		.xmodmap \
		.xsession
endif

TARGETS = $(addprefix $(HOME)/, $(CONFIGS))

all: $(TARGETS)

$(HOME)/%:
	ln -s $(HOME)/configs/$(@F) $@

# Creates a \n that can be used in the foreach
define \n


endef

.PHONY: clean
clean:
	# The || true catches a case where make would return an error if a file wasn't found
	$(foreach TARGET, $(TARGETS), (test -L $(TARGET) && rm $(TARGET)) || true;${\n})
