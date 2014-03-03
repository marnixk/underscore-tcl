# Underscore TCL

As part of getting to know the Tcl programming language I've created a simple port of the underscorejs library that I'm accustomed to working with. This will make it easier to manipulate lists and arrays in ways I'll understand. 

All functions live in the _ (`underscore`) namespace. 

## Predicates

All closure-like functions that are being used have the following signature:

    proc closure {key val}
    proc closure {val}
    
depending on whether it is an array- or list-based function respectively.

## Functions

See `underscore.tcl` for example uses of all the functions.

### TODO

* will make this into a proper Tcl package