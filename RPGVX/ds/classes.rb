# http://www.hbgames.org/forums/viewtopic.php?t=49838

class Bitmap
end

class Color
  def initialize(r, g, b, a = 255)
	 @red = r
	 @green = g
	 @blue = b
	 @alpha = a
  end
  def set(r, g, b, a = 255)
	 @red = r
	 @green = g
	 @blue = b
	 @alpha = a
  end
  def color
	 Color.new(@red, @green, @blue, @alpha)
  end
  def _dump(d = 0)
	 [@red, @green, @blue, @alpha].pack('d4')
  end
  def self._load(s)
	 Color.new(*s.unpack('d4'))
  end
  attr_accessor(:red, :green, :blue, :alpha)
end

class Font
end

class Plane
end

class Rect
end

class Sprite
end

class Table
  def initialize(x, y = 1, z = 1)
	 @xsize, @ysize, @zsize = x, y, z
	 @data = Array.new(x * y * z, 0)
  end
  def [](x, y = 0, z = 0)
	 @data[x + y * @xsize + z * @xsize * @ysize]
  end
  def []=(*args)
	 x = args[0]
	 y = args.size > 2 ? args[1] :0
	 z = args.size > 3 ? args[2] :0
	 v = args.pop
	 @data[x + y * @xsize + z * @xsize * @ysize] = v
  end
  def _dump(d = 0)
	 s = [3].pack('L')
	 s += [@xsize].pack('L') + [@ysize].pack('L') + [@zsize].pack('L')
	 s += [@xsize * @ysize * @zsize].pack('L')
	 for z in 0...@zsize
		for y in 0...@ysize
		   for x in 0...@xsize
			  s += [@data[x + y * @xsize + z * @xsize * @ysize]].pack('S')
		   end
		end
	 end
	 s
  end
  def self._load(s)
	 size = s[0, 4].unpack('L')[0]
	 nx = s[4, 4].unpack('L')[0]
	 ny = s[8, 4].unpack('L')[0]
	 nz = s[12, 4].unpack('L')[0]
	 data = []
	 pointer = 20
	 loop do
		data.push(*s[pointer, 2].unpack('S'))
		pointer += 2
		break if pointer > s.size - 1
	 end
	 t = Table.new(nx, ny, nz)
	 n = 0
	 for z in 0...nz
		for y in 0...ny
		   for x in 0...nx
			  t[x, y, z] = data[n]
			  n += 1
		   end
		end
	 end
	 t
  end
  attr_reader(:xsize, :ysize, :zsize, :data)
end

class Tilemap
end

class Tone
  def initialize(r, g, b, a = 0)
	 @red = r
	 @green = g
	 @blue = b
	 @gray = a
  end
  def set(r, g, b, a = 0)
	 @red = r
	 @green = g
	 @blue = b
	 @gray = a
  end
  def color
	 Color.new(@red, @green, @blue, @gray)
  end
  def _dump(d = 0)
	 [@red, @green, @blue, @gray].pack('d4')
  end
  def self._load(s)
	 Tone.new(*s.unpack('d4'))
  end
  attr_accessor(:red, :green, :blue, :gray)
end

class Viewport
end

class Window
end

class RGSSError < StandardError
end