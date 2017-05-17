require_relative 'vx.rb'
Dir.chdir('Data')
context=Xref::Context.new
xref=Xref::Switch.new(1)
mapinfo=load_data("MapInfos.rvdata")
mapinfo.each do |i, m|
	map=load_data(sprintf("Map%03d.rvdata", i))
	context.enter(:map, i)
	xref.xref_map(context, map)
	context.exit
end
xref.result.each do |r|
	s = ""
	r[0].each do |a|
		s += "#{a[0].to_s.upcase} #{a[1]} "
	end
	s += r[1]
	puts s
end