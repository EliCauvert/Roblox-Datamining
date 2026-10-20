local Modules = game:GetService("CoreGui").RobloxGui.Modules

return require(game:GetService("CorePackages").Packages.Rodux).createReducer(require(Modules.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentType).Position, {
	[require(Modules.AvatarExperience.AccessoryAdjustment.Actions.SetAdjustmentType).name] = function(_, p1)
		return p1.adjustmentType
	end
})