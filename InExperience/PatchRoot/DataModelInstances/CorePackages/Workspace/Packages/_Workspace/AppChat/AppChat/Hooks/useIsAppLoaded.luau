local appChat = script:FindFirstAncestor("AppChat")
local useSelector = require(appChat.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local getDeepValueModule = require(appChat.Utils.getDeepValue)

return function()
	-- upvalues: useSelector (ref), getDeepValueModule (ref)
	return useSelector(function(p0)
		-- upvalues: getDeepValueModule (copy)
		return getDeepValueModule(p0, "ChatAppReducer.AppLoaded") or false
	end)
end