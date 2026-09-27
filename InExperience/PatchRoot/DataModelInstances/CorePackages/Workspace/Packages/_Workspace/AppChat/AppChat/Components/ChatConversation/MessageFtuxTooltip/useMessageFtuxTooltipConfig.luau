local userInputService = game:GetService("UserInputService")
local t = {
	[require(script.Parent.MessageFtuxTooltipVariant).Replies] = function()
		-- upvalues: userInputService (ref)
		return {
			storageKey = "AppChatEnableRepliesUIFtuxTooltip",
			textKey = if userInputService.TouchEnabled and not userInputService.MouseEnabled then "Feature.Chat.Label.SwipeToReplyTooltip" else "Feature.Chat.Label.HoverToReplyTooltip"
		}
	end
}

return function(p1)
	-- upvalues: t (ref)
	return t[p1]()
end