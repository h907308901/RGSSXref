class Xref::Switch < Xref
	def xref_event_page(context, page)
		if page.condition.switch1_valid && page.condition.switch1_id == @id
			@result.push [context.stack, "R: cond switch 1"]
		end
		if page.condition.switch2_valid && page.condition.switch2_id == @id
			@result.push [context.stack, "R: cond switch 2"]
		end
		super
	end
	def xref_eventcommand(context, command)
		case command.code
		when 111
			if command.parameters[0] == 0 && command.parameters[1] == @id
				@result.push [context.stack, "R: cond (#{evtcmd_translate(command)})"]
			end
		when 121
			if (command.parameters[0]..command.parameters[1]).include?(@id)
				@result.push [context.stack, "W: set (#{evtcmd_translate(command)})"]
			end
		end
	end
end