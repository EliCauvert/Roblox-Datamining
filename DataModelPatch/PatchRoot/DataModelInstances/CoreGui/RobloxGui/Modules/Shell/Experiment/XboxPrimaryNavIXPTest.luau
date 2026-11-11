local AppUserLayers = require(game:GetService("CorePackages").Workspace.Packages.ExperimentLayers).AppUserLayers
local XboxPrimaryNavABIXPEnabled = game:DefineFastFlag("XboxPrimaryNavABIXPEnabled", false)
local XboxPrimaryNavABIXPEnrolledForAll = game:DefineFastFlag("XboxPrimaryNavABIXPEnrolledForAll", false)
local XboxPrimaryNavABIXPVariable = game:DefineFastString("XboxPrimaryNavABIXPVariable", "tenFootPrimaryNavEnabled")
local ExperimentState = {}

return {
	isEnabled = function()
		-- upvalues: XboxPrimaryNavABIXPEnrolledForAll (copy), XboxPrimaryNavABIXPEnabled (copy)
		return XboxPrimaryNavABIXPEnrolledForAll or XboxPrimaryNavABIXPEnabled
	end,
	isEnrolledForAll = function()
		-- upvalues: XboxPrimaryNavABIXPEnrolledForAll (copy)
		return XboxPrimaryNavABIXPEnrolledForAll
	end,
	isUserEnrolled = function()
		-- upvalues: XboxPrimaryNavABIXPEnrolledForAll (copy), XboxPrimaryNavABIXPEnabled (copy), ExperimentState (ref), AppUserLayers (copy), XboxPrimaryNavABIXPVariable (copy)
		return if XboxPrimaryNavABIXPEnrolledForAll then true else (XboxPrimaryNavABIXPEnrolledForAll or XboxPrimaryNavABIXPEnabled) and (ExperimentState[AppUserLayers.XboxClassicUILayer] or {})[XboxPrimaryNavABIXPVariable] or false
	end,
	layer = AppUserLayers.XboxClassicUILayer,
	experiment = require(script.Parent.makeExperiment)("OnUserLayerLoadingStatusChanged", "GetUserLayerLoadingStatus", "GetUserLayerVariables", "LogUserLayerExposure", "GetUserStatusForLayer"),
	setExperimentState = function(Value)
		-- upvalues: ExperimentState (ref)
		ExperimentState = Value
	end
}