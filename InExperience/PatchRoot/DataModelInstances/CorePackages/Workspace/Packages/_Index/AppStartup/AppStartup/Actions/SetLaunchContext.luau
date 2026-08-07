local appStartup = script:FindFirstAncestor("AppStartup")
local _ = require(appStartup.Enums)

return require(appStartup.Parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 6 ]]
	return { launchContext = p0 }
end)