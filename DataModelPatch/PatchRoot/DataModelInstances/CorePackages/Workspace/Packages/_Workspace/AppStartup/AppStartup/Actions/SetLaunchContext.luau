local AppStartup = script:FindFirstAncestor("AppStartup")
local _ = require(AppStartup.Enums)

return require(AppStartup.Parent.Rodux).makeActionCreator(script.Name, function(LaunchContext)
	return { launchContext = LaunchContext }
end)