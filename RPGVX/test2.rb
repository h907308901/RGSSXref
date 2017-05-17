require_relative 'vx.rb'
map=load_data("Map001.rvdata")
e=map.events[1]
p=e.pages[0]
evtcmd_list(p.list)