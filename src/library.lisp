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

(cffi:define-foreign-library libsdl2-ttf
  (:darwin (:or (:framework "SDL2_ttf") (:default "libSDL2_ttf")))
  (:unix "libSDL2_ttf.so")
  (:windows "SDL2_ttf.dll")
  (t (:default "libSDL2_ttf")))

(cffi:use-foreign-library libsdl2-ttf)
