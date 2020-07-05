# frozen_string_literal: true

module SDL2
  # Version string of Ruby/SDL2
  VERSION = "1.0.0"
  # Version of Ruby/SDL2, [major, minor, patch level]
  VERSION_NUMBER = VERSION.split(".").map(&:to_i)
end
