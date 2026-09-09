local getFFlagExpChatUseIsDefaultTextChannelModule = require(script.Parent.Flags.GetFFlagExpChatUseIsDefaultTextChannel)

return function(p1, p2)
	-- upvalues: getFFlagExpChatUseIsDefaultTextChannelModule (ref)
	return if getFFlagExpChatUseIsDefaultTextChannelModule() then p2 == nil or p2.Value ~= 1 or (p1 == nil or p1.IsDefaultTextChannel == true) else true
end