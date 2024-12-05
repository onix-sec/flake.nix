# Onix Shell

## Usage

### Requirements

- [Nix](https://nixos.org/download/)
- Configure Nix to allow `nix-command` and `flakes`:

  ```bash
  mkdir ~/.config/nix
  cat > ~/.config/nix/nix.config << EOF
  experimental-features = nix-command flakes
  EOF
  ```

### Install

```bash
git clone https://github.com/onix-sec/onix-shell
cd onix-shell
```

Edit `flake.nix` to choose the tools you need.

```bash
nix develop
```

## TODO

- Add a script to generate the list of tools with the link to their homepage

## License

Onix shell is licensed under [MIT](./LICENSE).
