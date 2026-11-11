local AppStartup = script:FindFirstAncestor("AppStartup")
local _ = require(AppStartup.Enums)

return require(AppStartup.Parent.Rodux).createReducer(nil, {
	[require(AppStartup.Actions.SetLaunchContext).name] = function(_, p1)
		return p1.launchContext
	end
})