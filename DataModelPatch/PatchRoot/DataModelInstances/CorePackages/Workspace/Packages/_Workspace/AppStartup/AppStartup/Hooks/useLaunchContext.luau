local AppStartup = script:FindFirstAncestor("AppStartup")
local _ = require(AppStartup.Enums)
local UseSelectorFunction = require(AppStartup.Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function()
	-- upvalues: UseSelectorFunction (copy)
	return UseSelectorFunction(function(p1)
		return p1.LaunchContext
	end)
end