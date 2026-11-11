return require(script:FindFirstAncestor("AvatarExperienceHeadRefinement").Parent.Rodux).makeActionCreator(script.Name, function(HeadShapeName)
	return { headShapeName = HeadShapeName }
end)