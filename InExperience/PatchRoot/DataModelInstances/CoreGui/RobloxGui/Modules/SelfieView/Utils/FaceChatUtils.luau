local AvatarChatService = game:GetService("AvatarChatService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local GetCamMicPermissionsModule = require(RobloxGui.Modules.Settings.getCamMicPermissions)
local CorePackages = game:GetService("CorePackages")
local Default = require(CorePackages.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default
local GetFFlagAvatarChatServiceEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled
local DisableCameraOnSelfieViewForLowspecDevices = game:DefineFastFlag("DisableCameraOnSelfieViewForLowspecDevices", false)
local IsCamEnabledForUserAndPlaceModule = if DisableCameraOnSelfieViewForLowspecDevices then require(RobloxGui.Modules.Settings.isCamEnabledForUserAndPlace) else function(): boolean --[[ Line: 14 ]]
	return true
end
local FaceAnimatorService = game:GetService("FaceAnimatorService")
local v1 = nil

local function GetPermissions() --[[ Line: 34 ]]
	-- upvalues: v1 (ref), GetFFlagAvatarChatServiceEnabledFunction (copy), AvatarChatService (copy), DisableCameraOnSelfieViewForLowspecDevices (copy), IsCamEnabledForUserAndPlaceModule (ref)
	if v1 ~= nil then
		return v1
	end
	if not GetFFlagAvatarChatServiceEnabledFunction() or _G.__TESTEZ_RUNNING_TEST__ then
		return {
			placeCamEnabled = false,
			placeMicEnabled = false,
			userCamEnabled = false,
			userCamEligible = false,
			userMicEnabled = false,
			userMicEligible = false
		}
	end
	local Success, Result = pcall(AvatarChatService.GetClientFeaturesAsync, AvatarChatService)
	
	if not Success then
		warn("Unable to get Client Features from AvatarChatService")
		
		return {
			placeCamEnabled = false,
			placeMicEnabled = false,
			userCamEnabled = false,
			userCamEligible = false,
			userMicEnabled = false,
			userMicEligible = false
		}
	end
	local config = {
		placeMicEnabled = AvatarChatService:IsEnabled(Result, Enum.AvatarChatServiceFeature.PlaceAudio),
		userMicEnabled = AvatarChatService:IsEnabled(Result, Enum.AvatarChatServiceFeature.UserAudio),
		userMicEligible = AvatarChatService:IsEnabled(Result, Enum.AvatarChatServiceFeature.UserAudioEligible),
		placeCamEnabled = AvatarChatService:IsEnabled(Result, Enum.AvatarChatServiceFeature.PlaceVideo),
		userCamEnabled = AvatarChatService:IsEnabled(Result, Enum.AvatarChatServiceFeature.UserVideo),
		userCamEligible = AvatarChatService:IsEnabled(Result, Enum.AvatarChatServiceFeature.UserVideoEligible)
	}
	
	if DisableCameraOnSelfieViewForLowspecDevices and config.placeCamEnabled and config.userCamEligible and config.userCamEnabled and not IsCamEnabledForUserAndPlaceModule() then
		config.userCamEnabled = false
	end
	v1 = config
	
	return config
end

local function getTrackerMode() --[[ Line: 101 ]]
	-- upvalues: FaceAnimatorService (copy)
	return if FaceAnimatorService.AudioAnimationEnabled and not FaceAnimatorService.VideoAnimationEnabled then Enum.TrackerMode.Audio elseif FaceAnimatorService.AudioAnimationEnabled or not FaceAnimatorService.VideoAnimationEnabled or not FaceAnimatorService:IsStarted() then if FaceAnimatorService.AudioAnimationEnabled and FaceAnimatorService.VideoAnimationEnabled and FaceAnimatorService:IsStarted() then Enum.TrackerMode.AudioVideo else Enum.TrackerMode.None else Enum.TrackerMode.Video
end

return {
	getPermissions = GetPermissions,
	toggleVideoAnimation = function() --[[ Line: 87 ]]
		-- upvalues: FaceAnimatorService (copy), DisableCameraOnSelfieViewForLowspecDevices (copy), GetPermissions (copy), GetCamMicPermissionsModule (copy), Default (copy)
		GetCamMicPermissionsModule(function() --[[ Line: 88 ]]
			-- upvalues: FaceAnimatorService (upval), DisableCameraOnSelfieViewForLowspecDevices (upval), GetPermissions (upval)
			if not FaceAnimatorService or not FaceAnimatorService:IsStarted() then return end
			if not DisableCameraOnSelfieViewForLowspecDevices or GetPermissions().userCamEnabled then
				FaceAnimatorService.VideoAnimationEnabled = not FaceAnimatorService.VideoAnimationEnabled
			end
		end, { Default.Permissions.CAMERA_ACCESS })
	end,
	getTrackerMode = getTrackerMode,
	isCameraOn = function(): boolean --[[ Line: 121 ]]
		-- upvalues: getTrackerMode (copy)
		local TrackerMode = getTrackerMode()
		
		return TrackerMode == Enum.TrackerMode.AudioVideo or TrackerMode == Enum.TrackerMode.Video
	end
}