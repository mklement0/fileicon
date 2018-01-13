[![npm version](https://img.shields.io/npm/v/fileicon.svg)](https://npmjs.com/package/fileicon) [![license](https://img.shields.io/npm/l/fileicon.svg)](https://github.com/mklement0/fileicon/blob/master/LICENSE.md)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

**Contents**

- [fileicon &mdash; introduction](#fileicon-&mdash-introduction)
- [Examples](#examples)
- [Installation](#installation)
  - [Installation from the npm registry](#installation-from-the-npm-registry)
  - [Manual installation](#manual-installation)
- [Usage](#usage)
- [License](#license)
  - [Acknowledgements](#acknowledgements)
  - [npm dependencies](#npm-dependencies)
- [Changelog](#changelog)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# fileicon &mdash; introduction

`fileicon` is a macOS CLI for managing custom icons for files and folders, as 
a programmatic alternative to interactively using Finder.

`fileicon` allows assigning a custom icon to any file or folder,
using [any image file whose format is recognized by the system](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CocoaDrawingGuide/Images/Images.html#//apple_ref/doc/uid/TP40003290-CH208-BCIIFBJG).

_Caveat_: Custom icons rely on [extended attributes](https://en.wikipedia.org/wiki/Extended_file_attributes#OS_X) of the macOS filesystems, 
[HFS+](https://en.wikipedia.org/wiki/HFS_Plus) and [APFS](https://en.wikipedia.org/wiki/Apple_File_System).
Therefore, custom icons are lost when copying files or folders to filesystems that don't
support these attributes; for instance, custom icons cannot be stored in a Git repository.

When assigning an image file with `fileicon set`, a set of icons in several
resolutions is created and stored in the resource fork of the target file itself
/ of a hidden `Icon\r` file inside the target folder.

The icon with the highest resolution measures 512 x 512 pixels, and the input
image is scaled accordingly.  
Note that input images that aren't square can result in distorted icons;
for best results, provide square images.

# Examples

```sh
# Assign custom icon derived from image file 'img.png' to file 'foo':
fileicon set foo img.png

# Remove previously assigned custom icon from folder 'foodir':
fileicon rm foodir

# Extract custom icon from file 'foo' to icon file 'foo.icns':
fileicon get foo

# Test if folder 'foodir' has custom icon:
fileicon test foodir
```

# Installation

**Supported platforms**

* **macOS**

## Installation from the npm registry

With [Node.js](http://nodejs.org/) or [io.js](https://iojs.org/) installed, install [the package](https://www.npmjs.com/package/fileicon) as follows:

    [sudo] npm install fileicon -g

**Note**:

* Whether you need `sudo` depends on how you installed Node.js / io.js and whether you've [changed permissions later](https://docs.npmjs.com/getting-started/fixing-npm-permissions); if you get an `EACCES` error, try again with `sudo`.
* The `-g` ensures [_global_ installation](https://docs.npmjs.com/getting-started/installing-npm-packages-globally) and is needed to put `fileicon` in your system's `$PATH`.

## Manual installation

* Download [the CLI](https://raw.githubusercontent.com/mklement0/fileicon/stable/bin/fileicon) as `fileicon`.
* Make it executable with `chmod +x fileicon`.
* Move it or symlink it to a folder in your `$PATH`, such as `/usr/local/bin` (requires `sudo`).

# Usage

Find concise usage information below; for complete documentation, read the [manual online](doc/fileicon.md), or, once installed, run `man fileicon` (`fileicon --man` if installed manually).

<!-- DO NOT EDIT THE FENCED CODE BLOCK and RETAIN THIS COMMENT: The fenced code block below is updated by `make update-readme/release` with CLI usage information. -->

```nohighlight
$ fileicon --help


Manage custom icons for files and folders on macOS.  

SET a custom icon for a file or folder:

    fileicon set      <fileOrFolder> <imageFile>

REMOVE a custom icon from a file or folder:

    fileicon rm       <fileOrFolder>

GET a file or folder's custom icon:

    fileicon get [-f] <fileOrFolder> [<iconOutputFile>]

    -f ... force replacement of existing output file

TEST if a file or folder has a custom icon:

    fileicon test     <fileOrFolder>

All forms: option -q silences status output.

Standard options: --help, --man, --version, --home
```

<!-- DO NOT EDIT THE NEXT CHAPTER and RETAIN THIS COMMENT: The next chapter is updated by `make update-readme/release` with the contents of 'LICENSE.md'. ALSO, LEAVE AT LEAST 1 BLANK LINE AFTER THIS COMMENT. -->

# License

Copyright (c) 2015-2018 Michael Klement <mklement0@gmail.com> (http://same2u.net), released under the [MIT license](https://spdx.org/licenses/MIT#licenseText).

## Acknowledgements

This project gratefully depends on the following open-source components, according to the terms of their respective licenses.

[npm](https://www.npmjs.com/) dependencies below have optional suffixes denoting the type of dependency; the *absence* of a suffix denotes a required *run-time* dependency: `(D)` denotes a *development-time-only* dependency, `(O)` an *optional* dependency, and `(P)` a *peer* dependency.

<!-- DO NOT EDIT THE NEXT CHAPTER and RETAIN THIS COMMENT: The next chapter is updated by `make update-readme/release` with the dependencies from 'package.json'. ALSO, LEAVE AT LEAST 1 BLANK LINE AFTER THIS COMMENT. -->

## npm dependencies

* [doctoc (D)](https://github.com/thlorenz/doctoc#readme)
* [json (D)](https://github.com/trentm/json#readme)
* [marked-man (D)](https://github.com/kapouer/marked-man#readme)
* [replace (D)](https://github.com/harthur/replace#readme)
* [semver (D)](https://github.com/npm/node-semver#readme)
* [tap (D)](https://github.com/isaacs/node-tap#readme)
* [urchin (D)](https://github.com/tlevine/urchin#readme)

<!-- DO NOT EDIT THE NEXT CHAPTER and RETAIN THIS COMMENT: The next chapter is updated by `make update-readme/release` with the contents of 'CHANGELOG.md'. ALSO, LEAVE AT LEAST 1 BLANK LINE AFTER THIS COMMENT. -->

# Changelog

Versioning complies with [semantic versioning (semver)](http://semver.org/).

<!-- NOTE: An entry template for a new version is automatically added each time `make version` is called. Fill in changes afterwards. -->

* **[v0.2.1](https://github.com/mklement0/fileicon/compare/v0.2.0...v0.2.1)** (2018-01-13):
  * [doc] Read-me improvements re supported image formats.
  * [enhancement] Improved wording of error message on attempting to use a pipe
    such as via a process subsitution (`<(...)`) in lieu fo an actual image file,
    which is not supported.

* **[v0.2.0](https://github.com/mklement0/fileicon/compare/v0.1.10...v0.2.0)** (2017-10-14):
  * [compatibility] macOS 10.13 (High Sierra) is now supported.
  * [enhancement] Switched from using `sips -i` for icon creation to a Python-based
                  Cocoa call to `NSWorkSpace.setIcon(_:forFile:options:)`, courtesy of https://apple.stackexchange.com/a/161984/28668
                  As a result, icons in multiple resolutions are now generated, with a top resolution of 512 x 512 pixels (previously: 128 x 128)
  * [doc] More technical background added to `README.md`.
  * [usability] subcommands are now case-insensitive, and 'remove' is supported as an alias of 'rm'.

* **[v0.1.8](https://github.com/mklement0/fileicon/compare/v0.1.7...v0.1.8)** (2016-04-21):
  * [dev] Refactored exit-code reporting for the 'get' command (no change in functionality.)
  * [dev] `TODO.md` added.

* **[v0.1.7](https://github.com/mklement0/fileicon/compare/v0.1.6...v0.1.7)** (2016-04-21):
  * [fix] Stored-npm-credentials detection code in the Makefile updated for
          newer npm versions.
  * [fix] Folder write test is now properly skipped for 'get' and 'test'
          commands - thanks, @zmwangx.
  * [fix] 'get' command now properly reports errors if icon extracton fails
           - thanks, @zmwangx.
  * [dev] Insignificant trailing whitespace removed - thanks, @zmwangx.  
  * [dev] Added folder used by tests that was missing from the repo.

* **[v0.1.6](https://github.com/mklement0/fileicon/compare/v0.1.5...v0.1.6)** (2015-09-16):
  * [doc] Man-page improvements.
  * [dev] Makefile improvements.

* **[v0.1.5](https://github.com/mklement0/fileicon/compare/v0.1.4...v0.1.5)** (2015-09-15):
  * [doc] Man-page improvements.
  * [dev] Makefile improvements.

* **[v0.1.4](https://github.com/mklement0/fileicon/compare/v0.1.3...v0.1.4)** (2015-09-14):
  * [fix] Spurious error message no longer prints when invoking `fileicon --man` on a system where the man page isn't installed.
  * [doc] Read-me improvements.

* **[v0.1.3](https://github.com/mklement0/fileicon/compare/v0.1.2...v0.1.3)** (2015-09-02):
  * [dev, doc] minor tweaks

* **[v0.1.2](https://github.com/mklement0/fileicon/compare/v0.1.1...v0.1.2)** (2015-08-04):
  * [doc] Read-me and manual enhancements.

* **[v0.1.1](https://github.com/mklement0/fileicon/compare/v0.1.0...v0.1.1)** (2015-08-03):
  * [doc] Read-me and manual enhancements.
  * [dev] Permission-related tests added.

* **v0.1.0** (2015-08-03):
  * Initial release.
