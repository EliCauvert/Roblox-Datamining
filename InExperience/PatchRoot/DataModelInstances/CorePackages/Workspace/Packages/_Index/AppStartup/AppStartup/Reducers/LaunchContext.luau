local appStartup = script:FindFirstAncestor("AppStartup")
local _ = require(appStartup.Enums)

return require(appStartup.Parent.Rodux).createReducer(nil, {
	[require(appStartup.Actions.SetLaunchContext).name] = function(_, p0) --[[ line: 8 ]]
		return p0.launchContext
	end
})