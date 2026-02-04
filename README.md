# git-cli-login

Simple script to switch your Git CLI identity between GitHub accounts.

## Overview

This repo contains a small `git-cli-login` helper that lets you quickly switch your Git CLI identity between multiple profiles (e.g. personal vs work) without committing any of your private data.

Your actual names/emails are stored **only in your home directory**, not in this repository.

## Installation

1. Clone this repository somewhere on your machine.
2. From the repo root, run:

   ```bash
   make install           # installs to /usr/local/bin/git-cli-login (may require sudo)
   # or, to install under your home directory:
   make install PREFIX="$HOME/.local"
   ```

3. Make sure the chosen `bin` directory is on your `PATH`.

## Configuring profiles

The simplest way is to keep all your profile data in a single `.profile` file in this repo’s root.

> Note: `.profile` is gitignored by default so your real emails never leave your machine.

### 1. Create `.profile` with two profiles

You can start from `.profile.example`:

```bash
cp .profile.example .profile
```

Then edit `.profile` to set your real emails. The format is:

```bash
GIT_LOGIN_NAME_personal="Your Personal Name"
GIT_LOGIN_EMAIL_personal="your-personal-email@example.com"

GIT_LOGIN_NAME_work="Your Work Name"
GIT_LOGIN_EMAIL_work="your-work-email@example.com"
```

You can add more profiles by following the same pattern (e.g. `GIT_LOGIN_NAME_oss`, `GIT_LOGIN_EMAIL_oss`, etc.).

### 2. Optional: per-user config directory

If you prefer, you can instead keep per-profile files under:

```bash
~/.git-login/<profile>
```

Each such file should define:

```bash
GIT_LOGIN_NAME="Your Name"
GIT_LOGIN_EMAIL="your-email@example.com"
```

When you run `git-cli-login <profile>`, it will:

- First look for `.profile` in the current directory.
- If not found, fall back to `~/.git-login/<profile>`.

## Usage

Set your global Git identity:

```bash
git-cli-login personal
```

Or, for your work profile:

```bash
git-cli-login work
```

Set identity only for the current repo (uses `git config --local`):

```bash
git-cli-login --local personal
```

Show help:

```bash
git-cli-login --help
```

Under the hood, `git-cli-login` just runs:

- `git config --global user.name "<name>"`
- `git config --global user.email "<email>"`

or the `--local` equivalents when you pass `--local`.

