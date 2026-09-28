# Profile applied by 'make update'. Override with: make update PROFILE=asheludchenkov
PROFILE ?= aleshka

.PHONY: update
update:
	home-manager switch --flake .#$(PROFILE)

.PHONY: asheludchenkov
asheludchenkov:
	$(MAKE) update PROFILE=asheludchenkov

.PHONY: clean
clean:
	nix-collect-garbage -d

.PHONY: flake-update
flake-update:
	nix flake update
