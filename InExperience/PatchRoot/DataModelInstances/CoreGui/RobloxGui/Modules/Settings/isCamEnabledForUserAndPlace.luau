local avatarChatService = game:GetService("AvatarChatService")
local appStorageService = game:GetService("AppStorageService")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local videoCaptureService = game:GetService("VideoCaptureService")
local cryoModule = require(corePackagesService.Packages.Cryo)
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local IXPService = game:GetService("IXPService")
local memStorageService = game:GetService("MemStorageService")
local getFFlagAvatarChatServiceEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled
local getFFlagUseCameraDevicesListenerModule = require(robloxGui.Modules.Flags.getFFlagUseCameraDevicesListener)
local cameraDevicesHelperModule = require(robloxGui.Modules.Settings.cameraDevicesHelper)
local trackerMenuModule = require(robloxGui.Modules.Tracker.TrackerMenu)
local trackerPromptTypeModule = require(robloxGui.Modules.Tracker.TrackerPromptType)
local disableCameraOnLowSpecDevices2 = game:DefineFastFlag("DisableCameraOnLowSpecDevices2", false)
local disableCameraOnLowSpecDevicesIXPLayer = game:DefineFastString("DisableCameraOnLowSpecDevicesIXPLayer", "AvatarChat.DisableOnLowSpecAndroid")
local disableCameraOnLowSpecDevicesIXPField = game:DefineFastString("DisableCameraOnLowSpecDevicesIXPField", "DisableOnAndroid")
local onlyShowToastOnce2 = game:DefineFastFlag("OnlyShowToastOnce2", false)
local debugAlwaysShowDisableCameraToast = game:DefineFastFlag("DebugAlwaysShowDisableCameraToast", false)
local onlyShowToastOnceInLifetime2 = game:DefineFastFlag("OnlyShowToastOnceInLifetime2", false)
local disableCameraToastShownStorageKeyEngineFeature = game:GetEngineFeature("DisableCameraToastShownStorageKey")

local function ShouldCheckDeviceSpecs() --[[ line: 28 ]]
	-- upvalues: disableCameraOnLowSpecDevices2 (ref), IXPService (ref), disableCameraOnLowSpecDevicesIXPLayer (ref), disableCameraOnLowSpecDevicesIXPField (ref)
	if not disableCameraOnLowSpecDevices2 then
		return false
	end
	local ok, status = pcall(function() --[[ line: 31 ]]
		-- upvalues: IXPService (copy), disableCameraOnLowSpecDevicesIXPLayer (copy)
		return IXPService:GetUserLayerVariables(disableCameraOnLowSpecDevicesIXPLayer)
	end)
	
	if ok and status and status[disableCameraOnLowSpecDevicesIXPField] ~= nil then
		IXPService:LogUserLayerExposure(disableCameraOnLowSpecDevicesIXPLayer)
		
		return status[disableCameraOnLowSpecDevicesIXPField]
	end
	return false
end

return function() --[[ line: 46 ]]
	-- upvalues: getFFlagAvatarChatServiceEnabled (ref), avatarChatService (ref), disableCameraOnLowSpecDevices2 (ref), ShouldCheckDeviceSpecs (ref), onlyShowToastOnceInLifetime2 (ref), disableCameraToastShownStorageKeyEngineFeature (ref), appStorageService (ref), debugAlwaysShowDisableCameraToast (ref), trackerMenuModule (ref), trackerPromptTypeModule (ref), onlyShowToastOnce2 (ref), memStorageService (ref), getFFlagUseCameraDevicesListenerModule (ref), cameraDevicesHelperModule (ref), videoCaptureService (ref), cryoModule (ref)
	if not getFFlagAvatarChatServiceEnabled() or _G.__TESTEZ_RUNNING_TEST__ then
		return false
	end
	local ok, status = pcall(avatarChatService.GetClientFeaturesAsync, avatarChatService)
	
	if not ok then
		warn("Unable to get Client Features from AvatarChatService")
		
		return false
	end
	local var21 = avatarChatService:IsEnabled(status, Enum.AvatarChatServiceFeature.PlaceVideo)
	local var22 = avatarChatService:IsEnabled(status, Enum.AvatarChatServiceFeature.UserVideo)
	local var23 = avatarChatService:IsEnabled(status, Enum.AvatarChatServiceFeature.UserVideoEligible)
	
	if not disableCameraOnLowSpecDevices2 or not var21 or (not var22 or not var23) or (avatarChatService:deviceMeetsRequirementsForFeature(Enum.DeviceFeatureType.DeviceCapture) or not ShouldCheckDeviceSpecs()) then
		return var21 and (var23 and (var22 and not cryoModule.isEmpty(if getFFlagUseCameraDevicesListenerModule() then cameraDevicesHelperModule.GetDevices() else videoCaptureService:GetCameraDevices())))
	elseif onlyShowToastOnceInLifetime2 and disableCameraToastShownStorageKeyEngineFeature then
		local ok_1, status_1 = pcall(function() --[[ line: 68 ]]
			-- upvalues: appStorageService (copy)
			return appStorageService:GetItem("DisableCameraToastShown")
		end)
		
		if not ok_1 or (not (status_1 == "true") or debugAlwaysShowDisableCameraToast) then
			trackerMenuModule:showPrompt(trackerPromptTypeModule.CameraUnavailable)
			pcall(function() --[[ line: 77 ]]
				-- upvalues: appStorageService (copy)
				appStorageService:SetItem("DisableCameraToastShown", "true")
				appStorageService:Flush()
			end)
		end
	elseif not onlyShowToastOnce2 then
		trackerMenuModule:showPrompt(trackerPromptTypeModule.CameraUnavailable)
	elseif not (memStorageService:GetItem("DisableCameraToastShown") == "true") or debugAlwaysShowDisableCameraToast then
		trackerMenuModule:showPrompt(trackerPromptTypeModule.CameraUnavailable)
		memStorageService:SetItem("DisableCameraToastShown", "true")
	end
	return false
end