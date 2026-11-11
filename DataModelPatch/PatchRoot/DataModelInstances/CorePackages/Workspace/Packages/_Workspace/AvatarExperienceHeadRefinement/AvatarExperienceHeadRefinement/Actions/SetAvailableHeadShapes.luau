local AvatarExperienceHeadRefinement = script:FindFirstAncestor("AvatarExperienceHeadRefinement")
local _ = require(AvatarExperienceHeadRefinement.Enums.HeadShape)

return require(AvatarExperienceHeadRefinement.Parent.Rodux).makeActionCreator(script.Name, function(HeadShapes)
	return { headShapes = HeadShapes }
end)