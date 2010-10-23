require 'singleton'
require 'gtk2'
require 'core/timer'
require 'gui/button'
require 'gui/text_field'
require 'gui/panel'
require 'gui/window'
require 'gui/progress_bar'

#window = Window.instance
Window.instance
Gtk.main
