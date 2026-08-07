local roactAppExperimentModule = require(script:FindFirstAncestor("EditProfile").Parent.RoactAppExperiment)
local realNamesInDisplayNamesIXPV1 = game:DefineFastString("RealNamesInDisplayNamesIXP_v1", "Social.DisplayNameSetting")
local realNamesInDisplayNamesExperimentDefinition = game:DefineFastString("RealNamesInDisplayNamesExperimentDefinition", "can_see_real_names")
local realNamesInDisplayNamesEnabledForAll = game:DefineFastFlag("RealNamesInDisplayNamesEnabledForAll", false)
local useUserExperiment = roactAppExperimentModule.useUserExperiment

local var4 = function(p0) --[[ line: 12 ]]
	-- upvalues: realNamesInDisplayNamesEnabledForAll (ref), realNamesInDisplayNamesIXPV1 (ref), realNamesInDisplayNamesExperimentDefinition (ref)
	return if realNamesInDisplayNamesEnabledForAll then true else ((p0 or {})[realNamesInDisplayNamesIXPV1] or {})[realNamesInDisplayNamesExperimentDefinition] == true
end

return {
	isExperimentEnabled = var4,
	useIsExperimentEnabled = function(p1) --[[ line: 25 ]]
		-- upvalues: useUserExperiment (ref), realNamesInDisplayNamesIXPV1 (ref), var4 (ref)
		return useUserExperiment({ realNamesInDisplayNamesIXPV1 }, var4, p1.isExposureEnabled)
	end
}