# fileicon(1) - manage custom icons for files and folders

## SYNOPSIS
 Set a custom icon for a file or folder:

    fileicon set      <fileOrFolder> <imageFile>

 Remove a custom icon from a file or folder:

    fileicon rm       <fileOrFolder>

 Get a file or folder's custom icon:

    fileicon get [-f] <fileOrFolder> [<iconOutputFile>]

 Test if a file or folder has a custom icon:

    fileicon test     <fileOrFolder>

 `-q` ...  silence status output

 Standard options: `--help`, `--man`, `--version`, `--home`

## DESCRIPTION
  `<fileOrFolder>` is the file or folder whose custom icon should be managed.  
  Note that symlinks are followed to their (ultimate target); that is, you
  can only assign custom icons to regular files and folders, not to symlinks
  to them.

  `<imageFile>` can be an image file of any format supported by the system.
  It is converted to an icon and assigned to `<fileOrFolder>`.

  `<iconOutputFile>` specifies the file to extract the custom icon to:
  If not specified, defaults to the filename of `<fileOrFolder>` with extension
  `.icns` appended.  
  If specified, extension `.icns` is appended, unless already present.
  Either way, extraction will fail if the target file already exists; use
  `-f` to override.
  You may specify `-` to extract to stdout.

  Command `test` signals with its exit code whether a custom icon is set (0)
  or not (1); any other exit code signals an unexpected error.

  **Options**:

  * `-f`, `--force`  
    When getting (extracting) a custom icon, forces replacement of the
    specified output file, if it exists.

  * `-q`, `--quiet`  
    Suppresses output of the status information that is by default output to
    stdout.  
    Note that errors and warnings are still printed to stderr.

## NOTES
  Custom icons are stored in extended attributes of the HFS+ filesystem.
  Thus, if you copy files or folders to a different filesystem that doesn't
  support such attributes, custom icons are lost; for instance, custom icons
  cannot be stored in a Git repository.

  To determine if a give file or folder has extended attributes, use  
  `ls -l@ <fileOrFolder>`.

  When setting a custom icon, the source image is resized to 128 x 128 pixels
  and stored as a single icon, which the system resizes dynamically, depending
  on context.  
  Currently, even if the source image file is itself an `.icns` file that
  contains multiple icons with distinct resolutions, only the 128 x 128 icon
  is assigned.

## STANDARD OPTIONS

  All standard options provide information only.

  * `-h, --help`  
    Prints the contents of the synopsis chapter to stdout for quick reference.

  * `--man`  
    Displays this manual page, which is a helpful alternative to using `man`, 
    if the manual page isn't installed.

  * `--version`  
    Prints version information.
    
  * `--home`  
    Opens this utility's home page in the system's default web browser.

