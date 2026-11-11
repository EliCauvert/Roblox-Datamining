return require(game:GetService("CorePackages").Packages.Rodux).createReducer(0, {
	[require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Actions.IncrementSavedCharacterModelVersion).name] = function(p1: number, _): number
		return p1 + 1
	end
})