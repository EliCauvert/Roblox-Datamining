local AvatarEditorService = game:GetService("AvatarEditorService")
local ShowAvatarChangeFeatureRestrictionFunction = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceCommon).Utils.showAvatarChangeFeatureRestriction

return function(p1)
	-- upvalues: AvatarEditorService (copy), ShowAvatarChangeFeatureRestrictionFunction (copy)
	(p1 or AvatarEditorService):SignalSaveAvatarPermissionDenied()
	ShowAvatarChangeFeatureRestrictionFunction()
end