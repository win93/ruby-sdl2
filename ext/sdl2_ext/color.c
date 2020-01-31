/*
  PORTIONS OF THIS ARE BASED ON
  https://raw.githubusercontent.com/wvanbergen/oily_png/master/ext/oily_png/color.{c,h}
 
  Original Version Copyright (c) 2010-2014 Willem van Bergen

  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
  "Software"), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

#include <math.h>
#include "rubysdl2_internal.h"

typedef uint32_t PIXEL; // Pixels use 32 bits unsigned integers
typedef unsigned char BYTE; // Bytes use 8 bits unsigned integers

#define R_BYTE(pixel)  ((BYTE) (((pixel) & (PIXEL) 0xff000000) >> 24))
#define G_BYTE(pixel)  ((BYTE) (((pixel) & (PIXEL) 0x00ff0000) >> 16))
#define B_BYTE(pixel)  ((BYTE) (((pixel) & (PIXEL) 0x0000ff00) >> 8))
#define A_BYTE(pixel)  ((BYTE) (((pixel) & (PIXEL) 0x000000ff)))

#define BUILD_PIXEL(r, g, b, a)  (((PIXEL) (r) << 24) + ((PIXEL) (g) << 16) + ((PIXEL) (b) << 8) + (PIXEL) (a))

VALUE Color_s_r(VALUE self, VALUE value) {
  return INT2FIX(R_BYTE(NUM2UINT(value)));
}

VALUE Color_s_g(VALUE self, VALUE value) {
  return INT2FIX(G_BYTE(NUM2UINT(value)));
}

VALUE Color_s_b(VALUE self, VALUE value) {
  return INT2FIX(B_BYTE(NUM2UINT(value)));
}

VALUE Color_s_a(VALUE self, VALUE value) {
  return INT2FIX(A_BYTE(NUM2UINT(value)));
}

VALUE Color_s_rgb(VALUE self, VALUE r, VALUE g, VALUE b) {
  return UINT2NUM(BUILD_PIXEL(FIX2INT(r),
                              FIX2INT(g),
                              FIX2INT(b),
                              0xFF));
}

VALUE Color_s_rgba(VALUE self, VALUE r, VALUE g, VALUE b, VALUE a) {
  return UINT2NUM(BUILD_PIXEL(FIX2INT(r),
                              FIX2INT(g),
                              FIX2INT(b),
                              FIX2INT(a)));
}


SDL_Color rubysdl2_Color_to_SDL_Color(VALUE rgba)
{
    SDL_Color color;
    if (rgba == Qnil) {
        color.r = color.g = color.b = 0; color.a = 255;
        return color;
    } else {
      PIXEL pixel = NUM2UINT(rgba);
      color.r = R_BYTE(pixel);
      color.g = G_BYTE(pixel);
      color.b = B_BYTE(pixel);
      color.a = A_BYTE(pixel);
      return color;
    }

}

void rubysdl2_init_color(void) {
  VALUE cColor = rb_define_module_under(mSDL2, "Color");
  rb_define_singleton_method(cColor, "rgb", Color_s_rgb, 3);
  rb_define_singleton_method(cColor, "rgba", Color_s_rgba, 4);
  rb_define_singleton_method(cColor, "r", Color_s_r, 1);
  rb_define_singleton_method(cColor, "g", Color_s_g, 1);
  rb_define_singleton_method(cColor, "b", Color_s_b, 1);
  rb_define_singleton_method(cColor, "a", Color_s_a, 1);

  rb_define_const(cColor, "WHITE", UINT2NUM(0xFFFFFFFF));
  rb_define_const(cColor, "BLACK", UINT2NUM(0x000000FF));
  rb_define_const(cColor, "RED",   UINT2NUM(0xFF0000FF));
  rb_define_const(cColor, "GREEN",   UINT2NUM(0x00FF00FF));
  rb_define_const(cColor, "BLUE",   UINT2NUM(0x0000FFFF));
}

