return require(game:GetService("CorePackages").Packages.Rodux).createReducer({}, {
	[require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.Authentication.SetSignUpBundles).name] = function(_, p1)
		return p1.bundles
	end
})