local getFFlagExpChatUseIsDefaultTextChannelModule = require(script.Parent.Flags.GetFFlagExpChatUseIsDefaultTextChannel)

return function(p1)
	-- upvalues: getFFlagExpChatUseIsDefaultTextChannelModule (ref)
	if getFFlagExpChatUseIsDefaultTextChannelModule() then
		p1.IsDefaultTextChannel = true
		
		return
	end
end