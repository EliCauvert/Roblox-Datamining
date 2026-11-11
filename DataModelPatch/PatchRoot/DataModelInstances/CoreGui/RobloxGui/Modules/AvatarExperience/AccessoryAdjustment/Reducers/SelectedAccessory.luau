return require(game:GetService("CorePackages").Packages.Rodux).createReducer(nil, {
	[require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.AccessoryAdjustment.Actions.SetSelectedAccessory).name] = function(_, p1)
		return p1.selectedAccessory
	end
})