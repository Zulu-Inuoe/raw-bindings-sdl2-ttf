# raw-bindings-sdl2-ttf

## Overview

Low level (raw) Common Lisp bindings to the [SDL2_ttf](https://www.libsdl.org/projects/SDL_ttf/) library.

## Dependencies

Lisp:

* [cffi](https://common-lisp.net/project/cffi/)
* [cffi-libffi](https://common-lisp.net/project/cffi/) (optional, see below)
* [defpackage-plus](https://github.com/rpav/defpackage-plus)
* [raw-bindings-sdl2](https://github.com/Zulu-Inuoe/raw-bindings-sdl2)

Runtime:

* [libffi](https://sourceware.org/libffi/) runtime library (optional, see below)
* [SDL2](https://www.libsdl.org/) version 2.0.6 runtime libraries
* [SDL2_ttf](https://www.libsdl.org/projects/SDL_ttf/) runtime library.

Certain SDL2_ttf functions require foreign-structures-by-value. This is provided by the cffi-libffi system, which in term depends on the libffi native runtime library.

If cffi-libffi is available when loading, these functions will be available, otherwise they will not be defined.

These functions are enumerated here:

* TTF_RenderText_Solid
* TTF_RenderText_Solid
* TTF_RenderText_Solid
* TTF_RenderUTF8_Solid
* TTF_RenderUNICODE_Solid
* TTF_RenderGlyph_Solid
* TTF_RenderText_Shaded
* TTF_RenderUTF8_Shaded
* TTF_RenderUNICODE_Shaded
* TTF_RenderGlyph_Shaded
* TTF_RenderText_Blended
* TTF_RenderUTF8_Blended
* TTF_RenderUNICODE_Blended
* TTF_RenderText_Blended_Wrapped
* TTF_RenderUTF8_Blended_Wrapped
* TTF_RenderUNICODE_Blended_Wrapped
* TTF_RenderGlyph_Blended
* TTF_RenderText
* TTF_RenderUTF8
* TTF_RenderUNICODE

## Notes

This is a low level library meant to have minimal fluff.

In that vein, keep the following in mind:

* No returned pointers are set up for [finalization](https://common-lisp.net/project/trivial-garbage/).
    * If you decide to implement such a scheme keep in mind that SDL objects are thread sensitive, and must be cleaned up in the same thread they were created. Also that finalization occurs in an unknown thread.
* No error codes are checked for you and coerced to errors.
* No integer values are coerced to booleans, not even sdl-bool.
