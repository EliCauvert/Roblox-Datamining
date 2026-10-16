local UserInputService = game:GetService("UserInputService")
local config = {
	[require(script.Parent.MessageFtuxTooltipVariant).Replies] = function() --[[ Line: 15 ]]
		-- upvalues: UserInputService (copy)
		return {
			storageKey = "AppChatEnableRepliesUIFtuxTooltip",
			textKey = if UserInputService.TouchEnabled and not UserInputService.MouseEnabled then "Feature.Chat.Label.SwipeToReplyTooltip" else "Feature.Chat.Label.HoverToReplyTooltip"
		}
	end
}

return function(p1) --[[ Line: 28 ]]
	-- upvalues: config (copy)
	return config[p1]()
end