local appStartup = script:FindFirstAncestor("AppStartup")
local _ = require(appStartup.Enums)
local useSelector = require(appStartup.Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function()
	-- upvalues: useSelector (ref)
	return useSelector(function(p1)
		return p1.LaunchContext
	end)
end