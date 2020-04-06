# My dotfiles

### Features

- `stow` powered: dotfiles are symlinked and kept up-to-date
- organised per app/topic
- supports private files

### Special files/folders

- `bootstrap` script used for quick setup on new machine
- `Aurfile` / `Pacmanfile` - contains a list of packages I want to have on each machine: both files may have its local counterpart that ends with .HOSTNAME


### Private files support

#### tl;dr:
Use `scripts/encrypt` and `scripts/decrypt`

#### Description:

Since I have some files that I don't want to share publicly, yet I want to sync them between my machines, I have 2 special folders:

- `private`. This folder is _private_: its content is not included in the repository.
- `vault`. This folder stores encrypted version of a file that is stored in `private` folder.

Each file is encrypted by PGP (via `keybase` app). Its name is also hased for privacy reasons. Hash -> name mapping is stored in `index.enc`

## Usage

- clone repo to your home directory `git@github.com:krzyzak/dotfiles.git`
- (optionally) run `./bootstrap`
- decrypt files via `scripts/decrypt`

Now you can symlink projects via `stow FOLDER`, eg. `stow ruby`


## Last note

While I don't expect (nor encourage) others to _actually_ use my dotfiles, I don't mind if you do. Since this is a very personal repo, I doubt that I'd accept any PR here, but since it's open source, you can try ;)

