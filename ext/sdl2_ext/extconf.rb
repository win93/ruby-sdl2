require 'mkmf'

pkg_config "sdl2"
pkg_config "SDL2_mixer"
pkg_config "SDL2_ttf"
pkg_config "SDL2_image"
pkg_config "SDL2_gfx"

have_header "SDL_image.h"
have_header "SDL_mixer.h"
have_header "SDL_ttf.h"
have_header("SDL_filesystem.h")
have_header "SDL2_gfxPrimitives.h"

have_const("MIX_INIT_MODPLUG", "SDL_mixer.h")
have_const("MIX_INIT_FLUIDSYNTH", "SDL_mixer.h")
have_const("MIX_INIT_MID", "SDL_mixer.h")
have_const("SDL_RENDERER_PRESENTVSYNC", "SDL_render.h")
have_const("SDL_WINDOW_ALLOW_HIGHDPI", "SDL_video.h")
have_const("SDL_WINDOW_MOUSE_CAPTURE", "SDL_video.h")

create_makefile('sdl2_ext')
