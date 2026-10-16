game:DefineFastFlag("InternationalNamesEnabledForAll", false)
local InternationalNamesIXPLayer = game:DefineFastString("InternationalNamesIXPLayer", "Social.InternationalDisplayName")
local InternationalNamesIXPExperimentDefinition = game:DefineFastString("InternationalNamesIXPExperimentDefinition", "enableInternationalNames")
local IXPService = game:GetService("IXPService")
local UseUserExperimentFunction = require(script:FindFirstAncestor("EditProfile").Parent.RoactAppExperiment).useUserExperiment

local function _() --[[ Line: 14 | Named "internationalNamesEnabledForAll" ]]
	return game:GetFastFlag("InternationalNamesEnabledForAll")
end

local function isExperimentEnabled(p1) --[[ Line: 18 ]]
	-- upvalues: InternationalNamesIXPLayer (copy), InternationalNamesIXPExperimentDefinition (copy)
	return ((p1 or {})[InternationalNamesIXPLayer] or {})[InternationalNamesIXPExperimentDefinition] == true or game:GetFastFlag("InternationalNamesEnabledForAll")
end

return {
	FFlagIsExperimentEnabled = isExperimentEnabled,
	useIsExperimentEnabled = function(p1) --[[ Line: 28 ]]
		-- upvalues: UseUserExperimentFunction (copy), InternationalNamesIXPLayer (copy), isExperimentEnabled (copy)
		return UseUserExperimentFunction({ InternationalNamesIXPLayer }, isExperimentEnabled, (p1 or { isExposureEnabled = false }).isExposureEnabled)
	end,
	logExposure = function() --[[ Line: 32 ]]
		-- upvalues: IXPService (copy), InternationalNamesIXPLayer (copy)
		IXPService:LogUserLayerExposure(InternationalNamesIXPLayer)
	end
}