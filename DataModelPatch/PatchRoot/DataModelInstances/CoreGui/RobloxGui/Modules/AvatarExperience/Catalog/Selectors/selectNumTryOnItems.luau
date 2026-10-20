local CorePackages = game:GetService("CorePackages")
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.AvatarExperienceState)
local TutilsModule = require(CorePackages.Packages.tutils)
local MemoizeResult = require(CorePackages.Workspace.Packages.AppCommonLib).memoize(function(p1)
	-- upvalues: TutilsModule (copy)
	return TutilsModule.fieldCount(p1)
end)

return function(p1)
	-- upvalues: MemoizeResult (copy)
	return MemoizeResult(p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems)
end