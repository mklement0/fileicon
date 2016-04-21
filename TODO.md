
Re limitation reported at https://github.com/mklement0/fileicon/issues/1:

* Consider at least selective use of JXA for setting the icon in order to overcome the 128x128 resolution limitation:
    ObjC code snippets:
    * See https://developer.apple.com/library/prerelease/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSWorkspace_Class/index.html#//apple_ref/occ/instm/NSWorkspace/setIcon:forFile:options:
    "This method uses the image to set an icon whose size is 512 by 512 pixels."
    * assign
        NSImage* image = [[NSImage alloc] initWithContentsOfFile:imagePath];
        [[NSWorkspace sharedWorkspace] setIcon:image forFile:filePath options:0];
        [image release];
    * remove
            [[NSWorkspace sharedWorkspace] setIcon:nil forFile:filePath options:0]; 


