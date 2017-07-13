# Dissertation

The complete code of my dissertation.
The *master* branch is the dissertation in my prefered design.
The *KSUstyle* branch has a design as required for submission by Kent State University.

I recommend TeX Live 2016 or later for compiling.

## Build Instruction

There is a makefile with multiple compiling options.

- `default`
  Creates the document.
  Precompiles the header and figures.
  Creates a directory `tikzCache` if it does not exist.

- `cleanHeader`
  Removes the precompiled header.
  Results in a recompiling of it.

- `precompile`
  Precompiles the header.

- `complete`
  Recompiles the whole document without precompiling of the header of figures.
  Calls *clean* afterwards.

- `clean`
  Removes all precompiled and temporary LaTeX files.
