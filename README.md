# Dotfiles

Configuration applied to machines I work on, uses [GNU stow](https://www.gnu.org/software/stow/manual/stow.html) for managing symlinks from this directory to the relevant locations required by the applications I use.

## Linking files

To link files contained within a package, run:
```
$ stow --target=$HOME --verbose <package>
```

Add the `-n` flag to make the command a dry run.
