local RealNamesInDisplayNamesIXPV1 = game:DefineFastString("RealNamesInDisplayNamesIXP_v1", "Social.DisplayNameSetting")
local RealNamesInDisplayNamesExperimentDefinition = game:DefineFastString("RealNamesInDisplayNamesExperimentDefinition", "can_see_real_names")
local RealNamesInDisplayNamesEnabledForAll = game:DefineFastFlag("RealNamesInDisplayNamesEnabledForAll", false)
local UseUserExperimentFunction = require(script:FindFirstAncestor("EditProfile").Parent.RoactAppExperiment).useUserExperiment

local function IsExperimentEnabled(p1): boolean --[[ Line: 12 ]]
	-- upvalues: RealNamesInDisplayNamesEnabledForAll (copy), RealNamesInDisplayNamesIXPV1 (copy), RealNamesInDisplayNamesExperimentDefinition (copy)
	return if RealNamesInDisplayNamesEnabledForAll then true else ((p1 or {})[RealNamesInDisplayNamesIXPV1] or {})[RealNamesInDisplayNamesExperimentDefinition] == true
end

return {
	isExperimentEnabled = IsExperimentEnabled,
	useIsExperimentEnabled = function(p1) --[[ Line: 25 ]]
		-- upvalues: UseUserExperimentFunction (copy), RealNamesInDisplayNamesIXPV1 (copy), IsExperimentEnabled (copy)
		return UseUserExperimentFunction({ RealNamesInDisplayNamesIXPV1 }, IsExperimentEnabled, p1.isExposureEnabled)
	end
}