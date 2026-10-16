local AvatarChatService = game:GetService("AvatarChatService")
local VideoCaptureService = game:GetService("VideoCaptureService")
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local GetFFlagAvatarChatServiceEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled
local GetFFlagUseCameraDevicesListenerModule = require(RobloxGui.Modules.Flags.getFFlagUseCameraDevicesListener)
local CameraDevicesHelperModule = require(RobloxGui.Modules.Settings.cameraDevicesHelper)

return function(): boolean --[[ Line: 14 ]]
	-- upvalues: GetFFlagAvatarChatServiceEnabledFunction (copy), AvatarChatService (copy), GetFFlagUseCameraDevicesListenerModule (copy), CameraDevicesHelperModule (copy), VideoCaptureService (copy), CryoModule (copy)
	if not GetFFlagAvatarChatServiceEnabledFunction() then
		return false
	end
	local Success, Result = pcall(AvatarChatService.GetClientFeaturesAsync, AvatarChatService)
	
	if not Success then
		warn("Unable to get Client Features from AvatarChatService")
		
		return false
	end
	local IsEnabled = AvatarChatService:IsEnabled(Result, Enum.AvatarChatServiceFeature.PlaceVideo)
	local IsEnabled1 = AvatarChatService:IsEnabled(Result, Enum.AvatarChatServiceFeature.UserVideo)
	local IsEnabled2 = AvatarChatService:IsEnabled(Result, Enum.AvatarChatServiceFeature.UserVideoEligible)
	local IsEnabled3 = AvatarChatService:IsEnabled(Result, Enum.AvatarChatServiceFeature.PlaceAudio)
	local IsEnabled4 = AvatarChatService:IsEnabled(Result, Enum.AvatarChatServiceFeature.UserAudio)
	local IsEnabled5 = AvatarChatService:IsEnabled(Result, Enum.AvatarChatServiceFeature.UserAudioEligible)
	
	if CryoModule.isEmpty(if GetFFlagUseCameraDevicesListenerModule() then CameraDevicesHelperModule.GetDevices() else VideoCaptureService:GetCameraDevices()) then
		return false
	else
		local IsEnabled5_1 = IsEnabled4 and IsEnabled5
		local IsEnabled2_1 = IsEnabled1 and IsEnabled2
		
		return if IsEnabled then (not IsEnabled3 or not IsEnabled5_1) and (if IsEnabled2_1 then true else false) else false
	end
end