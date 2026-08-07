local avatarChatService = game:GetService("AvatarChatService")
local coreGuiService = game:GetService("CoreGui")
local videoCaptureService = game:GetService("VideoCaptureService")
local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local getFFlagAvatarChatServiceEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled
local getFFlagUseCameraDevicesListenerModule = require(robloxGui.Modules.Flags.getFFlagUseCameraDevicesListener)
local cameraDevicesHelperModule = require(robloxGui.Modules.Settings.cameraDevicesHelper)

return function() --[[ line: 14 ]]
	-- upvalues: getFFlagAvatarChatServiceEnabled (ref), avatarChatService (ref), getFFlagUseCameraDevicesListenerModule (ref), cameraDevicesHelperModule (ref), videoCaptureService (ref), cryoModule (ref)
	if not getFFlagAvatarChatServiceEnabled() then
		return false
	end
	local ok, status = pcall(avatarChatService.GetClientFeaturesAsync, avatarChatService)
	
	if not ok then
		warn("Unable to get Client Features from AvatarChatService")
		
		return false
	end
	return if cryoModule.isEmpty(if getFFlagUseCameraDevicesListenerModule() then cameraDevicesHelperModule.GetDevices() else videoCaptureService:GetCameraDevices()) then false elseif avatarChatService:IsEnabled(status, Enum.AvatarChatServiceFeature.PlaceVideo) then if avatarChatService:IsEnabled(status, Enum.AvatarChatServiceFeature.PlaceAudio) and (avatarChatService:IsEnabled(status, Enum.AvatarChatServiceFeature.UserAudio) and avatarChatService:IsEnabled(status, Enum.AvatarChatServiceFeature.UserAudioEligible)) then false else avatarChatService:IsEnabled(status, Enum.AvatarChatServiceFeature.UserVideo) and avatarChatService:IsEnabled(status, Enum.AvatarChatServiceFeature.UserVideoEligible) else false
end