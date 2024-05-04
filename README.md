# Dotfiles

Configuration applied to machines I work on, uses [GNU stow](https://www.gnu.org/software/stow/manual/stow.html) for managing symlinks from this directory to the relevant locations required by the applications I use.

## Linking files

To link files contained within a package, run:
```
$ stow --target=$HOME --verbose <package>
```

Add the `-n` flag to make the command a dry run.

### Wrapper script

A wrapper script `stow.sh` is also available in the `bin` directory which automatically applies the `target` and `verbose` flags

If `direnv` is installed, this script will be available on the `$PATH`
