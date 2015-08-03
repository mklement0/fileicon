FILEICON(1)                                                        FILEICON(1)



NNAAMMEE
       ffiilleeiiccoonn - manage custom icons for files and folders

SSYYNNOOPPSSIISS
        Set a custom icon for a file or folder:

         fileicon set      <fileOrFolder> <imageFile>

        Remove a custom icon from a file or folder:

         fileicon rm       <fileOrFolder>

        Get a file or folder's custom icon:

         fileicon get [-f] <fileOrFolder> [<iconOutputFile>]

        Test if a file or folder has a custom icon:

         fileicon test     <fileOrFolder>

        --qq ...  silence status output

        Standard options: ----hheellpp, ----mmaann, ----vveerrssiioonn, ----hhoommee

DDEESSCCRRIIPPTTIIOONN
         Manages custom file or folder icons on OSX, as displayed in Finder.

         <<ffiilleeOOrrFFoollddeerr>> is the file or folder whose custom icon should be man-
       aged.
         Note that symlinks are followed to their (ultimate target); that  is,
       you
         can  only  assign  custom  icons to regular files and folders, not to
       symlinks
         to them.

         <<iimmaaggeeFFiillee>> can be an image file of any format supported by the  sys-
       tem.
         It is converted to an icon and assigned to <<ffiilleeOOrrFFoollddeerr>>.

         <<iiccoonnOOuuttppuuttFFiillee>> specifies the file to extract the custom icon to:
         If  not  specified,  defaults  to the filename of <<ffiilleeOOrrFFoollddeerr>> with
       extension
         ..iiccnnss appended.
         If specified, extension ..iiccnnss is appended, unless already present.
         Either way, extraction will fail if the target file  already  exists;
       use
         --ff to override.
         You may specify -- to extract to stdout.

         Command  tteesstt signals with its exit code whether a custom icon is set
       (0)
         or not (1); any other exit code signals an unexpected error.

         OOppttiioonnss:

       +o --ff, ----ffoorrccee
         When getting (extracting) a custom icon, forces  replacement  of  the
         specified output file, if it exists.

       +o --qq, ----qquuiieett
         Suppresses output of status information to stdout.
         Note that errors and warnings are still printed to stderr.


NNOOTTEESS
         Custom icons are stored in extended attributes of the HFS filesystem.
         Thus, if you copy files or folders to  a  different  filesystem  that
       doesn't
         support such attributes, custom icons are lost.

         When  setting a custom icon, the source image is resized to 128 x 128
       pixels
         and stored as a single icon, which the  system  resizes  dynamically,
       depending
         on context.
         Currently, even if the source image file is itself an ..iiccnnss file that
         contains multiple icons for distinct resolutions, only the 128 x  128
       icon
         is assigned.

SSTTAANNDDAARRDD OOPPTTIIOONNSS
         All standard options provide information only.

       +o --hh,, ----hheellpp
         Prints  the contents of the synopsis chapter to stdout for quick ref-
         erence.

       +o ----mmaann
         Displays this manual page, which is a helpful  alternative  to  using
         mmaann, if the manual page isn't installed.

       +o ----vveerrssiioonn
         Prints version information.

       +o ----hhoommee
         Opens this utility's home page in the system's default web browser.





v0.0.0                            August 2015                      FILEICON(1)
