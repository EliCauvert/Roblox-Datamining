local GetFFlagExpChatUseIsDefaultTextChannelModule = require(script.Parent.Flags.GetFFlagExpChatUseIsDefaultTextChannel)

return function(p1) --[[ Line: 16 | Named "markTextChannelAsDefault" ]]
	-- upvalues: GetFFlagExpChatUseIsDefaultTextChannelModule (copy)
	if GetFFlagExpChatUseIsDefaultTextChannelModule() then
		p1.IsDefaultTextChannel = true
		
		return
	end
end