local AppChat = script:FindFirstAncestor("AppChat")
local UseSelectorFunction = require(AppChat.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local GetDeepValueModule = require(AppChat.Utils.getDeepValue)

return function(p1) --[[ Line: 7 ]]
	-- upvalues: UseSelectorFunction (copy), GetDeepValueModule (copy)
	return UseSelectorFunction(function(p2) --[[ Line: 8 ]]
		-- upvalues: GetDeepValueModule (upval), p1 (copy)
		return GetDeepValueModule(p2, `ChatAppReducer.Conversations.{p1}`)
	end)
end