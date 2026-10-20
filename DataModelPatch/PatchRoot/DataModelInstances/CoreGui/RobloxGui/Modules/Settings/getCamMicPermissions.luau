local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local RunService = game:GetService("RunService")
local VideoCaptureService = game:GetService("VideoCaptureService")
local CryoModule = require(CorePackages.Packages.Cryo)
local Default = require(CorePackages.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default
local CameraDevicePermissionGrantedSignalModule = require(CoreGui.RobloxGui.Modules.Settings.cameraDevicePermissionGrantedSignal)
local MicrophoneDevicePermissionsLoggingModule = require(CoreGui.RobloxGui.Modules.Settings.Resources.MicrophoneDevicePermissionsLogging)
local PromiseModule = require(CorePackages.Packages.Promise)
local GetFFlagAvatarChatServiceEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled
local GetFFlagEnableAnalyticsForCameraDevicePermissionsModule = require(CoreGui:WaitForChild("RobloxGui").Modules.Flags.getFFlagEnableAnalyticsForCameraDevicePermissions)
local GetFFlagJoinWithoutMicPermissionsFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagJoinWithoutMicPermissions
local CheckCameraAvailabilityBeforePermissions = game:DefineFastFlag("CheckCameraAvailabilityBeforePermissions", false)
local DebugSkipVoicePermissionCheck = game:DefineFastFlag("DebugSkipVoicePermissionCheck", false)
local AvatarChatService = if GetFFlagAvatarChatServiceEnabledFunction() then game:GetService("AvatarChatService") else nil
local Flag = nil
local DidAuthorize = nil
local List = {}
local Flag1 = false

local function removePermissionsBasedOnUserSetting(p1, RemoveValueResult, p2)
	-- upvalues: CryoModule (copy), Default (copy), GetFFlagJoinWithoutMicPermissionsFunction (copy), DebugSkipVoicePermissionCheck (copy), CheckCameraAvailabilityBeforePermissions (copy), VideoCaptureService (copy)
	if not p1.isCameraEnabled and CryoModule.List.find(RemoveValueResult, Default.Permissions.CAMERA_ACCESS) then
		RemoveValueResult = CryoModule.List.removeValue(RemoveValueResult, Default.Permissions.CAMERA_ACCESS)
	end
	if GetFFlagJoinWithoutMicPermissionsFunction() then
		if not p1.isVoiceEnabled and CryoModule.List.find(RemoveValueResult, Default.Permissions.MICROPHONE_ACCESS) or p2 == nil then
			RemoveValueResult = CryoModule.List.removeValue(RemoveValueResult, Default.Permissions.MICROPHONE_ACCESS)
		end
	elseif not p1.isVoiceEnabled and CryoModule.List.find(RemoveValueResult, Default.Permissions.MICROPHONE_ACCESS) then
		RemoveValueResult = CryoModule.List.removeValue(RemoveValueResult, Default.Permissions.MICROPHONE_ACCESS)
	end
	if DebugSkipVoicePermissionCheck and CryoModule.List.find(RemoveValueResult, Default.Permissions.MICROPHONE_ACCESS) then
		RemoveValueResult = CryoModule.List.removeValue(RemoveValueResult, Default.Permissions.MICROPHONE_ACCESS)
	end
	if CheckCameraAvailabilityBeforePermissions and CryoModule.List.find(RemoveValueResult, Default.Permissions.CAMERA_ACCESS) and CryoModule.isEmpty((VideoCaptureService:GetCameraDevices())) then
		RemoveValueResult = CryoModule.List.removeValue(RemoveValueResult, Default.Permissions.CAMERA_ACCESS)
	end
	return RemoveValueResult
end

local function requestPermissions(p1, Callback: (any) -> (), Callback1: () -> (), RemoveValueResult, Enabled, UiContext)
	-- upvalues: CryoModule (copy), Default (copy), removePermissionsBasedOnUserSetting (copy), Flag1 (ref), PromiseModule (copy), MicrophoneDevicePermissionsLoggingModule (copy), Flag (ref), DidAuthorize (ref), CameraDevicePermissionGrantedSignalModule (copy), GetFFlagEnableAnalyticsForCameraDevicePermissionsModule (copy), RunService (copy), RbxAnalyticsService (copy)
	local HasFindResult = CryoModule.List.find(RemoveValueResult, Default.Permissions.CAMERA_ACCESS) ~= nil
	local HasFindResult1 = CryoModule.List.find(RemoveValueResult, Default.Permissions.MICROPHONE_ACCESS) ~= nil
	local RemovePermissionsBasedOnUserSettingResult = removePermissionsBasedOnUserSetting(p1, RemoveValueResult, Enabled)
	local HasFindResult2 = CryoModule.List.find(RemovePermissionsBasedOnUserSettingResult, Default.Permissions.CAMERA_ACCESS) ~= nil
	local HasFindResult3 = CryoModule.List.find(RemovePermissionsBasedOnUserSettingResult, Default.Permissions.MICROPHONE_ACCESS) ~= nil
	
	if RemovePermissionsBasedOnUserSettingResult and #RemovePermissionsBasedOnUserSettingResult > 0 then
		return if Enabled == true then PromiseModule.new(function(Callback2: (any) -> (), _)
			-- upvalues: RemovePermissionsBasedOnUserSettingResult (copy), Default (upval), Callback (copy), Flag1 (upval), Callback1 (copy)
			local t = {}
			
			for _, value in ipairs(RemovePermissionsBasedOnUserSettingResult) do
				local v1, v2 = Default:hasPermissions({ value }):await()
				
				if v1 then
					t[value] = v2.status == Default.Status.AUTHORIZED
				else
					t[value] = false
				end
			end
			Callback({
				hasCameraPermissions = t[Default.Permissions.CAMERA_ACCESS] or false,
				hasMicPermissions = t[Default.Permissions.MICROPHONE_ACCESS] or false
			})
			Flag1 = false
			Callback1()
			Callback2(t)
		end) else Default:hasPermissions(RemovePermissionsBasedOnUserSettingResult):andThen(function(Result)
			-- upvalues: Default (upval), HasFindResult2 (copy), HasFindResult3 (copy), Callback (copy), Flag1 (upval), Callback1 (copy), UiContext (copy), MicrophoneDevicePermissionsLoggingModule (upval), RemovePermissionsBasedOnUserSettingResult (copy), CryoModule (upval), Flag (upval), HasFindResult (copy), DidAuthorize (upval), HasFindResult1 (copy), CameraDevicePermissionGrantedSignalModule (upval), GetFFlagEnableAnalyticsForCameraDevicePermissionsModule (upval), RunService (upval), RbxAnalyticsService (upval)
			if Result.status == Default.Status.AUTHORIZED then
				Callback({
					hasCameraPermissions = HasFindResult2,
					hasMicPermissions = HasFindResult3
				})
				Flag1 = false
				Callback1()
				
				return Result
			else
				if HasFindResult3 and UiContext then
					MicrophoneDevicePermissionsLoggingModule:logPromptImpression({ didAuthorize = false, uiContext = UiContext })
				end
				return Default:requestPermissions(RemovePermissionsBasedOnUserSettingResult):andThen(function(Result)
					-- upvalues: HasFindResult2 (upval), Default (upval), CryoModule (upval), HasFindResult3 (upval), Flag (upval), HasFindResult (upval), DidAuthorize (upval), HasFindResult1 (upval), CameraDevicePermissionGrantedSignalModule (upval), GetFFlagEnableAnalyticsForCameraDevicePermissionsModule (upval), RunService (upval), RbxAnalyticsService (upval), UiContext (upval), MicrophoneDevicePermissionsLoggingModule (upval), Callback (upval), Flag1 (upval), Callback1 (upval)
					if typeof(Result) == "table" then
						local IsStatusMatch: boolean = HasFindResult2 and (Result.status == Default.Status.AUTHORIZED or not CryoModule.List.find(Result.missingPermissions, Default.Permissions.CAMERA_ACCESS))
						local IsStatusMatch1: boolean = HasFindResult3 and (Result.status == Default.Status.AUTHORIZED or not CryoModule.List.find(Result.missingPermissions, Default.Permissions.MICROPHONE_ACCESS))
						Flag = if HasFindResult then IsStatusMatch else nil
						DidAuthorize = if HasFindResult1 then IsStatusMatch1 else nil
						
						if Flag then
							CameraDevicePermissionGrantedSignalModule:fire()
						end
					elseif Result == Default.Status.AUTHORIZED then
						CameraDevicePermissionGrantedSignalModule:fire()
						Flag = HasFindResult2
						DidAuthorize = HasFindResult3
					else
						Flag = false
						DidAuthorize = false
					end
					local config = {
						hasCameraPermissions = Flag or false,
						hasMicPermissions = DidAuthorize or false
					}
					
					if GetFFlagEnableAnalyticsForCameraDevicePermissionsModule() and HasFindResult2 then
						RbxAnalyticsService:SendEventDeferred(if RunService:IsStudio() then "studio" else "client", "avatarChat", "CameraDevicePermissionPrompted", { didAuthorize = Flag or false })
					end
					if HasFindResult3 and UiContext then
						MicrophoneDevicePermissionsLoggingModule:logPromptInteraction({ didAuthorize = DidAuthorize, uiContext = UiContext })
					end
					Callback(config)
					Flag1 = false
					Callback1()
					
					return Result
				end)
			end
		end)
	else
		Callback({ hasCameraPermissions = false, hasMicPermissions = false })
		Flag1 = false
		Callback1()
	end
end

local function tryGetCachedResults(CAMERAACCESSes)
	-- upvalues: DebugSkipVoicePermissionCheck (copy), DidAuthorize (ref), Flag (ref), Default (copy)
	if DebugSkipVoicePermissionCheck then
		DidAuthorize = true
	end
	if Flag == nil or DidAuthorize == nil then
		return nil
	end
	local Flag1 = false
	
	for _, cAMERAACCESS in CAMERAACCESSes do
		if cAMERAACCESS ~= Default.Permissions.MICROPHONE_ACCESS and cAMERAACCESS ~= Default.Permissions.CAMERA_ACCESS then
			Flag1 = true
		end
	end
	return if Flag1 then nil else {
		hasCameraPermissions = Flag or false,
		hasMicPermissions = DidAuthorize or false
	}
end

local function getCamMicPermissions(Callback: (any) -> (), PermissionsToRequest, ShouldNotRequestPerms, Context, GetRawPermission)
	-- upvalues: Default (copy), List (copy), getCamMicPermissions (copy), tryGetCachedResults (copy), Flag1 (ref), GetFFlagAvatarChatServiceEnabledFunction (copy), PromiseModule (copy), AvatarChatService (copy), requestPermissions (copy)
	local PermissionsToRequest1 = {}
	PermissionsToRequest1 = if PermissionsToRequest then PermissionsToRequest else {
		Default.Permissions.MICROPHONE_ACCESS,
		Default.Permissions.CAMERA_ACCESS
	}
	
	local function invokeNextRequest()
		-- upvalues: List (upval), getCamMicPermissions (upval)
		if List[1] then
			local Entry = List[1]
			table.remove(List, 1)
			getCamMicPermissions(Entry.callback, Entry.permissionsToRequest, Entry.shouldNotRequestPerms, Entry.context, Entry.getRawPermission)
		end
	end
	
	if not GetRawPermission then
		local TryGetCachedResultsResult = tryGetCachedResults(PermissionsToRequest1)
		
		if TryGetCachedResultsResult then
			Callback(TryGetCachedResultsResult)
			
			if List[1] then
				local Entry = List[1]
				table.remove(List, 1)
				getCamMicPermissions(Entry.callback, Entry.permissionsToRequest, Entry.shouldNotRequestPerms, Entry.context, Entry.getRawPermission)
			end
			return
		end
	end
	if Flag1 then
		table.insert(List, {
			callback = Callback,
			permissionsToRequest = PermissionsToRequest,
			shouldNotRequestPerms = ShouldNotRequestPerms,
			context = Context,
			getRawPermission = GetRawPermission
		})
		
		return
	end
	Flag1 = true
	
	return if GetRawPermission then Default:hasPermissions(PermissionsToRequest1):andThen(function(Result)
		-- upvalues: Callback (copy), Flag1 (upval), List (upval), getCamMicPermissions (upval)
		Callback(Result)
		Flag1 = false
		
		if List[1] then
			local Entry = List[1]
			table.remove(List, 1)
			getCamMicPermissions(Entry.callback, Entry.permissionsToRequest, Entry.shouldNotRequestPerms, Entry.context, Entry.getRawPermission)
		end
	end) elseif GetFFlagAvatarChatServiceEnabledFunction() then PromiseModule.new(function(Callback: (any) -> (), _)
		-- upvalues: AvatarChatService (upval)
		if AvatarChatService.ClientFeaturesInitialized then
			Callback({
				isVoiceEnabled = AvatarChatService:IsEnabled(AvatarChatService.ClientFeatures, Enum.AvatarChatServiceFeature.UserAudio),
				isCameraEnabled = AvatarChatService:IsEnabled(AvatarChatService.ClientFeatures, Enum.AvatarChatServiceFeature.UserVideo)
			})
			
			return
		else
			local Connection = nil
			Connection = AvatarChatService:GetPropertyChangedSignal("ClientFeatures"):Connect(function()
				-- upvalues: Connection (ref), AvatarChatService (upval), Callback (copy)
				Connection:Disconnect()
				Callback({
					isVoiceEnabled = AvatarChatService:IsEnabled(AvatarChatService.ClientFeatures, Enum.AvatarChatServiceFeature.UserAudio),
					isCameraEnabled = AvatarChatService:IsEnabled(AvatarChatService.ClientFeatures, Enum.AvatarChatServiceFeature.UserVideo)
				})
			end)
		end
	end):andThen(function(Result)
		-- upvalues: requestPermissions (upval), Callback (copy), invokeNextRequest (copy), PermissionsToRequest1 (ref), ShouldNotRequestPerms (copy), Context (copy)
		requestPermissions(Result, Callback, invokeNextRequest, PermissionsToRequest1, ShouldNotRequestPerms, Context)
	end) else PromiseModule.new(function(Callback: (any) -> (), _)
		Callback({ isVoiceEnabled = false, isCameraEnabled = false })
	end)
end

return getCamMicPermissions