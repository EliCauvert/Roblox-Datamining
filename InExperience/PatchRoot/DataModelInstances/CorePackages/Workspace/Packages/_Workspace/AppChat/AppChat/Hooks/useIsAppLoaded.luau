local AppChat = script:FindFirstAncestor("AppChat")
local UseSelectorFunction = require(AppChat.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local GetDeepValueModule = require(AppChat.Utils.getDeepValue)

return function() --[[ Line: 7 ]]
	-- upvalues: UseSelectorFunction (copy), GetDeepValueModule (copy)
	return UseSelectorFunction(function(p1) --[[ Line: 8 ]]
		-- upvalues: GetDeepValueModule (upval)
		return GetDeepValueModule(p1, "ChatAppReducer.AppLoaded") or false
	end)
end