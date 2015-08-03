                       __    _     
      __  ____________/ /_  (_)___ 
     / / / / ___/ ___/ __ \/ / __ \
    / /_/ / /  / /__/ / / / / / / /
    \__,_/_/   \___/_/ /_/_/_/ /_/ 

Urchin is a test framework for shell. It is implemented in
portable /bin/sh and should work on GNU/Linux, Mac OS X, and
other Unix platforms.

## Try it out
Urchin's tests are written in Urchin, so you can run them to see what Urchin
is like. Clone the repository

    git clone git://github.com/tlevine/urchin.git

Run the tests

    cd urchin
    ./urchin tests

The above command will run the tests in your system's default
shell, /bin/sh (on recent Ubuntu this is dash, but it could be
ksh or bash on other systems); to test urchin's cross-shell compatibility,
run this:

    cd urchin
    ./cross-shell-tests

## Globally
Download Urchin like so (as root) (or use npm, below):

    cd /usr/local/bin
    wget https://raw.github.com/tlevine/urchin/master/urchin
    chmod +x urchin

Can be installed with npm too:

    npm install -g urchin

Now you can run it.

    urchin <test directory>

Run `urchin -h` to get command-line help.

## Writing tests
Make a root directory for your tests. Inside it, put executable files that
exit `0` on success and something else on fail. Non-executable files and hidden
files (dotfiles) are ignored, so you can store fixtures right next to your
tests. Run urchin from inside the tests directory.

Urchin only cares about the exit status, so you can actually write your tests
in any language, not just shell.

## More about writing tests
Tests are organized recursively in directories, where the names of the files
and directories have special meanings.

    tests/
      setup
      setup_dir
      bar/
        setup
        test_that_something_works
        teardown
      baz/
        jack-in-the-box/
          setup
          test_that_something_works
          teardown
        cat-in-the-box/
          fixtures/
            thingy.pdf
          test_thingy
      teardown

Directories are processed in a depth-first order. When a particular directory
is processed, `setup_dir` is run before everything else in the directory, including
subdirectories. `teardown_dir` is run after everything else in the directory.

A directory's `setup` file, if it exists, is run right before each test file
within the particular directory, and the `teardown` file is run right after.

Files are only run if they are executable, and files beginning with `.` are
ignored. Thus, fixtures and libraries can be included sloppily within the test
directory tree. The test passes if the file exits 0; otherwise, it fails.

### Writing cross-shell compatibility tests for testing shell code

While you could write your test scripts to explicitly invoke the functionality
to test with various shells, Urchin facilitates a more flexible approach.

The specific approach depends on your test scenario:

* (a) Your test scripts _invoke_ scripts containing portable shell code.
* (b) Your scripts _source_ scripts containing portable shell code.

#### (a) Cross-shell tests with test scripts that _invoke_ shell scripts

In your test scripts, invoke the shell scripts to test via the shell
specified in environment variable `TEST_SHELL` rather than directly;
e.g.: `$TEST_SHELL ../foo bar` (rather than just `../foo bar`).  
Note that if you alsow want your test scripts to work when run directly,
outside of Urchin, be sure to target scripts that happen to be in the 
current directory with prefix `./`; e.g., `$TEST_SHELL ./baz`
(rather than `$TEST_SHELL baz`).

Then, on invocation of Urchin, prepend a definition of environment variable
`TEST_SHELL` specifying the shell to test with, e.g.: `TEST_SHELL=zsh urchin ./tests`.  
To test with multiple shells in sequence, use something like:

    for shell in sh bash ksh zsh; do
      TEST_SHELL=$shell urchin ./tests
    done

If `TEST_SHELL` has no value, Urchin defines it as `/bin/sh`, so the test
scripts can rely on `$TEST_SHELL` always containing a value.

#### (b) Cross-shell tests with test scripts that _source_ shell scripts

If you _source_ shell code in your test scripts, it is the test scripts
themselves that must be run with the shell specified.

To that end, Urchin supports the `-s <shell>` option, which instructs
Urchin to invoke the test scripts with the specified shell; e.g., `-s bash`.  
(In addition, Urchin sets environment variable `TEST_SHELL` to the specified
shell.)

Note that only test scripts that either have no shebang line at all or
have shebang line `#!/bin/sh` are invoked with the specified shell.
This allows non-shell test scripts or test scripts for specific
shells to coexist with those whose invocation should be controlled by `-s`.

To test with multiple shells in sequence, use something like:

    for shell in sh bash ksh zsh; do
      urchin -s $shell ./tests
    done

<!--
#### (c) Cross shell tests with `urchin -x` (experimental)
If you run urchin with the `-x` flag, it will be as if you ran
`$TEST_SHELL`. Unless `$TEST_SHELL` isn't set, in which case it'll
be as if you ran `/bin/sh`. Putting this in she shebang line might
eventually work out to be a cleaner way of doing cross-shell testing.

    #!/usr/bin/env urchin -x
    test a = a

It might make sense if you do this.

    export TEST_SHELL=zsh && urchin -x
    export TEST_SHELL=bash && urchin -x
-->
## Alternatives to Urchin
Alternatives to Urchin are discussed in
[this blog post](https://blog.scraperwiki.com/2012/12/how-to-test-shell-scripts/).
