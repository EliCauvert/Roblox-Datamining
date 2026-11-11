local Parent = script.Parent.Parent
local IsVRAppBuildFunction = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).IsVRAppBuild
local PlatformEnumModule = require(Parent.Enums.PlatformEnum)
local FTUXConstantsModule = require(Parent.Resources.FTUXConstants)

function IsFTUXExperience(QuestVR): boolean
	-- upvalues: PlatformEnumModule (copy), IsVRAppBuildFunction (copy), FTUXConstantsModule (copy)
	return QuestVR == PlatformEnumModule.QuestVR and (IsVRAppBuildFunction() and tostring(game.PlaceId) == FTUXConstantsModule[PlatformEnumModule.QuestVR].ExperienceIds.PlaceId)
end

return IsFTUXExperience