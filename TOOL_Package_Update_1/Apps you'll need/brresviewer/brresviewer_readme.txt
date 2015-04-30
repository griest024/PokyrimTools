BRRES Viewer (version 1.0-1.2)
by Kentilan
==========================


Version 1.2 changes:
============
- Added Expand All/ collapse All option
- Added Auto Expand on file loading
- you can now launch the program and open a file with a command line (so you can now associate brres files with the viewer in the Windows explorer).
- some modifications to the auto texture loading function
- small correction of the BRSHA loading function; now facial animations from Another Code R work.
- "Play Rotations Only" option. It will prevent the model from being translated when playing an animation. This option can also have other uses.
- when looking for a texture or a palette, the program will first look in the brres file that the model or texture is from (note: I haven't tested it much).
- you can now use the middle mouse button to translate the model vertically.
- numpad controls (if you don't want to use the mouse). Use the 2/4/6/8 keys on the numpad to rotate the model, 3/9 keys to zoom in/out, and CTRL+2/4/6/8/3/9 to translate the model.
- Added  ini file to store user preferances (rendermodes, play rot only etc ..



Introduction
============

This program allows you to view models, textures and animations in BRRES format
(a ressource format used in many Wii games), and export them.

When you launch the program, you should see the main window (with a black
background and three axes) and the Files window (initially empty). To open a
BRRES file, select "File" -> "Open Files..." in the menu bar, or right-click in
the Files window and select "Open Files..."; then select the files you want to
open.

If they are valid BRRES files, they will appear in the Files window, as a tree.
You can then see the contents of the files. Right-click on an item in the tree to
display the available actions. You can also double-click on models, textures,
palettes or animations items to load them.

To remove a file from the Files window, right-click on it and select "Close
File". You can also remove all the files by selecting "File" -> "Close All Files"
in the menu bar. Note that closing a file does not unload the model, texture,
palette or animations that have been loaded from it.

The "Model", "Texture" and "Animation" menus in the menu bar are initially
disabled. They are enabled when you load a corresponding item.



Models
======

To load a model, double-click on a model item in the Files window. The model
should then be displayed in the main window. The program will try to apply the
correct textures to the model, but the textures must be present in the Files tree
first. Note that the choice of textures is not fully functional and the textures
applied may be wrong.

You can only load one model at a time.

Models can be exported to MD5 or PSK format by selecting "Model" -> "Export..."
in the menu bar. If the "Auto Export Textures" option is checked, the textures
used by the model (chosen by the program) will also be exported, in the same
folder as the model, to TGA format. If those texture files already exist, they
will be overwritten.


Keyboard and Mouse commands:
----------------------------

* Hold the left mouse button and move the mouse to rotate the model around the
center.

* Hold the right mouse button and move the mouse to translate the model
horizontally.

* Hold the CONTROL key + right mouse button and move the mouse vertically to
translate the model vertically.

* Scroll the mouse wheel or press the UP/DOWN keys to zoom in/out. The zooming is
more precise with the keys than with the mouse wheel.

* Press RETURN to center the model.

* Press SHIFT to put the model back to its original position, if it has been
translated.

* Hold the CONTROL key + left mouse button and move the mouse to move the light
source.

* If the model has several components, press PAGE UP or PAGE DOWN to display only
one component (the others components will appear as points). Press PAGE UP/PAGE
DOWN several times to change the component displayed.

* Press the keys F2 to F8 to change various options.



Textures & Palettes
===================

To load a texture (and display it as a flat picture), double-click on a texture
item in the Files window. The texture should then be displayed in the main
window.

To load a palette, double-click on a palette item in the Files window. The
palette should then be displayed in the main window, as a picture made of 16x16
colored squares.

If the texture requires a palette, the program will look for a palette with the
same name as the texture in the Files tree. If that palette can't be found, the
program will use the palette that has been previously loaded. If no palette has
been loaded, the texture will not be displayed.

You can only load one texture and one palette at a time.

Textures can be exported to PNG or TGA format.


Keyboard and Mouse commands:
----------------------------

* Hold the left or right mouse button and move the mouse to move the picture.

* Scroll the mouse wheel or press the UP/DOWN keys to zoom in/out.

* Press RETURN to center the picture.

* Press SHIFT to center the picture and reset the zoom level to 100%.



Animations
==========

BRRES Viewer can play two kinds of animations: bone animations and vertex
animations. To load an animation, double-click on a animation item in the Files
window. The animation should then start playing. A model must have been loaded
first.

For each kind of animation (bone and vertex), you can only load one animation at
a time, but you can load both a bone animation and a vertex animation at the same
time. The two animations should have the same length (number of frames), else
only the length of the last animation loaded will be kept.

After you load and play an animation, the model should be moving. If it doesn't
move at all, that usually means that the animation is not made for this model.
(If you no longer see the model in the window, this is usually because it has
been translated. In that case, you should press RETURN to center the model.)

Bone animations can be exported to MD5 or PSA format. You can't export vertex
animations. Note: neither MD5 nor PSA format support scaling. If the animation
you want to export uses scaling, it will look different once exported.


Keyboard commands:
------------------

* Press the SPACEBAR to pause or resume the animation.

* Press the '+' and '-' keys on the numpad to change the animation speed.
You can see the animation speed in the "Animation Info" window (select
"Animation" -> "Display Info" in the menu bar to show it). A speed of 0 means
that every frame in the animation file will be displayed. A negative speed means
that intermediate frames will be added, and a positive speed means that some
frames will be skipped.
Note that there is no set framerate for the animation: the actual speed will
depend on the model's complexity, on the current options and on your computer's
speed.

* Press the LEFT and RIGHT keys to change the current frame of the animation,
when the animation is paused or stopped.



"Export All Files" function
===========================

To export many files at the same time, select "Files" -> "Export All Files..." in
the menu bar. A new window will appear. It lets you export all the models,
textures and bone animations that are in the Files tree.

Textures can be exported to PNG or TGA format. For the TGA format, you can either
export all the textures in the tree, or export only the textures that are used by
the models in the tree (just like exporting a model with the 'Auto Export
Textures' option checked).
If you choose to export all the textures, a texture will not be exported if it
requires a palette that has a different name from it.

Models can be exported to MD5 or PSK format, and bone animations to PSA only.

The exported files will be written in a folder called "exported", created in the
same folder as the original file. If the option "Separate files by type" is
checked, then subfolders will be created for the textures and animations, to
separate them from the models.

Note that depending on the number of files to export and their size, this can
take quite a time.
