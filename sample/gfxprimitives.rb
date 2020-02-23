require "sdl2"

SDL2.init(SDL2::INIT_VIDEO|SDL2::INIT_EVENTS)

window = SDL2::Window.create("gfxtestsprite",
	SDL2::Window::POS_CENTERED, SDL2::Window::POS_CENTERED, 640, 480, 0)
renderer = window.create_renderer(-1, 0)

renderer.draw_color = 0xFF0000_FF
renderer.draw_line(0, 0, 640, 480)
renderer.draw_line_aa(10, 0, 640, 470)
renderer.draw_color = 0xFFFF00_FF
renderer.draw_point(200, 200)
renderer.draw_color = 0x00FFFF_FF
renderer.draw_rect(SDL2::Rect.new(500, 20, 40, 60))
renderer.fill_rect(SDL2::Rect.new(20, 400, 60, 40))
renderer.draw_color = 0x00FFFF_FF
renderer.draw_ellipse(70, 70, 15, 15)
renderer.draw_blend_mode = SDL2::BlendMode::ADD
renderer.draw_color = 0xFF0000_FF
renderer.draw_rect(SDL2::Rect.new(40, 420, 60, 40))

renderer.present

loop do
	while (event = SDL2::Event.poll)
		case event
		when SDL2::Event::KeyDown
			exit if event.scancode == SDL2::Key::Scan::ESCAPE
		when SDL2::Event::Quit
			exit
		end
	end

	renderer.present
	sleep 0.02
end
