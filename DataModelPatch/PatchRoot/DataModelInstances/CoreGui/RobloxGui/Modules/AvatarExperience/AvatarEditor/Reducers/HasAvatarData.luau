return require(game:GetService("CorePackages").Packages.Rodux).createReducer(false, {
	[require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData).name] = function(_, _): boolean
		return true
	end
})