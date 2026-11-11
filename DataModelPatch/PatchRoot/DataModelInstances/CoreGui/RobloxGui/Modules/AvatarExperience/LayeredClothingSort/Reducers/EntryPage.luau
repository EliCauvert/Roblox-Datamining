local CorePackages = game:GetService("CorePackages")

return require(CorePackages.Packages.Rodux).createReducer(require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen.None, {
	[require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.LayeredClothingSort.Actions.SetEntryPage).name] = function(_, p1)
		return p1.entryPage
	end
})