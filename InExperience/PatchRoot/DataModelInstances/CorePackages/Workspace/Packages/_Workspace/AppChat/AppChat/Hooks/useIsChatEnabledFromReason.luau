local appChat = script:FindFirstAncestor("AppChat")
local useSelector = require(appChat.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local getDeepValueModule = require(appChat.Utils.getDeepValue)

return function(p0) --[[ line: 9 ]]
	-- upvalues: useSelector (ref), getDeepValueModule (ref)
	return useSelector(function(p1) --[[ line: 10 ]]
		-- upvalues: getDeepValueModule (copy), p0 (ref)
		return getDeepValueModule(p1, `ChatAppReducer.ChatSettings.{p0}`) or false
	end)
end