local AppStartup = script:FindFirstAncestor("AppStartup")
local _ = require(AppStartup.Enums)

return require(AppStartup.Parent.Rodux).makeActionCreator(script.Name, function(LaunchContext) --[[ Line: 6 ]]
	return { launchContext = LaunchContext }
end)