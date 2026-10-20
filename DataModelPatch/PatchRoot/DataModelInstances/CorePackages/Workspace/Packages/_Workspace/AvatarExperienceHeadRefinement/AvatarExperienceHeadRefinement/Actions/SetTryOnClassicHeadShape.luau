local AvatarExperienceHeadRefinement = script:FindFirstAncestor("AvatarExperienceHeadRefinement")
local _ = require(AvatarExperienceHeadRefinement.Enums.HeadShape)

return require(AvatarExperienceHeadRefinement.Parent.Rodux).makeActionCreator(script.Name, function(HeadShape)
	return { headShape = HeadShape }
end)