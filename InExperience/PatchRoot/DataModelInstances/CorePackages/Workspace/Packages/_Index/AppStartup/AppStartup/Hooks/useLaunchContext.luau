local AppStartup = script:FindFirstAncestor("AppStartup")
local _ = require(AppStartup.Enums)
local UseSelectorFunction = require(AppStartup.Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function() --[[ Line: 7 ]]
	-- upvalues: UseSelectorFunction (copy)
	return UseSelectorFunction(function(p1) --[[ Line: 8 ]]
		return p1.LaunchContext
	end)
end