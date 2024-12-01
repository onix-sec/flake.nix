# Onix flake.nix

Will require arround 23Gb in `/nix/store/`.

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
git clone https://github.com/onix-sec/flake.nix && cd flake.nix
nix develop
```

## TODO

- Add a script to generate the list of tools with the link to their homepage

## License

Onix flake.nix is licensed under [MIT](./LICENSE).
