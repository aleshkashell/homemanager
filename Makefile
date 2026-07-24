.PHONY: update
update:
	home-manager switch --flake .#aleshka

.PHONY: clean
clean:
	nix-collect-garbage -d
