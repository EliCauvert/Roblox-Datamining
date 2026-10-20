local _ = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceHeadRefinement)
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.AvatarExperienceState)

return function(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.LastTryOnClassicHeadShape
end