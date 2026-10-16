local AvatarChatService = game:GetService("AvatarChatService")
local AppStorageService = game:GetService("AppStorageService")
local CorePackages = game:GetService("CorePackages")
local VideoCaptureService = game:GetService("VideoCaptureService")
local CryoModule = require(CorePackages.Packages.Cryo)
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local IXPService = game:GetService("IXPService")
local MemStorageService = game:GetService("MemStorageService")
local GetFFlagAvatarChatServiceEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled
local GetFFlagUseCameraDevicesListenerModule = require(RobloxGui.Modules.Flags.getFFlagUseCameraDevicesListener)
local CameraDevicesHelperModule = require(RobloxGui.Modules.Settings.cameraDevicesHelper)
local TrackerMenuModule = require(RobloxGui.Modules.Tracker.TrackerMenu)
local TrackerPromptTypeModule = require(RobloxGui.Modules.Tracker.TrackerPromptType)
local DisableCameraOnLowSpecDevices2 = game:DefineFastFlag("DisableCameraOnLowSpecDevices2", false)
local DisableCameraOnLowSpecDevicesIXPLayer = game:DefineFastString("DisableCameraOnLowSpecDevicesIXPLayer", "AvatarChat.DisableOnLowSpecAndroid")
local DisableCameraOnLowSpecDevicesIXPField = game:DefineFastString("DisableCameraOnLowSpecDevicesIXPField", "DisableOnAndroid")
local OnlyShowToastOnce2 = game:DefineFastFlag("OnlyShowToastOnce2", false)
local DebugAlwaysShowDisableCameraToast = game:DefineFastFlag("DebugAlwaysShowDisableCameraToast", false)
local OnlyShowToastOnceInLifetime2 = game:DefineFastFlag("OnlyShowToastOnceInLifetime2", false)
local DisableCameraToastShownStorageKeyEngineFeature = game:GetEngineFeature("DisableCameraToastShownStorageKey")

local function ShouldCheckDeviceSpecs() --[[ Line: 28 ]]
	-- upvalues: DisableCameraOnLowSpecDevices2 (copy), IXPService (copy), DisableCameraOnLowSpecDevicesIXPLayer (copy), DisableCameraOnLowSpecDevicesIXPField (copy)
	if not DisableCameraOnLowSpecDevices2 then
		return false
	end
	local Success, Result = pcall(function() --[[ Line: 31 ]]
		-- upvalues: IXPService (upval), DisableCameraOnLowSpecDevicesIXPLayer (upval)
		return IXPService:GetUserLayerVariables(DisableCameraOnLowSpecDevicesIXPLayer)
	end)
	
	if Success and Result and Result[DisableCameraOnLowSpecDevicesIXPField] ~= nil then
		IXPService:LogUserLayerExposure(DisableCameraOnLowSpecDevicesIXPLayer)
		
		return Result[DisableCameraOnLowSpecDevicesIXPField]
	else
		return false
	end
end

return function(): boolean --[[ Line: 46 ]]
	-- upvalues: GetFFlagAvatarChatServiceEnabledFunction (copy), AvatarChatService (copy), DisableCameraOnLowSpecDevices2 (copy), ShouldCheckDeviceSpecs (copy), OnlyShowToastOnceInLifetime2 (copy), DisableCameraToastShownStorageKeyEngineFeature (copy), AppStorageService (copy), DebugAlwaysShowDisableCameraToast (copy), TrackerMenuModule (copy), TrackerPromptTypeModule (copy), OnlyShowToastOnce2 (copy), MemStorageService (copy), GetFFlagUseCameraDevicesListenerModule (copy), CameraDevicesHelperModule (copy), VideoCaptureService (copy), CryoModule (copy)
	if not GetFFlagAvatarChatServiceEnabledFunction() or _G.__TESTEZ_RUNNING_TEST__ then
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
	
	if not DisableCameraOnLowSpecDevices2 or not IsEnabled or not IsEnabled1 or not IsEnabled2 or AvatarChatService:deviceMeetsRequirementsForFeature(Enum.DeviceFeatureType.DeviceCapture) or not ShouldCheckDeviceSpecs() then
		local Inverted = not CryoModule.isEmpty(if GetFFlagUseCameraDevicesListenerModule() then CameraDevicesHelperModule.GetDevices() else VideoCaptureService:GetCameraDevices())
		
		return IsEnabled and (IsEnabled2 and (IsEnabled1 and Inverted))
	end
	if OnlyShowToastOnceInLifetime2 and DisableCameraToastShownStorageKeyEngineFeature then
		local Success1, Result1 = pcall(function() --[[ Line: 68 ]]
			-- upvalues: AppStorageService (upval)
			return AppStorageService:GetItem("DisableCameraToastShown")
		end)
		
		if not Success1 or (not (Result1 == "true") or DebugAlwaysShowDisableCameraToast) then
			TrackerMenuModule:showPrompt(TrackerPromptTypeModule.CameraUnavailable)
			pcall(function() --[[ Line: 77 ]]
				-- upvalues: AppStorageService (upval)
				AppStorageService:SetItem("DisableCameraToastShown", "true")
				AppStorageService:Flush()
			end)
		end
	elseif OnlyShowToastOnce2 then
		if not (MemStorageService:GetItem("DisableCameraToastShown") == "true") or DebugAlwaysShowDisableCameraToast then
			TrackerMenuModule:showPrompt(TrackerPromptTypeModule.CameraUnavailable)
			MemStorageService:SetItem("DisableCameraToastShown", "true")
		end
	else
		TrackerMenuModule:showPrompt(TrackerPromptTypeModule.CameraUnavailable)
	end
	return false
end