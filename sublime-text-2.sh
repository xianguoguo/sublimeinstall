#!/bin/sh

# Adapted from https://gist.github.com/henriquemoody/3288681

# This script assumes you have unzipped the contents of the
# Sublime 2 distribution to someplace and will set it below
# I personally like to keep this install very mobile

# Set these values
INSTALL="/home/agd/Development/sublime/sublime"
VERSION="2.0.2"
EXECUTABLE="sublime_text"

# Desktop Shortcut
SHORTCUT="[Desktop Entry]
Name=Sublime Text 2
Comment=Edit text files
Exec=$INSTALL/$VERSION/$EXECUTABLE
Icon=$INSTALL/$VERSION/Icon/128x128/sublime_text.png
Terminal=false
Type=Application
Encoding=UTF-8
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


echo "${COMMAND}" > "/usr/local/bin/subl"
chmod +x "/usr/local/bin/subl"
echo "${SHORTCUT}" > "/usr/share/applications/sublime-text-2.desktop"
