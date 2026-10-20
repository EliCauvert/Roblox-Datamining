return require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return {
		type = script.Name,
		isUndo = p1.isUndo,
		equipped = p1.equipped,
		tryOn = p1.tryOn
	}
end)