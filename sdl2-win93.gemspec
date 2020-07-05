# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sdl2/version'

Gem::Specification.new do |spec|
  spec.name = "sdl2-win93"
  spec.version = SDL2::VERSION
  spec.summary = "[Fork of ruby-sdl2 gem] SDL2 library wrapper"
  spec.description = <<-EOS
    Ruby/SDL2 is an extension library to use SDL 2.x
    (Simple DirectMedia Layer). SDL 2.x is quite refined
    from SDL 1.x and API is changed.
    This library enables you to control audio, keyboard,
    mouse, joystick, 3D hardware via OpenGL, and 2D video
    using opengl or Direct3D.
    Ruby/SDL is used for games and visual demos.
  EOS
  spec.license = "LGPL-3.0"
  spec.authors = ["Alex Gittemeier", "furunkel", "Ippei Obayashi"]
  spec.email = "gittemeier.alex@gmail.com"
  spec.homepage = "https://github.com/win93/ruby-sdl2"
  spec.files = `git ls-files`.split(/\n/)
  spec.test_files = []
  spec.extensions = ["ext/sdl2_ext/extconf.rb"]

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rake-compiler", "~> 0.9"
  spec.add_development_dependency "yard", "~> 0.8"
end
