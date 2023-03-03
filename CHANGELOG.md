# Changelog

Versioning complies with [semantic versioning (semver)](http://semver.org/).

<!-- NOTE: An entry template for a new version is automatically added each time `make version` is called. Fill in changes afterwards. -->

* **[v0.3.4] == [v0.3.3](https://github.com/mklement0/fileicon/compare/v0.3.2...v0.3.3)** (2023-03-02):
  * [fix] Fix for [#42](https://github.com/mklement0/fileicon/issues/42), courtesy of [vszakats](https://github.com/vszakats).

* **[v0.3.2](https://github.com/mklement0/fileicon/compare/v0.3.1...v0.3.2)** (2022-12-29):
  * [enhancement] Support for *volume* icons, at least in principle; **caveat**: as of macOS 13.1, this often fails in practice; see https://apple.stackexchange.com/q/451965/28668 for an example.

* **[v0.3.1](https://github.com/mklement0/fileicon/compare/v0.3.0...v0.3.1)** (2022-04-07):
  * [compatibility] Removed dependency on Python in favor of AppleScript with its ObjC bridge, courtesy of [@scriptingosx](https://github.com/scriptingosx)

* **[v0.3.0](https://github.com/mklement0/fileicon/compare/v0.2.4...v0.3.0)** (2022-02-11):
  * [compatibility] Added support for using an available `python3` on macOS 12.3+, where the system v2.x `/usr/bin/python` will no longer be avaialble.

* **[v0.2.4](https://github.com/mklement0/fileicon/compare/v0.2.3...v0.2.4)** (2019-12-10):
  * [installation] Thanks to @danielbayley, there is now an official Homebrew formula.

* **[v0.2.3](https://github.com/mklement0/fileicon/compare/v0.2.2...v0.2.3)** (2019-11-01):
  * [enhancement] Installation via Homebrew is now possible on macOS.
  * [doc] `README.md` updated with Homebrew installation instructions.
  * [dev] Updated dev-time-only packages to fix security issues.

* **[v0.2.2](https://github.com/mklement0/fileicon/compare/v0.2.1...v0.2.2)** (2018-03-05):
  * [enhancement] `filecon set <file>` is now short for `filecon set <file> <file>`; that is, you can now more 
    conveniently make an image file use itself as its icon.

* **[v0.2.1](https://github.com/mklement0/fileicon/compare/v0.2.0...v0.2.1)** (2018-01-13):
  * [doc] Read-me improvements re supported image formats.
  * [enhancement] Improved wording of error message on attempting to use a pipe
    such as via a process subsitution (`<(...)`) in lieu of an actual image file,
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
