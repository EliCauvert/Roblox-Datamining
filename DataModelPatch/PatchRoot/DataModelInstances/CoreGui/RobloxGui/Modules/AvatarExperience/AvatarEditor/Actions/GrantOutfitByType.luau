local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(OutfitTypeId, OutfitId)
	return { outfitTypeId = OutfitTypeId, outfitId = OutfitId }
end)