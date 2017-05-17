def evtcmd_list(list)
	list.each do |c|
		puts evtcmd_translate(c, true)
	end
end

def evtcmd_translate(c, indent=false)
	if indent
		s = "  " * c.indent 
	else
		s = ""
	end
	p = c.parameters
	case c.code
	when 0
		s += "END OF BLOCK"
	when 101
		s += "MSG(FN=\"#{p[0]}\", FI=#{p[1]}, BG=#{p[2]}, PS=#{p[3]})"
	when 401
		s += "MSGDATA(\"#{p[0]}\")"
	when 102
		s += "CHIOCE("
		for i in 0...p[0].size
			s += "\"#{p[0][i]}\""
			s += ", "
		end
		s += "CANCEL=#{p[1]})"
	when 402
		s += "WHEN \"#{p[1]}\", BRANCH=#{p[0]}"
	when 403
		s += "WHEN CANCEL"
	when 103
		s += "INPUTNUM V[#{p[0]}], DIGIT=#{p[1]}"
	when 108
		s += "# #{p[0]}"
	when 111
		s += "IF "
		case p[0]
		when 0
			s += "S[#{p[1]}] == #{p[2] == 0 ? "ON" : "OFF"}"
		when 1
			sym = ["==", ">=", "<=", ">", "<", "!="]
			s += "V[#{p[1]}] #{sym[p[4]]} "
			if p[2] == 0
				s += "#{p[3]}"
			else
				s += "V[#{p[3]}]"
			end
		# TODO
		else
			s += "UNK #{p.inspect}"
		end
	when 411
		s += "ELSE"
	when 112
		s += "DO"
	when 413
		s += "LOOP"
	when 113
		s += "BREAK LOOP"
	when 115
		s += "TERMINATE"
	when 117
		s += "COMEVT #{p[0]}"
	when 118
		s += "LABEL #{p[0]}"
	when 119
		s += "GOTO #{p[0]}"
	when 121
		s += "SET "
		if p[0] == p[1]
			s += "S[#{p[0]}]"
		else
			s += "S[#{p[0]}..#{p[1]}]"
		end
		s += " = "
		if p[2] == 0
			s += "ON"
		else
			s += "OFF"
		end
	# TODO
	else
		s += "UNK #{c.code} #{p.inspect}"
	end
	s
end