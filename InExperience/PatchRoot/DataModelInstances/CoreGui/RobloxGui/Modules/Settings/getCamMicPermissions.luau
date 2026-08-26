local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local runService = game:GetService("RunService")
local videoCaptureService = game:GetService("VideoCaptureService")
local cryoModule = require(corePackagesService.Packages.Cryo)
local default = require(corePackagesService.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default
local cameraDevicePermissionGrantedSignalModule = require(coreGuiService.RobloxGui.Modules.Settings.cameraDevicePermissionGrantedSignal)
local microphoneDevicePermissionsLoggingModule = require(coreGuiService.RobloxGui.Modules.Settings.Resources.MicrophoneDevicePermissionsLogging)
local promiseModule = require(corePackagesService.Packages.Promise)
local getFFlagAvatarChatServiceEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled
local getFFlagEnableAnalyticsForCameraDevicePermissionsModule = require(coreGuiService:WaitForChild("RobloxGui").Modules.Flags.getFFlagEnableAnalyticsForCameraDevicePermissions)
local getFFlagJoinWithoutMicPermissions = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagJoinWithoutMicPermissions
local checkCameraAvailabilityBeforePermissions = game:DefineFastFlag("CheckCameraAvailabilityBeforePermissions", false)
local debugSkipVoicePermissionCheck = game:DefineFastFlag("DebugSkipVoicePermissionCheck", false)
local var1 = if getFFlagAvatarChatServiceEnabled() then game:GetService("AvatarChatService") else nil
local var2 = nil
local var3 = nil
local t = {}
local var4 = false

local function removePermissionsBasedOnUserSetting(value, p1, p2)
	-- upvalues: cryoModule (ref), default (ref), getFFlagJoinWithoutMicPermissions (ref), debugSkipVoicePermissionCheck (ref), checkCameraAvailabilityBeforePermissions (ref), videoCaptureService (ref)
	if not value.isCameraEnabled and cryoModule.List.find(p1, default.Permissions.CAMERA_ACCESS) then
		p1 = cryoModule.List.removeValue(p1, default.Permissions.CAMERA_ACCESS)
	end
	if getFFlagJoinWithoutMicPermissions() then
		if not value.isVoiceEnabled and cryoModule.List.find(p1, default.Permissions.MICROPHONE_ACCESS) or p2 == nil then
			p1 = cryoModule.List.removeValue(p1, default.Permissions.MICROPHONE_ACCESS)
		end
	elseif not value.isVoiceEnabled and cryoModule.List.find(p1, default.Permissions.MICROPHONE_ACCESS) then
		p1 = cryoModule.List.removeValue(p1, default.Permissions.MICROPHONE_ACCESS)
	end
	if debugSkipVoicePermissionCheck and cryoModule.List.find(p1, default.Permissions.MICROPHONE_ACCESS) then
		p1 = cryoModule.List.removeValue(p1, default.Permissions.MICROPHONE_ACCESS)
	end
	if checkCameraAvailabilityBeforePermissions and cryoModule.List.find(p1, default.Permissions.CAMERA_ACCESS) and cryoModule.isEmpty(videoCaptureService:GetCameraDevices()) then
		p1 = cryoModule.List.removeValue(p1, default.Permissions.CAMERA_ACCESS)
	end
	return p1
end

local function requestPermissions(p1, p2, p3, p4, p5, p6)
	-- upvalues: cryoModule (ref), default (ref), removePermissionsBasedOnUserSetting (ref), var4 (write), promiseModule (ref), microphoneDevicePermissionsLoggingModule (ref), var2 (write), var3 (write), cameraDevicePermissionGrantedSignalModule (ref), getFFlagEnableAnalyticsForCameraDevicePermissionsModule (ref), runService (ref), rbxAnalyticsService (ref)
	local var5 = cryoModule.List.find(p4, default.Permissions.CAMERA_ACCESS) ~= nil
	local var6 = cryoModule.List.find(p4, default.Permissions.MICROPHONE_ACCESS) ~= nil
	local var7 = removePermissionsBasedOnUserSetting(p1, p4, p5)
	local var8 = cryoModule.List.find(var7, default.Permissions.CAMERA_ACCESS) ~= nil
	local var9 = cryoModule.List.find(var7, default.Permissions.MICROPHONE_ACCESS) ~= nil
	
	if var7 and #var7 > 0 then
		return if p5 == true then promiseModule.new(function(p7, _)
			-- upvalues: var7 (ref), default (copy), p2 (ref), var4 (copy), p3 (ref)
			local t = {}
			
			for i, v in ipairs(var7) do
				local var10, var11 = default:hasPermissions({ v }):await()
				
				if var10 then
					t[v] = var11.status == default.Status.AUTHORIZED
				else
					t[v] = false
				end
			end
			p2({
				hasCameraPermissions = t[default.Permissions.CAMERA_ACCESS] or false,
				hasMicPermissions = t[default.Permissions.MICROPHONE_ACCESS] or false
			})
			var4 = false
			p3()
			p7(t)
		end) else default:hasPermissions(var7):andThen(function(p8)
			-- upvalues: default (copy), var8 (ref), var9 (ref), p2 (ref), var4 (copy), p3 (ref), p6 (ref), microphoneDevicePermissionsLoggingModule (copy), var7 (ref), cryoModule (copy), var2 (copy), var5 (ref), var3 (copy), var6 (ref), cameraDevicePermissionGrantedSignalModule (copy), getFFlagEnableAnalyticsForCameraDevicePermissionsModule (copy), runService (copy), rbxAnalyticsService (copy)
			if p8.status == default.Status.AUTHORIZED then
				p2({ hasCameraPermissions = var8, hasMicPermissions = var9 })
				var4 = false
				p3()
				
				return p8
			elseif var9 and p6 then
				microphoneDevicePermissionsLoggingModule:logPromptImpression({ didAuthorize = false, uiContext = p6 })
			end
			return default:requestPermissions(var7):andThen(function(p9)
				-- upvalues: var8 (copy), default (copy), cryoModule (copy), var9 (copy), var2 (copy), var5 (copy), var3 (copy), var6 (copy), cameraDevicePermissionGrantedSignalModule (copy), getFFlagEnableAnalyticsForCameraDevicePermissionsModule (copy), runService (copy), rbxAnalyticsService (copy), p6 (copy), microphoneDevicePermissionsLoggingModule (copy), p2 (copy), var4 (copy), p3 (copy)
				if typeof(p9) == "table" then
					var2 = if var5 then var8 and (if p9.status ~= default.Status.AUTHORIZED then not cryoModule.List.find(p9.missingPermissions, default.Permissions.CAMERA_ACCESS) else true) else nil
					var3 = if var6 then var9 and (if p9.status ~= default.Status.AUTHORIZED then not cryoModule.List.find(p9.missingPermissions, default.Permissions.MICROPHONE_ACCESS) else true) else nil
					
					if var2 then
						cameraDevicePermissionGrantedSignalModule:fire()
					end
				elseif p9 == default.Status.AUTHORIZED then
					cameraDevicePermissionGrantedSignalModule:fire()
					var2 = var8
					var3 = var9
				else
					var2 = false
					var3 = false
				end
				local t = {
					hasCameraPermissions = var2 or false,
					hasMicPermissions = var3 or false
				}
				
				if getFFlagEnableAnalyticsForCameraDevicePermissionsModule() and var8 then
					rbxAnalyticsService:SendEventDeferred(if runService:IsStudio() then "studio" else "client", "avatarChat", "CameraDevicePermissionPrompted", { didAuthorize = var2 or false })
				end
				if var9 and p6 then
					microphoneDevicePermissionsLoggingModule:logPromptInteraction({ didAuthorize = var3, uiContext = p6 })
				end
				p2(t)
				var4 = false
				p3()
				
				return p9
			end)
		end)
	end
	p2({ hasCameraPermissions = false, hasMicPermissions = false })
	var4 = false
	p3()
end

local function tryGetCachedResults(p7)
	-- upvalues: debugSkipVoicePermissionCheck (ref), var3 (write), var2 (write), default (ref)
	if debugSkipVoicePermissionCheck then
		var3 = true
	end
	if var2 == nil or var3 == nil then
		return nil
	end
	local var10 = false
	
	for i, v in p7 do
		if v ~= default.Permissions.MICROPHONE_ACCESS and v ~= default.Permissions.CAMERA_ACCESS then
			var10 = true
		end
	end
	return if var10 then nil else {
		hasCameraPermissions = var2 or false,
		hasMicPermissions = var3 or false
	}
end

local function getCamMicPermissions(p8, p9, p10, p11, p12)
	-- upvalues: default (ref), t (ref), getCamMicPermissions (ref), tryGetCachedResults (ref), var4 (write), getFFlagAvatarChatServiceEnabled (ref), promiseModule (ref), var1 (ref), requestPermissions (ref)
	local var11 = p9 or {
		default.Permissions.MICROPHONE_ACCESS,
		default.Permissions.CAMERA_ACCESS
	}
	
	local function invokeNextRequest()
		-- upvalues: t (copy), getCamMicPermissions (copy)
		if t[1] then
			local var12 = t[1]
			table.remove(t, 1)
			getCamMicPermissions(var12.callback, var12.permissionsToRequest, var12.shouldNotRequestPerms, var12.context, var12.getRawPermission)
		end
	end
	
	if not p12 then
		local var12 = tryGetCachedResults(var11)
		
		if var12 then
			p8(var12)
			
			if t[1] then
				local var13 = t[1]
				table.remove(t, 1)
				getCamMicPermissions(var13.callback, var13.permissionsToRequest, var13.shouldNotRequestPerms, var13.context, var13.getRawPermission)
			end
			return
		elseif var4 then
			table.insert(t, {
				callback = p8,
				permissionsToRequest = p9,
				shouldNotRequestPerms = p10,
				context = p11,
				getRawPermission = p12
			})
			
			return
		end
		var4 = true
		
		return if p12 then default:hasPermissions(var11):andThen(function(p13)
			-- upvalues: p8 (ref), var4 (copy), t (copy), getCamMicPermissions (copy)
			p8(p13)
			var4 = false
			
			if t[1] then
				local var14 = t[1]
				table.remove(t, 1)
				getCamMicPermissions(var14.callback, var14.permissionsToRequest, var14.shouldNotRequestPerms, var14.context, var14.getRawPermission)
			end
		end) elseif getFFlagAvatarChatServiceEnabled() then promiseModule.new(function(p13, _)
			-- upvalues: var1 (copy)
			if var1.ClientFeaturesInitialized then
				p13({
					isVoiceEnabled = var1:IsEnabled(var1.ClientFeatures, Enum.AvatarChatServiceFeature.UserAudio),
					isCameraEnabled = var1:IsEnabled(var1.ClientFeatures, Enum.AvatarChatServiceFeature.UserVideo)
				})
				
				return
			end
			local var14 = nil
			var14 = var1:GetPropertyChangedSignal("ClientFeatures"):Connect(function()
				-- upvalues: var14 (write), var1 (copy), p13 (ref)
				var14:Disconnect()
				p13({
					isVoiceEnabled = var1:IsEnabled(var1.ClientFeatures, Enum.AvatarChatServiceFeature.UserAudio),
					isCameraEnabled = var1:IsEnabled(var1.ClientFeatures, Enum.AvatarChatServiceFeature.UserVideo)
				})
			end)
		end):andThen(function(p13)
			-- upvalues: requestPermissions (copy), p8 (ref), invokeNextRequest (ref), var11 (write), p10 (ref), p11 (ref)
			requestPermissions(p13, p8, invokeNextRequest, var11, p10, p11)
		end) else promiseModule.new(function(p13, _)
			p13({ isVoiceEnabled = false, isCameraEnabled = false })
		end)
	end
end

return getCamMicPermissions