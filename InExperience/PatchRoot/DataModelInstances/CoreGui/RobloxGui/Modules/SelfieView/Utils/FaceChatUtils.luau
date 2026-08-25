local avatarChatService = game:GetService("AvatarChatService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local getCamMicPermissionsModule = require(robloxGui.Modules.Settings.getCamMicPermissions)
local corePackagesService = game:GetService("CorePackages")
local default = require(corePackagesService.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default
local getFFlagAvatarChatServiceEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled
local disableCameraOnSelfieViewForLowspecDevices = game:DefineFastFlag("DisableCameraOnSelfieViewForLowspecDevices", false)
local var5 = if disableCameraOnSelfieViewForLowspecDevices then require(robloxGui.Modules.Settings.isCamEnabledForUserAndPlace) else function()
	return true
end
local faceAnimatorService = game:GetService("FaceAnimatorService")
local var7 = nil

local var8 = function()
	-- upvalues: var7 (write), getFFlagAvatarChatServiceEnabled (ref), avatarChatService (ref), disableCameraOnSelfieViewForLowspecDevices (ref), var5 (write)
	if var7 ~= nil then
		return var7
	elseif not getFFlagAvatarChatServiceEnabled() or _G.__TESTEZ_RUNNING_TEST__ then
		return {
			placeCamEnabled = false,
			placeMicEnabled = false,
			userCamEnabled = false,
			userCamEligible = false,
			userMicEnabled = false,
			userMicEligible = false
		}
	end
	local ok, status = pcall(avatarChatService.GetClientFeaturesAsync, avatarChatService)
	
	if not ok then
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
	local t = {
		placeMicEnabled = avatarChatService:IsEnabled(status, Enum.AvatarChatServiceFeature.PlaceAudio),
		userMicEnabled = avatarChatService:IsEnabled(status, Enum.AvatarChatServiceFeature.UserAudio),
		userMicEligible = avatarChatService:IsEnabled(status, Enum.AvatarChatServiceFeature.UserAudioEligible),
		placeCamEnabled = avatarChatService:IsEnabled(status, Enum.AvatarChatServiceFeature.PlaceVideo),
		userCamEnabled = avatarChatService:IsEnabled(status, Enum.AvatarChatServiceFeature.UserVideo),
		userCamEligible = avatarChatService:IsEnabled(status, Enum.AvatarChatServiceFeature.UserVideoEligible)
	}
	
	if disableCameraOnSelfieViewForLowspecDevices and t.placeCamEnabled and (t.userCamEligible and t.userCamEnabled) and not var5() then
		t.userCamEnabled = false
	end
	var7 = t
	
	return t
end

local function getTrackerMode()
	-- upvalues: faceAnimatorService (ref)
	return if faceAnimatorService.AudioAnimationEnabled and not faceAnimatorService.VideoAnimationEnabled then Enum.TrackerMode.Audio elseif not (not faceAnimatorService.AudioAnimationEnabled and faceAnimatorService.VideoAnimationEnabled and faceAnimatorService:IsStarted()) then if faceAnimatorService.AudioAnimationEnabled and faceAnimatorService.VideoAnimationEnabled and faceAnimatorService:IsStarted() then Enum.TrackerMode.AudioVideo else Enum.TrackerMode.None else Enum.TrackerMode.Video
end

return {
	getPermissions = var8,
	toggleVideoAnimation = function()
		-- upvalues: faceAnimatorService (ref), disableCameraOnSelfieViewForLowspecDevices (ref), var8 (ref), getCamMicPermissionsModule (ref), default (ref)
		getCamMicPermissionsModule(function()
			-- upvalues: faceAnimatorService (copy), disableCameraOnSelfieViewForLowspecDevices (copy), var8 (copy)
			if not faceAnimatorService or not faceAnimatorService:IsStarted() then return end
			if not disableCameraOnSelfieViewForLowspecDevices or var8().userCamEnabled then
				faceAnimatorService.VideoAnimationEnabled = not faceAnimatorService.VideoAnimationEnabled
			end
		end, { default.Permissions.CAMERA_ACCESS })
	end,
	getTrackerMode = getTrackerMode,
	isCameraOn = function()
		-- upvalues: getTrackerMode (ref)
		local var11 = getTrackerMode()
		
		return if var11 ~= Enum.TrackerMode.AudioVideo then var11 == Enum.TrackerMode.Video else true
	end
}