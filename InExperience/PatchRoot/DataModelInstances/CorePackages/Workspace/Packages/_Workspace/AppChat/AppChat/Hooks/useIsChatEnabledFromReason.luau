local appChat = script:FindFirstAncestor("AppChat")
local useSelector = require(appChat.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local getDeepValueModule = require(appChat.Utils.getDeepValue)

return function(p1)
	-- upvalues: useSelector (ref), getDeepValueModule (ref)
	return useSelector(function(p2)
		-- upvalues: getDeepValueModule (copy), p1 (ref)
		return getDeepValueModule(p2, `ChatAppReducer.ChatSettings.{p1}`) or false
	end)
end