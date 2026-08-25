local userInputService = game:GetService("UserInputService")
local fFlagAppChatUseSwipeForRepliesModule = require(script:FindFirstAncestor("AppChat").Flags.FFlagAppChatUseSwipeForReplies)
local t = {
	[require(script.Parent.MessageFtuxTooltipVariant).Replies] = function()
		-- upvalues: userInputService (ref), fFlagAppChatUseSwipeForRepliesModule (ref)
		return {
			storageKey = "AppChatEnableRepliesUIFtuxTooltip",
			textKey = if userInputService.TouchEnabled and not userInputService.MouseEnabled then if fFlagAppChatUseSwipeForRepliesModule then "Feature.Chat.Label.SwipeToReplyTooltip" else "Feature.Chat.Label.LongPressToReplyTooltip" else "Feature.Chat.Label.HoverToReplyTooltip"
		}
	end
}

return function(p0)
	-- upvalues: t (ref)
	return t[p0]()
end