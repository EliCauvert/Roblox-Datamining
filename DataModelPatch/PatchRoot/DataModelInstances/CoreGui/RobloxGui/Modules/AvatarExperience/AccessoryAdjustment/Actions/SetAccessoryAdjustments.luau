local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentSliderType)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Position, Rotation, Scale, ItemId)
	return {
		position = Position,
		rotation = Rotation,
		scale = Scale,
		itemId = ItemId
	}
end)