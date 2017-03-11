#!/bin/bash

CACHED_CARTFILE="Carthage/Cartfile.resolved"

if [ -e "$CACHED_CARTFILE" ]; then
    OUTDATED_DEPENDENCIES=$(cartfilediff "$CACHED_CARTFILE" Cartfile.resolved)

    if [ ! -z "$OUTDATED_DEPENDENCIES" ]
    then
        echo "Bootstrapping outdated dependencies: $OUTDATED_DEPENDENCIES"
        carthage bootstrap "$OUTDATED_DEPENDENCIES" --platform iOS
    else
        echo "Cartfile.resolved matches cached, skipping bootstrap"
    fi
else
    echo "Cached Cartfile.resolved not found, bootstrapping all dependencies"
    carthage bootstrap --platform iOS
fi

# Copy Cartfile.resolved to Carthage to cache it and then compare with repo version
cp Cartfile.resolved Carthage
