local appChat = script:FindFirstAncestor("AppChat")
local useSelector = require(appChat.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local getDeepValueModule = require(appChat.Utils.getDeepValue)

return function() --[[ line: 7 ]]
	-- upvalues: useSelector (ref), getDeepValueModule (ref)
	return useSelector(function(p0) --[[ line: 8 ]]
		-- upvalues: getDeepValueModule (copy)
		return getDeepValueModule(p0, "ChatAppReducer.ChatSettings.groupChatEnabled") or false
	end)
end