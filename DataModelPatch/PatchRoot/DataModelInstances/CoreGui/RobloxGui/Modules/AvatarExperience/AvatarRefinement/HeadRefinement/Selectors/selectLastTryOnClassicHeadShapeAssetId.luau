local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.AvatarExperienceState)
local HeadShapeProperties = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceHeadRefinement).Enums.HeadShapeProperties
local SelectLastTryOnClassicHeadShapeModule = require(script.Parent.selectLastTryOnClassicHeadShape)

return function(p1)
	-- upvalues: SelectLastTryOnClassicHeadShapeModule (copy), HeadShapeProperties (copy)
	local SelectLastTryOnClassicHeadShapeModuleResult = SelectLastTryOnClassicHeadShapeModule(p1)
	
	return SelectLastTryOnClassicHeadShapeModuleResult and (HeadShapeProperties[SelectLastTryOnClassicHeadShapeModuleResult] and HeadShapeProperties[SelectLastTryOnClassicHeadShapeModuleResult].assetId)
end