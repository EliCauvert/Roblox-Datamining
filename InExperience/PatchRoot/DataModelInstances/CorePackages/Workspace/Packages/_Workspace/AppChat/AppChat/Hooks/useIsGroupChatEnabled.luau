local appChat = script:FindFirstAncestor("AppChat")
local useSelector = require(appChat.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local getDeepValueModule = require(appChat.Utils.getDeepValue)

return function()
	-- upvalues: useSelector (ref), getDeepValueModule (ref)
	return useSelector(function(p1)
		-- upvalues: getDeepValueModule (copy)
		return getDeepValueModule(p1, "ChatAppReducer.ChatSettings.groupChatEnabled") or false
	end)
end