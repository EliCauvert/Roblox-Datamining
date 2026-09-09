local getFFlagExpChatUseIsDefaultTextChannelModule = require(script.Parent.Flags.GetFFlagExpChatUseIsDefaultTextChannel)
local textChatService = game:GetService("TextChatService")

return function()
	-- upvalues: getFFlagExpChatUseIsDefaultTextChannelModule (ref), textChatService (ref)
	if not getFFlagExpChatUseIsDefaultTextChannelModule() then
		return nil
	end
	local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
	
	return if chatWindowConfiguration == nil then nil else chatWindowConfiguration.TextChannelDisplayMode
end