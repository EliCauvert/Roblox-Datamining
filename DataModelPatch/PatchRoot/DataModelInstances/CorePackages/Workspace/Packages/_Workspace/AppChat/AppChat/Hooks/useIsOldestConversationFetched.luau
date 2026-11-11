local AppChat = script:FindFirstAncestor("AppChat")
local UseSelectorFunction = require(AppChat.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local GetDeepValueModule = require(AppChat.Utils.getDeepValue)

return function()
	-- upvalues: UseSelectorFunction (copy), GetDeepValueModule (copy)
	return UseSelectorFunction(function(p1)
		-- upvalues: GetDeepValueModule (upval)
		return GetDeepValueModule(p1, "ChatAppReducer.ConversationsAsync.oldestConversationIsFetched")
	end)
end