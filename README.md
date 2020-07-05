# Ruby/SDL2

[![Gem Version](https://badge.fury.io/rb/sdl2-win93.svg)](https://badge.fury.io/rb/sdl2-win93)

The simple ruby extension library for SDL 2.x, forked from the ruby-sdl2 gem.

## Installation

Before installing Ruby/SDL2, you need to install:

* [devkit](http://rubyinstaller.org/add-ons/devkit/) (only for windows)
* M4 (only for making modifications to the ruby extension)
* [SDL 2.x](http://www.libsdl.org/download-2.0.php)
* [SDL2_image](https://www.libsdl.org/projects/SDL_image/) (Optional)
* [SDL2_mixer](https://www.libsdl.org/projects/SDL_mixer/) (Optional)
* [SDL2_ttf](https://www.libsdl.org/projects/SDL_ttf/) (Optional)
* [SDL2_gfx](https://www.ferzkopp.net/wordpress/2016/01/02/sdl_gfx-sdl2_gfx/) (Optional)

After installing these libraries, you can install Ruby/SDL2 by gem command as follows:

    gem install ruby-sdl2

Alternatively You can also install the master version of Ruby/SDL2 from github:

    git clone https://github.com/ohai/ruby-sdl2.git
    cd ruby-sdl2
    rake gem
    gem install pkg/ruby-sdl2-x.y.z.gem

## Documentation

* [English Reference manual](http://win93.github.io/ruby-sdl2/doc-en/)

## License

Licensed under LGPLv3.0 (see COPYING.txt)

## Contributors

* Alex Gittemeier (Fork maintainer)
* Ippei Obayashi <ohai@kmc.gr.jp> (Upstream maintainer)
* @furunkel (Project modernization)
