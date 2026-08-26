local parent = script.Parent.Parent
local isVRAppBuild = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).IsVRAppBuild
local platformEnumModule = require(parent.Enums.PlatformEnum)
local FTUXConstantsModule = require(parent.Resources.FTUXConstants)

function IsFTUXExperience(p1)
	-- upvalues: platformEnumModule (ref), isVRAppBuild (ref), FTUXConstantsModule (ref)
	return p1 == platformEnumModule.QuestVR and (isVRAppBuild() and tostring(game.PlaceId) == FTUXConstantsModule[platformEnumModule.QuestVR].ExperienceIds.PlaceId)
end

return IsFTUXExperience