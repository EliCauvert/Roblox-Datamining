local GetFFlagExpChatUseIsDefaultTextChannelModule = require(script.Parent.Flags.GetFFlagExpChatUseIsDefaultTextChannel)
local TextChatService = game:GetService("TextChatService")

return function() --[[ Line: 22 | Named "getTextChannelDisplayMode" ]]
	-- upvalues: GetFFlagExpChatUseIsDefaultTextChannelModule (copy), TextChatService (copy)
	if GetFFlagExpChatUseIsDefaultTextChannelModule() then
		local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		return if ChatWindowConfiguration == nil then nil else ChatWindowConfiguration.TextChannelDisplayMode
	else
		return nil
	end
end