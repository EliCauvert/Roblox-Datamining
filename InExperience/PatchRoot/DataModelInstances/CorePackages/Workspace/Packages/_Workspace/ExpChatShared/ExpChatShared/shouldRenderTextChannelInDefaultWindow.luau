local GetFFlagExpChatUseIsDefaultTextChannelModule = require(script.Parent.Flags.GetFFlagExpChatUseIsDefaultTextChannel)

return function(p1, p2): boolean --[[ Line: 27 | Named "shouldRenderTextChannelInDefaultWindow" ]]
	-- upvalues: GetFFlagExpChatUseIsDefaultTextChannelModule (copy)
	return not GetFFlagExpChatUseIsDefaultTextChannelModule() or (p2 == nil or p2.Value ~= 1 or (p1 == nil or p1.IsDefaultTextChannel == true))
end