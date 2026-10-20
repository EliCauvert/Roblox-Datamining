return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(Position, Rotation, Scale, ItemId)
	return {
		position = Position,
		rotation = Rotation,
		scale = Scale,
		itemId = ItemId
	}
end)