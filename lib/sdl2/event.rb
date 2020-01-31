# frozen_string_literal: true

module SDL2
	class Event
		class Window
			def inspect
				# TODO: this is compressible with a dyanmic filled hash
				event_inspect =
					case event
					when NONE then "NONE"
					when SHOWN then "SHOWN"
					when HIDDEN then "HIDDEN"
					when EXPOSED then "EXPOSED"
					when MOVED then "MOVED(#{data1}, #{data2})"
					when RESIZED then "RESIZED(#{data1}, #{data2})"
					when SIZE_CHANGED then "SIZE_CHANGED(#{data1}, #{data2})"
					when MINIMIZED then "MINIMIZED"
					when MAXIMIZED then "MAXIMIZED"
					when RESTORED then "RESTORED"
					when ENTER then "ENTER"
					when LEAVE then "LEAVE"
					when FOCUS_GAINED then "FOCUS_GAINED"
					when FOCUS_LOST then "FOCUS_LOST"
					when CLOSE then "CLOSE"
					else "UNKNOWN(#{event})(#{data1}, #{data2})"
					end

				"<#{self.class.inspect}: " \
					"timestamp=#{timestamp.inspect} " \
					"window_id=#{window_id.inspect} " \
					"event=#{event_inspect}>"
			end
		end

		class TextInput
			def inspect
				"<#{self.class.inspect}: " \
					"timestamp=#{timestamp.inspect} " \
					"window_id=#{window_id.inspect} " \
					"text=#{text.inspect}>"
			end
		end

		class Keyboard
			def inspect
				"<#{self.class.inspect}: " \
					"timestamp=#{timestamp.inspect} " \
					"window_id=#{window_id.inspect} " \
					"repeat=#{repeat.inspect} " \
					"scancode=#{SDL2::Key::Scan.name_of(scancode).inspect} " \
					"sym=#{SDL2::Key.name_of(sym).inspect}>"
			end
		end
	end
end
