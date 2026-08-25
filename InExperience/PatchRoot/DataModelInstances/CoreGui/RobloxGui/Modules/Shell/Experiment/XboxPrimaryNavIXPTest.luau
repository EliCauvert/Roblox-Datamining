local appUserLayers = require(game:GetService("CorePackages").Workspace.Packages.ExperimentLayers).AppUserLayers
local makeExperimentModule = require(script.Parent.makeExperiment)
local xboxPrimaryNavABIXPEnabled = game:DefineFastFlag("XboxPrimaryNavABIXPEnabled", false)
local xboxPrimaryNavABIXPEnrolledForAll = game:DefineFastFlag("XboxPrimaryNavABIXPEnrolledForAll", false)
local xboxPrimaryNavABIXPVariable = game:DefineFastString("XboxPrimaryNavABIXPVariable", "tenFootPrimaryNavEnabled")
local t = {}

return {
	isEnabled = function()
		-- upvalues: xboxPrimaryNavABIXPEnrolledForAll (ref), xboxPrimaryNavABIXPEnabled (ref)
		return xboxPrimaryNavABIXPEnrolledForAll or xboxPrimaryNavABIXPEnabled
	end,
	isEnrolledForAll = function()
		-- upvalues: xboxPrimaryNavABIXPEnrolledForAll (ref)
		return xboxPrimaryNavABIXPEnrolledForAll
	end,
	isUserEnrolled = function()
		-- upvalues: xboxPrimaryNavABIXPEnrolledForAll (ref), xboxPrimaryNavABIXPEnabled (ref), t (write), appUserLayers (ref), xboxPrimaryNavABIXPVariable (ref)
		return if xboxPrimaryNavABIXPEnrolledForAll then true elseif xboxPrimaryNavABIXPEnrolledForAll or xboxPrimaryNavABIXPEnabled then (t[appUserLayers.XboxClassicUILayer] or {})[xboxPrimaryNavABIXPVariable] or false else false
	end,
	layer = appUserLayers.XboxClassicUILayer,
	experiment = makeExperimentModule("OnUserLayerLoadingStatusChanged", "GetUserLayerLoadingStatus", "GetUserLayerVariables", "LogUserLayerExposure", "GetUserStatusForLayer"),
	setExperimentState = function(value)
		-- upvalues: t (write)
		t = value
	end
}