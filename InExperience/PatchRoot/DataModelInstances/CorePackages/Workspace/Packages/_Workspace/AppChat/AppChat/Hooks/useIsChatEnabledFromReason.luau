local AppChat = script:FindFirstAncestor("AppChat")
local UseSelectorFunction = require(AppChat.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local GetDeepValueModule = require(AppChat.Utils.getDeepValue)

return function(p1) --[[ Line: 9 ]]
	-- upvalues: UseSelectorFunction (copy), GetDeepValueModule (copy)
	return UseSelectorFunction(function(p2) --[[ Line: 10 ]]
		-- upvalues: GetDeepValueModule (upval), p1 (copy)
		return GetDeepValueModule(p2, `ChatAppReducer.ChatSettings.{p1}`) or false
	end)
end