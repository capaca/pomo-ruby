require 'singleton'
require 'gtk2'
require 'core/timer'
require 'core/cycle_runner'
require 'core/input_validator'
require 'gui/button_start'
require 'gui/button_cancel'
require 'gui/text_field'
require 'gui/panel'
require 'gui/window'
require 'gui/progress_bar'

window = Window.instance
Gtk.main
