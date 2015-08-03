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

`fileicon` is an OSX CLI for managing custom icons for files and folders, as 
a programmatic alternative to interactively using Finder.

_Caveat_: Custom icons rely on [extended attributes](https://en.wikipedia.org/wiki/Extended_file_attributes#OS_X) of OSX' filesystem, [HFS+](https://en.wikipedia.org/wiki/HFS_Plus);
therefore, custom icons are lost when copying files or folders to filesystems that don't
support these attributes; for instance, custom icons are lost when syncing with
a remote Git repository.

# Examples

```
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

* **OSX**

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

Find brief usage information below; for complete documentation, refer to the [manual](doc/fileicon.md).

<!-- DO NOT EDIT THE FENCED CODE BLOCK and RETAIN THIS COMMENT: The fenced code block below is updated by `make update-readme/release` with CLI usage information. -->

```nohighlight
$ fileicon --help

 Set a custom icon for a file or folder:

    fileicon set      <fileOrFolder> <imageFile>

 Remove a custom icon from a file or folder:

    fileicon rm       <fileOrFolder>

 Get a file or folder's custom icon:

    fileicon get [-f] <fileOrFolder> [<iconOutputFile>]

 Test if a file or folder has a custom icon:

    fileicon test     <fileOrFolder>

 -q ...  silence status output

 Standard options: --help, --man, --version, --home
```

<!-- DO NOT EDIT THE NEXT CHAPTER and RETAIN THIS COMMENT: The next chapter is updated by `make update-readme/release` with the contents of 'LICENSE.md'. ALSO, LEAVE AT LEAST 1 BLANK LINE AFTER THIS COMMENT. -->

# License

Copyright (c) 2015 Michael Klement <mklement0@gmail.com> (http://same2u.net), released under the [MIT license](https://spdx.org/licenses/MIT#licenseText).

## Acknowledgements

This project gratefully depends on the following open-source components, according to the terms of their respective licenses.

[npm](https://www.npmjs.com/) dependencies below have optional suffixes denoting the type of dependency; the *absence* of a suffix denotes a required *run-time* dependency: `(D)` denotes a *development-time-only* dependency, `(O)` an *optional* dependency, and `(P)` a *peer* dependency.

<!-- DO NOT EDIT THE NEXT CHAPTER and RETAIN THIS COMMENT: The next chapter is updated by `make update-readme/release` with the dependencies from 'package.json'. ALSO, LEAVE AT LEAST 1 BLANK LINE AFTER THIS COMMENT. -->

## npm dependencies

* [doctoc (D)](https://github.com/thlorenz/doctoc)
* [json (D)](https://github.com/trentm/json)
* [marked-man (D)](https://github.com/kapouer/marked-man#readme)
* [replace (D)](https://github.com/harthur/replace)
* [semver (D)](https://github.com/npm/node-semver#readme)
* [tap (D)](https://github.com/isaacs/node-tap)
* [urchin (D)](https://github.com/tlevine/urchin)

<!-- DO NOT EDIT THE NEXT CHAPTER and RETAIN THIS COMMENT: The next chapter is updated by `make update-readme/release` with the contents of 'CHANGELOG.md'. ALSO, LEAVE AT LEAST 1 BLANK LINE AFTER THIS COMMENT. -->

# Changelog

Versioning complies with [semantic versioning (semver)](http://semver.org/).

<!-- NOTE: An entry template for a new version is automatically added each time `make version` is called. Fill in changes afterwards. -->

* **v0.1.0** (2015-08-03):
  * Initial release.
