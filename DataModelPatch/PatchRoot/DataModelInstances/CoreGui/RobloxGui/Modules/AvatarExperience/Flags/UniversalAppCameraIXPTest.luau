local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
game:DefineFastFlag("UniversalAppCameraEnabled5", false)
local FFlagUniversalAppCameraEnabledForAllModule = require(Modules.AvatarExperience.Flags.FFlagUniversalAppCameraEnabledForAll)

return IxpUtilsModule.defineIXPTest({
	name = "CameraButton",
	recordExposure = false,
	getDependentFlagsEnabled = function()
		return game:GetEngineFeature("FacialAnimationStreaming2") and game:GetEngineFeature("VideoCaptureService")
	end,
	layer = game:DefineFastString("UniversalAppCameraIXPLayer", AppUserLayers.CameraButton),
	getEnabledFlag = function()
		return game:GetFastFlag("UniversalAppCameraEnabled5")
	end,
	getEnabledForAllFlag = function()
		-- upvalues: FFlagUniversalAppCameraEnabledForAllModule (copy)
		return FFlagUniversalAppCameraEnabledForAllModule
	end,
	variables = {
		EnabledForUser = function(p1, p2)
			local CameraButtonEnabled = p1.cameraButtonEnabled
			
			return p2 or CameraButtonEnabled
		end
	}
})