require_relative 'classes.rb'
require_relative 'modules.rb'
require_relative 'rpg/map.rb'
require_relative 'rpg/mapinfo.rb'
require_relative 'rpg/area.rb'
require_relative 'rpg/event.rb'
require_relative 'rpg/event_page.rb'
require_relative 'rpg/event_page_condition.rb'
require_relative 'rpg/event_page_graphic.rb'
require_relative 'rpg/eventcommand.rb'
require_relative 'rpg/moveroute.rb'
require_relative 'rpg/movecommand.rb'
require_relative 'rpg/actor.rb'
require_relative 'rpg/class.rb'
require_relative 'rpg/class_learning.rb'
require_relative 'rpg/baseitem.rb'
require_relative 'rpg/enemy.rb'
require_relative 'rpg/enemy_dropitem.rb'
require_relative 'rpg/enemy_action.rb'
require_relative 'rpg/troop.rb'
require_relative 'rpg/troop_member.rb'
require_relative 'rpg/troop_page.rb'
require_relative 'rpg/troop_page_condition.rb'
require_relative 'rpg/state.rb'
require_relative 'rpg/animation.rb'
require_relative 'rpg/animation_frame.rb'
require_relative 'rpg/animation_timing.rb'
require_relative 'rpg/commonevent.rb'
require_relative 'rpg/system.rb'
require_relative 'rpg/system_vehicle.rb'
require_relative 'rpg/system_terms.rb'
require_relative 'rpg/system_testbattler.rb'
require_relative 'rpg/audiofile.rb'

def load_data(filename)
	File.open(filename, "rb") { |f| Marshal.load(f)}
end

def save_data(obj, filename)
	File.open(filename, "wb") { |f| Marshal.dump(obj, f)}
end

require_relative 'util.rb'