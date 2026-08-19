.PHONY: update
update:
	home-manager switch --flake .#aleshka

.PHONY: clean
clean:
	nix-collect-garbage -d

.PHONY: flake-update
flake-update:
	nix flake update
