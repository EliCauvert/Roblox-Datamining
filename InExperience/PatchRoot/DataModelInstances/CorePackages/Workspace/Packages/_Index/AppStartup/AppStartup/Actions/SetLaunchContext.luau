local appStartup = script:FindFirstAncestor("AppStartup")
local _ = require(appStartup.Enums)

return require(appStartup.Parent.Rodux).makeActionCreator(script.Name, function(p0)
	return { launchContext = p0 }
end)