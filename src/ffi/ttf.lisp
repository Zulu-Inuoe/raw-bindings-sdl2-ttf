;;;raw-bindings-sdl2-ttf - FFI bindings to SDL2_ttf
;;;Written in 2017 by Wilfredo Velázquez-Rodríguez <zulu.inuoe@gmail.com>
;;;
;;;To the extent possible under law, the author(s) have dedicated all copyright
;;;and related and neighboring rights to this software to the public domain
;;;worldwide. This software is distributed without any warranty.
;;;You should have received a copy of the CC0 Public Domain Dedication along
;;;with this software. If not, see
;;;<http://creativecommons.org/publicdomain/zero/1.0/>.

(in-package #:raw-bindings-sdl2-ttf)

(defttfconstant +sdl-ttf-major-version+   2)
(defttfconstant +sdl-ttf-minor-version+   0)
(defttfconstant +sdl-ttf-patchlevel+      14)

(defttf-lispfun sdl-ttf-version (sdl-version)
  (cffi:with-foreign-slots ((major minor patch) sdl-version sdl-version)
    (setf major +sdl-ttf-major-version+
          minor +sdl-ttf-minor-version+
          patch +sdl-ttf-patchlevel+))
  (values))

(defttfconstant +ttf-major-version+   +sdl-ttf-major-version+)
(defttfconstant +ttf-minor-version+   +sdl-ttf-minor-version+)
(defttfconstant +ttf-patchlevel+      +sdl-ttf-patchlevel+)

(defttf-lispfun ttf-version (x)
  (sdl-ttf-version x))

(defttffun ("TTF_Linked_Version" ttf-linked-version) (:pointer sdl-version))

(defttfconstant +unicode-bom-native+  #xfeff)
(defttfconstant +unicode-bom-swapped+ #xfffe)

(defttffun ("TTF_ByteSwappedUNICODE" ttf-byte-swapped-unicode) :void
  (swapped :int))

(defttfstruct ttf-font)

(defttffun ("TTF_Init" ttf-init) :int)

(defttffun ("TTF_OpenFont" ttf-open-font) (:pointer ttf-font)
  (file (:string :encoding :utf-8))
  (ptsize :int))

(defttffun ("TTF_OpenFontIndex" ttf-open-font-index) (:pointer ttf-font)
  (file (:string :encoding :utf-8))
  (ptsize :int)
  (index :long))

(defttffun ("TTF_OpenFontRW" ttf-open-font-rw) (:pointer ttf-font)
  (src (:pointer sdl-rwops))
  (freesrc :int)
  (ptsize :int))

(defttffun ("TTF_OpenFontIndexRW" ttf-open-font-index-rw) (:pointer ttf-font)
  (src (:pointer sdl-rwops))
  (freesrc :int)
  (ptsize :int)
  (index :long))

(defttfconstant +ttf-style-normal+        #x00)
(defttfconstant +ttf-style-bold+          #x01)
(defttfconstant +ttf-style-italic+        #x02)
(defttfconstant +ttf-style-underline+     #x04)
(defttfconstant +ttf-style-strikethrough+ #x08)

(defttffun ("TTF_GetFontStyle" ttf-get-font-style) :int
  (font (:pointer ttf-font)))

(defttffun ("TTF_SetFontStyle" ttf-set-font-style) :void
  (font (:pointer ttf-font))
  (style :int))

(defttffun ("TTF_GetFontOutline" ttf-get-font-outline) :int
  (font (:pointer ttf-font)))

(defttffun ("TTF_SetFontOutline" ttf-set-font-outline) :void
  (font (:pointer ttf-font))
  (outline :int))

(defttfconstant +ttf-hinting-normal+    0)
(defttfconstant +ttf-hinting-light+     1)
(defttfconstant +ttf-hinting-mono+      2)
(defttfconstant +ttf-hinting-none+      3)

(defttffun ("TTF_GetFontHinting" ttf-get-font-hinting) :int
  (font (:pointer ttf-font)))

(defttffun ("TTF_SetFontHinting" ttf-set-font-hinting) :void
  (font (:pointer ttf-font))
  (hinting :int))

(defttffun ("TTF_FontHeight" ttf-font-height) :int
  (font (:pointer ttf-font)))

(defttffun ("TTF_FontAscent" ttf-font-ascent) :int
  (font (:pointer ttf-font)))

(defttffun ("TTF_FontDescent" ttf-font-descent) :int
  (font (:pointer ttf-font)))

(defttffun ("TTF_FontLineSkip" ttf-font-line-skip) :int
  (font (:pointer ttf-font)))

(defttffun ("TTF_GetFontKerning" ttf-get-font-kerning) :int
  (font (:pointer ttf-font)))

(defttffun ("TTF_SetFontKerning" ttf-set-font-kerning) :void
  (font (:pointer ttf-font))
  (allowed :int))

(defttffun ("TTF_FontFaces" ttf-font-faces) :long
  (font (:pointer ttf-font)))

(defttffun ("TTF_FontFaceIsFixedWidth" ttf-font-face-is-fixed-width) :int
  (font (:pointer ttf-font)))

(defttffun ("TTF_FontFaceFamilyName" ttf-font-face-family-name) (:string :encoding :utf-8)
  (font (:pointer ttf-font)))

(defttffun ("TTF_FontFaceStyleName" ttf-font-face-style-name) (:string :encoding :utf-8)
  (font (:pointer ttf-font)))

(defttffun ("TTF_GlyphIsProvided" ttf-glyph-is-provided) :int
  (font (:pointer ttf-font))
  (ch :uint16))

(defttffun ("TTF_GlyphMetrics" ttf-glyph-metrics) :int
  (font (:pointer ttf-font))
  (ch :uint16)
  (minx (:pointer :int))
  (maxx (:pointer :int))
  (miny (:pointer :int))
  (maxy (:pointer :int))
  (advance (:pointer :int)))

(defttffun ("TTF_SizeText" ttf-size-text) :int
  (font (:pointer ttf-font))
  (text (:string :encoding :utf-8))
  (w (:pointer :int))
  (h (:pointer :int)))

(defttffun ("TTF_SizeUTF8" ttf-size-utf8) :int
  (font (:pointer ttf-font))
  (text (:string :encoding :utf-8))
  (w (:pointer :int))
  (h (:pointer :int)))

(defttffun ("TTF_SizeUNICODE" ttf-size-unicode) :int
  (font (:pointer ttf-font))
  (text (:string :encoding :utf-16))
  (w (:pointer :int))
  (h (:pointer :int)))

#+fsbv
(defttffun ("TTF_RenderText_Solid" ttf-render-text-solid) (:pointer sdl-surface)
  (font (:pointer ttf-font))
  (text (:string :encoding :utf-8))
  (fg sdl-color))

#+fsbv
(defttffun ("TTF_RenderUTF8_Solid" ttf-render-utf8-solid) (:pointer sdl-surface)
  (font (:pointer ttf-font))
  (text (:string :encoding :utf-8))
  (fg sdl-color))

#+fsbv
(defttffun ("TTF_RenderUNICODE_Solid" ttf-render-unicode-solid) (:pointer sdl-surface)
  (font (:pointer ttf-font))
  (text (:string :encoding :utf-16))
  (fg sdl-color))

#+fsbv
(defttffun ("TTF_RenderGlyph_Solid" ttf-render-glyph-solid) (:pointer sdl-surface)
  (font (:pointer ttf-font))
  (ch :uint16)
  (fg sdl-color))

#+fsbv
(defttffun ("TTF_RenderText_Shaded" ttf-render-text-shaded) (:pointer sdl-surface)
  (font (:pointer ttf-font))
  (text (:string :encoding :utf-8))
  (fg sdl-color)
  (bg sdl-color))

#+fsbv
(defttffun ("TTF_RenderUTF8_Shaded" ttf-render-utf8-shaded) (:pointer sdl-surface)
  (font (:pointer ttf-font))
  (text (:string :encoding :utf-8))
  (fg sdl-color)
  (bg sdl-color))

#+fsbv
(defttffun ("TTF_RenderUNICODE_Shaded" ttf-render-unicode-shaded) (:pointer sdl-surface)
  (font (:pointer ttf-font))
  (text (:string :encoding :utf-16))
  (fg sdl-color)
  (bg sdl-color))

#+fsbv
(defttffun ("TTF_RenderGlyph_Shaded" ttf-render-glyph-shaded) (:pointer sdl-surface)
  (font (:pointer ttf-font))
  (ch :uint16)
  (fg sdl-color)
  (bg sdl-color))

#+fsbv
(defttffun ("TTF_RenderText_Blended" ttf-render-text-blended) (:pointer sdl-surface)
  (font (:pointer ttf-font))
  (text (:string :encoding :utf-8))
  (fg sdl-color))

#+fsbv
(defttffun ("TTF_RenderUTF8_Blended" ttf-render-utf8-blended) (:pointer sdl-surface)
  (font (:pointer ttf-font))
  (text (:string :encoding :utf-8))
  (fg sdl-color))

#+fsbv
(defttffun ("TTF_RenderUNICODE_Blended" ttf-render-unicode-blended) (:pointer sdl-surface)
  (font (:pointer ttf-font))
  (text (:string :encoding :utf-16))
  (fg sdl-color))

#+fsbv
(defttffun ("TTF_RenderText_Blended_Wrapped" ttf-render-text-blended-wrapped) (:pointer sdl-surface)
  (font (:pointer ttf-font))
  (text (:string :encoding :utf-8))
  (fg sdl-color)
  (wrapLength :uint32))

#+fsbv
(defttffun ("TTF_RenderUTF8_Blended_Wrapped" ttf-render-utf8-blended-wrapped) (:pointer sdl-surface)
  (font (:pointer ttf-font))
  (text (:string :encoding :utf-8))
  (fg sdl-color)
  (wrapLength :uint32))

#+fsbv
(defttffun ("TTF_RenderUNICODE_Blended_Wrapped" ttf-render-unicode-blended-wrapped) (:pointer sdl-surface)
  (font (:pointer ttf-font))
  (text (:string :encoding :utf-16))
  (fg sdl-color)
  (wrapLength :uint32))

#+fsbv
(defttffun ("TTF_RenderGlyph_Blended" ttf-render-glyph-blended) (:pointer sdl-surface)
  (font (:pointer ttf-font))
  (ch :uint16)
  (fg sdl-color))

#+fsbv
(defttf-lispfun ttf-render-text (font text fg bg)
  (ttf-render-text-shaded font text fg bg))

#+fsbv
(defttf-lispfun ttf-render-utf8 (font text fg bg)
  (ttf-render-utf8-shaded font text fg bg))

#+fsbv
(defttf-lispfun ttf-render-unicode (font text fg bg)
  (ttf-render-unicode-shaded font text fg bg))

(defttffun ("TTF_CloseFont" ttf-close-font) :void
  (font (:pointer ttf-font)))

(defttffun ("TTF_Quit" ttf-quit) :void)

(defttffun ("TTF_WasInit" ttf-was-init) :int)

(defttffun ("TTF_GetFontKerningSize" ttf-get-font-kerning-size) :int
  (font (:pointer ttf-font))
  (prev_index :int)
  (index :int))

(defttffun ("TTF_GetFontKerningSizeGlyphs" ttf-get-font-kerning-size-glyphs) :int
  (font (:pointer ttf-font))
  (previous_ch :uint16)
  (ch :uint16))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defmacro ttf-set-error (fmt &rest args)
    `(sdl-set-error ,fmt ,@args))

  (export 'ttf-set-error))

(defttf-lispfun ttf-get-error ()
  (sdl-get-error))
