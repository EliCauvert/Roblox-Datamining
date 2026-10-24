local TextChannelWindow = script:FindFirstAncestor("TextChannelWindow")
local TextChannelWindowAnalyticsModule = require(TextChannelWindow.TextChannelWindowAnalytics)
local LoggerModule = require(TextChannelWindow.Logger)
local GetFFlagExpChatProtectedChatInternalAPIsFunction = require(TextChannelWindow.Parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs

return function(TextChannel, Message)
	-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (copy), LoggerModule (copy), TextChannelWindowAnalyticsModule (copy)
	local Success, Result = pcall(function()
		-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), TextChannel (copy), Message (copy)
		if GetFFlagExpChatProtectedChatInternalAPIsFunction() then
			TextChannel:SendInternalAsync(Message)
			
			return
		else
			TextChannel:SendAsync(Message)
		end
	end)
	
	if not Success then
		LoggerModule:warning("SendAsync failed: {}", Result)
	end
	TextChannelWindowAnalyticsModule.emit(TextChannelWindowAnalyticsModule.Counters.Send, {
		has_target = true,
		result = if Success then "success" else "failure",
		target_text_channel_category = TextChannelWindowAnalyticsModule.getChannelCategory(TextChannel.Name)
	})
	
	return Success
end