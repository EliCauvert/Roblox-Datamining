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
local var12 = if getFFlagAvatarChatServiceEnabled() then game:GetService("AvatarChatService") else nil
local var13 = nil
local var14 = nil
local t = {}
local var16 = false

local function removePermissionsBasedOnUserSetting(value, p0, p1) --[[ line: 66 ]]
	-- upvalues: cryoModule (ref), default (ref), getFFlagJoinWithoutMicPermissions (ref), debugSkipVoicePermissionCheck (ref), checkCameraAvailabilityBeforePermissions (ref), videoCaptureService (ref)
	if not value.isCameraEnabled and cryoModule.List.find(p0, default.Permissions.CAMERA_ACCESS) then
		p0 = cryoModule.List.removeValue(p0, default.Permissions.CAMERA_ACCESS)
	end
	if getFFlagJoinWithoutMicPermissions() then
		if not value.isVoiceEnabled and cryoModule.List.find(p0, default.Permissions.MICROPHONE_ACCESS) or p1 == nil then
			p0 = cryoModule.List.removeValue(p0, default.Permissions.MICROPHONE_ACCESS)
		end
	elseif not value.isVoiceEnabled and cryoModule.List.find(p0, default.Permissions.MICROPHONE_ACCESS) then
		p0 = cryoModule.List.removeValue(p0, default.Permissions.MICROPHONE_ACCESS)
	end
	if debugSkipVoicePermissionCheck and cryoModule.List.find(p0, default.Permissions.MICROPHONE_ACCESS) then
		p0 = cryoModule.List.removeValue(p0, default.Permissions.MICROPHONE_ACCESS)
	end
	if checkCameraAvailabilityBeforePermissions and cryoModule.List.find(p0, default.Permissions.CAMERA_ACCESS) and cryoModule.isEmpty(videoCaptureService:GetCameraDevices()) then
		p0 = cryoModule.List.removeValue(p0, default.Permissions.CAMERA_ACCESS)
	end
	return p0
end

local function requestPermissions(p2, p3, p4, p5, p6, p7) --[[ line: 120 ]]
	-- upvalues: cryoModule (ref), default (ref), removePermissionsBasedOnUserSetting (ref), var16 (write), promiseModule (ref), microphoneDevicePermissionsLoggingModule (ref), var13 (write), var14 (write), cameraDevicePermissionGrantedSignalModule (ref), getFFlagEnableAnalyticsForCameraDevicePermissionsModule (ref), runService (ref), rbxAnalyticsService (ref)
	local var21 = cryoModule.List.find(p5, default.Permissions.CAMERA_ACCESS) ~= nil
	local var22 = cryoModule.List.find(p5, default.Permissions.MICROPHONE_ACCESS) ~= nil
	local var23 = removePermissionsBasedOnUserSetting(p2, p5, p6)
	local var24 = cryoModule.List.find(var23, default.Permissions.CAMERA_ACCESS) ~= nil
	local var25 = cryoModule.List.find(var23, default.Permissions.MICROPHONE_ACCESS) ~= nil
	
	if var23 and #var23 > 0 then
		return if p6 == true then promiseModule.new(function(p10, _) --[[ line: 150 ]]
			-- upvalues: var23 (ref), default (copy), p3 (ref), var16 (copy), p4 (ref)
			local t = {}
			
			for i, v in ipairs(var23) do
				local var28, var29 = default:hasPermissions({ v }):await()
				
				if var28 then
					t[v] = var29.status == default.Status.AUTHORIZED
				else
					t[v] = false
				end
			end
			p3({
				hasCameraPermissions = t[default.Permissions.CAMERA_ACCESS] or false,
				hasMicPermissions = t[default.Permissions.MICROPHONE_ACCESS] or false
			})
			var16 = false
			p4()
			p10(t)
		end) else default:hasPermissions(var23):andThen(function(p8) --[[ line: 178 ]]
			-- upvalues: default (copy), var24 (ref), var25 (ref), p3 (ref), var16 (copy), p4 (ref), p7 (ref), microphoneDevicePermissionsLoggingModule (copy), var23 (ref), cryoModule (copy), var13 (copy), var21 (ref), var14 (copy), var22 (ref), cameraDevicePermissionGrantedSignalModule (copy), getFFlagEnableAnalyticsForCameraDevicePermissionsModule (copy), runService (copy), rbxAnalyticsService (copy)
			if p8.status == default.Status.AUTHORIZED then
				p3({ hasCameraPermissions = var24, hasMicPermissions = var25 })
				var16 = false
				p4()
				
				return p8
			elseif var25 and p7 then
				microphoneDevicePermissionsLoggingModule:logPromptImpression({ didAuthorize = false, uiContext = p7 })
			end
			return default:requestPermissions(var23):andThen(function(p9) --[[ line: 198 ]]
				-- upvalues: var24 (copy), default (copy), cryoModule (copy), var25 (copy), var13 (copy), var21 (copy), var14 (copy), var22 (copy), cameraDevicePermissionGrantedSignalModule (copy), getFFlagEnableAnalyticsForCameraDevicePermissionsModule (copy), runService (copy), rbxAnalyticsService (copy), p7 (copy), microphoneDevicePermissionsLoggingModule (copy), p3 (copy), var16 (copy), p4 (copy)
				if typeof(p9) == "table" then
					var13 = if var21 then var24 and (if p9.status ~= default.Status.AUTHORIZED then not cryoModule.List.find(p9.missingPermissions, default.Permissions.CAMERA_ACCESS) else true) else nil
					var14 = if var22 then var25 and (if p9.status ~= default.Status.AUTHORIZED then not cryoModule.List.find(p9.missingPermissions, default.Permissions.MICROPHONE_ACCESS) else true) else nil
					
					if var13 then
						cameraDevicePermissionGrantedSignalModule:fire()
					end
				elseif p9 == default.Status.AUTHORIZED then
					cameraDevicePermissionGrantedSignalModule:fire()
					var13 = var24
					var14 = var25
				else
					var13 = false
					var14 = false
				end
				local t = {
					hasCameraPermissions = var13 or false,
					hasMicPermissions = var14 or false
				}
				
				if getFFlagEnableAnalyticsForCameraDevicePermissionsModule() and var24 then
					rbxAnalyticsService:SendEventDeferred(if runService:IsStudio() then "studio" else "client", "avatarChat", "CameraDevicePermissionPrompted", { didAuthorize = var13 or false })
				end
				if var25 and p7 then
					microphoneDevicePermissionsLoggingModule:logPromptInteraction({ didAuthorize = var14, uiContext = p7 })
				end
				p3(t)
				var16 = false
				p4()
				
				return p9
			end)
		end)
	end
	p3({ hasCameraPermissions = false, hasMicPermissions = false })
	var16 = false
	p4()
end

local function tryGetCachedResults(p11) --[[ line: 276 ]]
	-- upvalues: debugSkipVoicePermissionCheck (ref), var14 (write), var13 (write), default (ref)
	if debugSkipVoicePermissionCheck then
		var14 = true
	end
	if var13 == nil or var14 == nil then
		return nil
	end
	local var30 = false
	
	for i, v in p11 do
		if v ~= default.Permissions.MICROPHONE_ACCESS and v ~= default.Permissions.CAMERA_ACCESS then
			var30 = true
		end
	end
	return if var30 then nil else {
		hasCameraPermissions = var13 or false,
		hasMicPermissions = var14 or false
	}
end

local function getCamMicPermissions(p12, p13, p14, p15, p16) --[[ line: 308 ]]
	-- upvalues: default (ref), t (ref), getCamMicPermissions (ref), tryGetCachedResults (ref), var16 (write), getFFlagAvatarChatServiceEnabled (ref), promiseModule (ref), var12 (ref), requestPermissions (ref)
	local var31 = p13 or {
		default.Permissions.MICROPHONE_ACCESS,
		default.Permissions.CAMERA_ACCESS
	}
	
	local function invokeNextRequest() --[[ line: 326 ]]
		-- upvalues: t (copy), getCamMicPermissions (copy)
		if t[1] then
			local var35 = t[1]
			table.remove(t, 1)
			getCamMicPermissions(var35.callback, var35.permissionsToRequest, var35.shouldNotRequestPerms, var35.context, var35.getRawPermission)
		end
	end
	
	if not p16 then
		local var33 = tryGetCachedResults(var31)
		
		if var33 then
			p12(var33)
			
			if t[1] then
				local var34 = t[1]
				table.remove(t, 1)
				getCamMicPermissions(var34.callback, var34.permissionsToRequest, var34.shouldNotRequestPerms, var34.context, var34.getRawPermission)
			end
			return
		elseif var16 then
			table.insert(t, {
				callback = p12,
				permissionsToRequest = p13,
				shouldNotRequestPerms = p14,
				context = p15,
				getRawPermission = p16
			})
			
			return
		end
		var16 = true
		
		return if p16 then default:hasPermissions(var31):andThen(function(p20) --[[ line: 365 ]]
			-- upvalues: p12 (ref), var16 (copy), t (copy), getCamMicPermissions (copy)
			p12(p20)
			var16 = false
			
			if t[1] then
				local var37 = t[1]
				table.remove(t, 1)
				getCamMicPermissions(var37.callback, var37.permissionsToRequest, var37.shouldNotRequestPerms, var37.context, var37.getRawPermission)
			end
		end) elseif getFFlagAvatarChatServiceEnabled() then promiseModule.new(function(p19, _) --[[ line: 373 ]]
			-- upvalues: var12 (copy)
			if var12.ClientFeaturesInitialized then
				p19({
					isVoiceEnabled = var12:IsEnabled(var12.ClientFeatures, Enum.AvatarChatServiceFeature.UserAudio),
					isCameraEnabled = var12:IsEnabled(var12.ClientFeatures, Enum.AvatarChatServiceFeature.UserVideo)
				})
				
				return
			end
			local var36 = nil
			var36 = var12:GetPropertyChangedSignal("ClientFeatures"):Connect(function() --[[ line: 389 ]]
				-- upvalues: var36 (write), var12 (copy), p19 (ref)
				var36:Disconnect()
				p19({
					isVoiceEnabled = var12:IsEnabled(var12.ClientFeatures, Enum.AvatarChatServiceFeature.UserAudio),
					isCameraEnabled = var12:IsEnabled(var12.ClientFeatures, Enum.AvatarChatServiceFeature.UserVideo)
				})
			end)
		end):andThen(function(p18) --[[ line: 404 ]]
			-- upvalues: requestPermissions (copy), p12 (ref), invokeNextRequest (ref), var31 (write), p14 (ref), p15 (ref)
			requestPermissions(p18, p12, invokeNextRequest, var31, p14, p15)
		end) else promiseModule.new(function(p17, _) --[[ line: 416 ]]
			p17({ isVoiceEnabled = false, isCameraEnabled = false })
		end)
	end
end

return getCamMicPermissions