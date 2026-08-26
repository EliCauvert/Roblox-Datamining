game:DefineFastFlag("InternationalNamesEnabledForAll", false)
local internationalNamesIXPLayer = game:DefineFastString("InternationalNamesIXPLayer", "Social.InternationalDisplayName")
local internationalNamesIXPExperimentDefinition = game:DefineFastString("InternationalNamesIXPExperimentDefinition", "enableInternationalNames")
local IXPService = game:GetService("IXPService")
local useUserExperiment = require(script:FindFirstAncestor("EditProfile").Parent.RoactAppExperiment).useUserExperiment

local function _()
	return game:GetFastFlag("InternationalNamesEnabledForAll")
end

local function isExperimentEnabled(p1)
	-- upvalues: internationalNamesIXPLayer (ref), internationalNamesIXPExperimentDefinition (ref)
	return if ((p1 or {})[internationalNamesIXPLayer] or {})[internationalNamesIXPExperimentDefinition] ~= true then game:GetFastFlag("InternationalNamesEnabledForAll") else true
end

return {
	FFlagIsExperimentEnabled = isExperimentEnabled,
	useIsExperimentEnabled = function(p1)
		-- upvalues: useUserExperiment (ref), internationalNamesIXPLayer (ref), isExperimentEnabled (ref)
		return useUserExperiment({ internationalNamesIXPLayer }, isExperimentEnabled, (p1 or { isExposureEnabled = false }).isExposureEnabled)
	end,
	logExposure = function()
		-- upvalues: IXPService (ref), internationalNamesIXPLayer (ref)
		IXPService:LogUserLayerExposure(internationalNamesIXPLayer)
	end
}