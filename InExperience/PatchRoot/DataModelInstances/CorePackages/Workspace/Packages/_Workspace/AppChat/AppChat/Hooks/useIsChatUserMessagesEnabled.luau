local appChat = script:FindFirstAncestor("AppChat")
local useSelector = require(appChat.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local getDeepValue2Module = require(appChat.Utils.getDeepValue2)

return function()
	-- upvalues: useSelector (ref), getDeepValue2Module (ref)
	return useSelector(function(p1)
		-- upvalues: getDeepValue2Module (copy)
		local var1 = getDeepValue2Module(p1, "ChatAppReducer.ChatSettings.chatUserMessagesEnabled")
		
		return var1 == nil or var1
	end)
end