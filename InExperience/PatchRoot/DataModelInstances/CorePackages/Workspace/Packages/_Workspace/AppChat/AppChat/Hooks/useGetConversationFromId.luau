local appChat = script:FindFirstAncestor("AppChat")
local useSelector = require(appChat.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local getDeepValueModule = require(appChat.Utils.getDeepValue)

return function(p0)
	-- upvalues: useSelector (ref), getDeepValueModule (ref)
	return useSelector(function(p1)
		-- upvalues: getDeepValueModule (copy), p0 (ref)
		return getDeepValueModule(p1, `ChatAppReducer.Conversations.{p0}`)
	end)
end