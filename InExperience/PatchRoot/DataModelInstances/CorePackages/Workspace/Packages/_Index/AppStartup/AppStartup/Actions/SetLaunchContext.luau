local appStartup = script:FindFirstAncestor("AppStartup")
local _ = require(appStartup.Enums)

return require(appStartup.Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { launchContext = p1 }
end)