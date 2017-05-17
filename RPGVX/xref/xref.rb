class Xref
	attr_reader :result
	def initialize(id)
		@id = id
		@result = []
	end
	def xref_map(context, map)
		# post processing
		map.events.each do |id, event|
			context.enter(:event, id)
			puts "EVENT #{context.current[:event]}: #{event.name}"
			xref_event(context, event)
			context.exit
		end
	end
	def xref_event(context, event)
		# do not override
		event.pages.each_index do |index|
			context.enter(:page, index)
			puts "PAGE #{context.current[:page]}"
			xref_event_page(context, event.pages[index])
			context.exit
		end
	end
	def xref_event_page(context, page)
		# post processing
		page.list.each_index do |index|
			context.enter(:command, index)
			xref_eventcommand(context, page.list[index])
			context.exit
		end
	end
	def xref_eventcommand(context, command)
		# override
	end
end

class Xref::Context
	attr_reader :actors
	attr_reader :animations
	attr_reader :areas
	attr_reader :armors
	attr_reader :classes
	attr_reader :commonevents
	attr_reader :enemies
	attr_reader :items
	attr_reader :mapinfos
	attr_reader :skills
	attr_reader :states
	attr_reader :system
	attr_reader :troops
	attr_reader :weapons
	def initialize
		@stack = []
		@actors = load_data("Actors.rvdata")
		@animations = load_data("Animations.rvdata")
		@areas = load_data("Areas.rvdata")
		@armors = load_data("Armors.rvdata")
		@classes = load_data("Classes.rvdata")
		@commonevents = load_data("CommonEvents.rvdata")
		@enemies = load_data("Enemies.rvdata")
		@items = load_data("Items.rvdata")
		@mapinfos = load_data("MapInfos.rvdata")
		@skills = load_data("Skills.rvdata")
		@states = load_data("States.rvdata")
		@system = load_data("System.rvdata")
		@troops = load_data("Troops.rvdata")
		@weapons = load_data("Weapons.rvdata")
	end
	def enter(type, id)
		@stack.push([type, id])
	end
	def exit
		@stack.pop
	end
	def current
		list = {}
		@stack.each {|a| list[a[0]] = a[1] }
		list
	end
	def stack
		@stack.dup
	end
end

require_relative('switch.rb')
# TODO