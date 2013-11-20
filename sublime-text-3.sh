#!/bin/sh

# Adapted from https://gist.github.com/henriquemoody/3288681

# This script assumes you have unzipped the contents of the
# Sublime 3 distribution to someplace and will set it below
# I personally like to keep this install very mobile

# Set these values
INSTALL="/home/agd/Development/sublime/sublime"
VERSION="3.3047"
EXECUTABLE="sublime_text"
INSTALL="/usr/local/sublime"
INSTALLBIN="/usr/local/bin/subl3"
INSTALLSHORTCUT="/usr/share/applications/sublime-text-3.desktop"

# Copy to the main area
mkdir $INSTALL
cp -fr $DISTRIB/$VERSION $INSTALL/$VERSION


# Desktop Shortcut
SHORTCUT="[Desktop Entry]
Name=Sublime Text 3
GenericName=Text Editor
Comment=Sophisticated text editor for code, markup and prose
Exec=$INSTALL/$VERSION/$EXECUTABLE %F
Icon=$INSTALL/$VERSION/Icon/128x128/sublime-text.png
Terminal=false
MimeType=text/plain;
Type=Application
Encoding=UTF-8
StartupNotify=true
Actions=Window;Document;
Categories=Utility;TextEditor;"

# Command Line
COMMAND="#/bin/bash
if [ \$# -gt 1 ] ; then
        if [ \${1} == \"--help\" ] ; then
                $INSTALL/$VERSION/$EXECUTABLE --help
        fi
else
        $INSTALL/$VERSION/$EXECUTABLE \$@ > /dev/null 2>&1 &
fi"


echo "${COMMAND}" > $INSTALLBIN
chmod 755 $INSTALLBIN
chmod -R 755 $INSTALL
echo "${SHORTCUT}" > $INSTALLSHORTCUT
chmod 644 $INSTALLSHORTCUT
