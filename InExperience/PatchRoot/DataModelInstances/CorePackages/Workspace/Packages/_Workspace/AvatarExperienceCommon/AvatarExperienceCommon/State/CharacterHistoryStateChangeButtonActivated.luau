return require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 25 ]]
	return {
		type = script.Name,
		isUndo = p0.isUndo,
		equipped = p0.equipped,
		tryOn = p0.tryOn
	}
end)