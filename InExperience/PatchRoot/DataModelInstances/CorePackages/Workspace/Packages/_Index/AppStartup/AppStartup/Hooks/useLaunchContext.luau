local appStartup = script:FindFirstAncestor("AppStartup")
local _ = require(appStartup.Enums)
local useSelector = require(appStartup.Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function() --[[ line: 7 ]]
	-- upvalues: useSelector (ref)
	return useSelector(function(p0) --[[ line: 8 ]]
		return p0.LaunchContext
	end)
end