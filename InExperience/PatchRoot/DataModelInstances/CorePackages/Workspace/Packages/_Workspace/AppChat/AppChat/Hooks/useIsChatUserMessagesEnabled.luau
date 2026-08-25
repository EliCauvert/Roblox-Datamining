local appChat = script:FindFirstAncestor("AppChat")
local useSelector = require(appChat.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local getDeepValue2Module = require(appChat.Utils.getDeepValue2)

return function()
	-- upvalues: useSelector (ref), getDeepValue2Module (ref)
	return useSelector(function(p0)
		-- upvalues: getDeepValue2Module (copy)
		local var2 = getDeepValue2Module(p0, "ChatAppReducer.ChatSettings.chatUserMessagesEnabled")
		
		return var2 == nil or var2
	end)
end