local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Parent = script.Parent.Parent
local MessageBus = require(Parent.MessageBus).MessageBus
local PromiseModule = require(Parent.Promise)
local TModule = require(Parent.t)
local IsVersionAtLeastModule = require(script.Parent.isVersionAtLeast)
local GetFFlagLuaEnableShowUpsellMethodFunction = require(Parent.SharedFlags).GetFFlagLuaEnableShowUpsellMethod
local ScopedSubscribersForPermissionsProtocol2 = game:DefineFastFlag("ScopedSubscribersForPermissionsProtocol2", false)
local _ = require(script.Parent.PermissionsProtocolTypes)
game:DefineFastFlag("DebugRomarkAudioPermissionsBypass", false)
game:DefineFastFlag("EnableAndroidOpenNotificationSettings", false)
game:DefineFastString("AndroidOpenNotificationSettingsMinVersion", "")
game:DefineFastFlag("PermissionsProtocolNonStickyResponses", false)
local Permissions = {
	CAMERA_ACCESS = "CAMERA_ACCESS",
	MICROPHONE_ACCESS = "MICROPHONE_ACCESS",
	LOCAL_NETWORK = "LOCAL_NETWORK",
	CONTACTS_ACCESS = "CONTACTS_ACCESS",
	WRITE_MEDIA_STORAGE = "WRITE_MEDIA_STORAGE",
	POST_NOTIFICATIONS = "POST_NOTIFICATIONS"
}
local Status = {
	AUTHORIZED = "AUTHORIZED",
	DENIED = "DENIED",
	RESTRICTED = "RESTRICTED",
	UNSUPPORTED = "UNSUPPORTED"
}
local UpsellStatus = {
	SHOW = "SHOW",
	HIDE = "HIDE",
	UNSUPPORTED = "UNSUPPORTED"
}
local OpenSettingsStatus = {
	OPENED_NOTIFICATION_SETTINGS = "OPENED_NOTIFICATION_SETTINGS",
	OPENED_APP_SETTINGS = "OPENED_APP_SETTINGS",
	FAILED = "FAILED"
}
local ArrayResult = TModule.array(TModule.valueOf(Permissions))
local ValueOfResult = TModule.valueOf(Status)
local ValueOfResult1 = TModule.valueOf(UpsellStatus)
local PermissionsProtocolModule = {
	_openNotificationSettingsTimeoutSeconds = 5,
	_getPushNotificationsEnabledTimeoutSeconds = 1,
	Permissions = Permissions,
	Status = Status,
	UpsellStatus = UpsellStatus,
	OpenSettingsStatus = OpenSettingsStatus,
	PERMISSION_REQUEST_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "PermissionsRequest",
		validateParams = TModule.strictInterface({ permissions = ArrayResult })
	},
	PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "PermissionsRequest",
		validateParams = TModule.strictInterface({ status = ValueOfResult, missingPermissions = ArrayResult })
	},
	HAS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "HasPermissions",
		validateParams = TModule.strictInterface({ permissions = ArrayResult })
	},
	HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "HasPermissions",
		validateParams = TModule.strictInterface({ status = ValueOfResult, missingPermissions = ArrayResult })
	},
	SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "SupportsPermissions",
		validateParams = TModule.strictInterface({ includeStatus = TModule.literal(false) })
	},
	SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "SupportsPermissions",
		validateParams = TModule.strictInterface({ permissions = ArrayResult })
	},
	SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "ShouldShowPermissionUpsell",
		validateParams = TModule.strictInterface({ permissions = ArrayResult })
	},
	SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "ShouldShowPermissionUpsell",
		validateParams = TModule.strictInterface({
			hiddenUpsellPermissions = ArrayResult,
			upsellStatus = ValueOfResult1
		})
	},
	SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "ShouldShowRequestPermissionRationale",
		validateParams = TModule.strictInterface({ permissions = ArrayResult })
	},
	SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "ShouldShowRequestPermissionRationale",
		validateParams = TModule.strictInterface({
			hiddenUpsellPermissions = ArrayResult,
			upsellStatus = ValueOfResult1
		})
	},
	OPEN_NOTIFICATION_SETTINGS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "OpenNotificationSettings",
		validateParams = TModule.strictInterface({ permissions = ArrayResult })
	},
	OPEN_NOTIFICATION_SETTINGS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "OpenNotificationSettings",
		validateParams = TModule.strictInterface({ status = TModule.valueOf(OpenSettingsStatus) })
	},
	GET_PUSH_NOTIFICATIONS_ENABLED_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "GetPushNotificationsEnabled",
		validateParams = TModule.strictInterface({ permissions = ArrayResult })
	},
	GET_PUSH_NOTIFICATIONS_ENABLED_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "GetPushNotificationsEnabled",
		validateParams = TModule.strictInterface({ enabled = TModule.boolean })
	},
	_getPlatform = function()
		-- upvalues: UserInputService (copy)
		return UserInputService:GetPlatform()
	end,
	_getVersion = function()
		-- upvalues: RunService (copy)
		return RunService:GetRobloxVersion()
	end
}
PermissionsProtocolModule.__index = PermissionsProtocolModule

local function getPermissionRequestTelemetryData(Permissions)
	-- upvalues: PermissionsProtocolModule (copy)
	local t = {}
	
	for _, permission in pairs(Permissions) do
		if permission == PermissionsProtocolModule.Permissions.CAMERA_ACCESS then
			t.camera_access_requested = ""
		end
		if permission == PermissionsProtocolModule.Permissions.MICROPHONE_ACCESS then
			t.microphone_access_requested = ""
		end
		if permission == PermissionsProtocolModule.Permissions.LOCAL_NETWORK then
			t.local_network_requested = ""
		end
		if permission == PermissionsProtocolModule.Permissions.CONTACTS_ACCESS then
			t.contacts_access_requested = ""
		end
	end
	return t
end

local function createSequencedProtocolMethodCall(ActiveCalls, HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR, HASPERMISSIONSPROTOCOLMETHODREQUESTDESCRIPTOR, p1, p2, p3)
	-- upvalues: PromiseModule (copy), MessageBus (copy)
	assert(HASPERMISSIONSPROTOCOLMETHODREQUESTDESCRIPTOR.validateParams(p1))
	local v1 = (ActiveCalls[HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR] or PromiseModule.resolve()):finally(function()
		-- upvalues: PromiseModule (upval), MessageBus (upval), HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR (copy), p3 (copy), HASPERMISSIONSPROTOCOLMETHODREQUESTDESCRIPTOR (copy), p1 (copy), p2 (copy)
		return PromiseModule.new(function(Callback)
			-- upvalues: MessageBus (upval), HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR (upval), p3 (upval), HASPERMISSIONSPROTOCOLMETHODREQUESTDESCRIPTOR (upval), p1 (upval), p2 (upval)
			local NewResult = MessageBus.Subscriber.new()
			NewResult:subscribeProtocolMethodResponse(HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR, function(p4)
				-- upvalues: NewResult (copy), HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR (upval), Callback (copy)
				NewResult:unsubscribeToProtocolMethodResponse(HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR)
				Callback(p4)
			end, p3)
			MessageBus.publishProtocolMethodRequest(HASPERMISSIONSPROTOCOLMETHODREQUESTDESCRIPTOR, p1, p2)
		end)
	end)
	ActiveCalls[HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR] = v1
	
	return v1
end

local function _()
	return not game:GetFastFlag("PermissionsProtocolNonStickyResponses") and nil
end

local _ = function()
	-- upvalues: PermissionsProtocolModule (copy)
	local Success, Result = pcall(PermissionsProtocolModule._getPlatform)
	
	return if Success then Result else nil
end

local _ = function()
	-- upvalues: IsVersionAtLeastModule (copy), PermissionsProtocolModule (copy)
	return game:GetFastFlag("EnableAndroidOpenNotificationSettings") and IsVersionAtLeastModule(PermissionsProtocolModule._getVersion(), game:GetFastString("AndroidOpenNotificationSettingsMinVersion"))
end

local function callPushNotificationSettingsMethod(p1, GETPUSHNOTIFICATIONSENABLEDPROTOCOLMETHODREQUESTDESCRIPTOR, GETPUSHNOTIFICATIONSENABLEDPROTOCOLMETHODRESPONSEDESCRIPTOR)
	-- upvalues: PermissionsProtocolModule (copy), getPermissionRequestTelemetryData (copy), ScopedSubscribersForPermissionsProtocol2 (copy), createSequencedProtocolMethodCall (copy), PromiseModule (copy), MessageBus (copy)
	local Permissions = { PermissionsProtocolModule.Permissions.POST_NOTIFICATIONS }
	local config = { permissions = Permissions }
	local PermissionRequestTelemetryData = getPermissionRequestTelemetryData(Permissions)
	
	if ScopedSubscribersForPermissionsProtocol2 then
		return (createSequencedProtocolMethodCall(p1.activeCalls, GETPUSHNOTIFICATIONSENABLEDPROTOCOLMETHODRESPONSEDESCRIPTOR, GETPUSHNOTIFICATIONSENABLEDPROTOCOLMETHODREQUESTDESCRIPTOR, config, PermissionRequestTelemetryData, false))
	else
		local NewPromise = PromiseModule.new(function(Callback, _)
			-- upvalues: p1 (copy), GETPUSHNOTIFICATIONSENABLEDPROTOCOLMETHODRESPONSEDESCRIPTOR (copy)
			p1.subscriber:subscribeProtocolMethodResponse(GETPUSHNOTIFICATIONSENABLEDPROTOCOLMETHODRESPONSEDESCRIPTOR, function(p2)
				-- upvalues: p1 (upval), GETPUSHNOTIFICATIONSENABLEDPROTOCOLMETHODRESPONSEDESCRIPTOR (upval), Callback (copy)
				p1.subscriber:unsubscribeToProtocolMethodResponse(GETPUSHNOTIFICATIONSENABLEDPROTOCOLMETHODRESPONSEDESCRIPTOR)
				Callback(p2)
			end, false)
		end)
		MessageBus.publishProtocolMethodRequest(GETPUSHNOTIFICATIONSENABLEDPROTOCOLMETHODREQUESTDESCRIPTOR, config, PermissionRequestTelemetryData)
		
		return NewPromise
	end
end

function PermissionsProtocolModule.new()
	-- upvalues: ScopedSubscribersForPermissionsProtocol2 (copy), MessageBus (copy), PermissionsProtocolModule (copy)
	return (setmetatable({
		activeCalls = if ScopedSubscribersForPermissionsProtocol2 then {} else nil,
		subscriber = if ScopedSubscribersForPermissionsProtocol2 then nil else MessageBus.Subscriber.new()
	}, PermissionsProtocolModule))
end

function PermissionsProtocolModule:hasPermissions(Permissions)
	-- upvalues: ScopedSubscribersForPermissionsProtocol2 (copy), createSequencedProtocolMethodCall (copy), getPermissionRequestTelemetryData (copy), PromiseModule (copy), MessageBus (copy)
	if ScopedSubscribersForPermissionsProtocol2 then
		return (createSequencedProtocolMethodCall(self.activeCalls, self.HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, self.HAS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = Permissions }, getPermissionRequestTelemetryData(Permissions), not game:GetFastFlag("PermissionsProtocolNonStickyResponses") and nil))
	else
		local NewPromise = PromiseModule.new(function(Callback, _)
			-- upvalues: self (copy)
			local HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR = self.HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR, function(p1)
				-- upvalues: self (upval), HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR (copy), Callback (copy)
				self.subscriber:unsubscribeToProtocolMethodResponse(HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR)
				Callback(p1)
			end, not game:GetFastFlag("PermissionsProtocolNonStickyResponses") and nil)
		end)
		MessageBus.publishProtocolMethodRequest(self.HAS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = Permissions }, (getPermissionRequestTelemetryData(Permissions)))
		
		return NewPromise
	end
end

function PermissionsProtocolModule:requestPermissions(Permissions)
	-- upvalues: PermissionsProtocolModule (copy), PromiseModule (copy), ScopedSubscribersForPermissionsProtocol2 (copy), createSequencedProtocolMethodCall (copy), getPermissionRequestTelemetryData (copy), MessageBus (copy)
	if game:GetFastFlag("DebugRomarkAudioPermissionsBypass") then
		return PromiseModule.resolve({
			missingPermissions = {},
			status = PermissionsProtocolModule.Status.AUTHORIZED
		})
	elseif ScopedSubscribersForPermissionsProtocol2 then
		return (createSequencedProtocolMethodCall(self.activeCalls, self.PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, self.PERMISSION_REQUEST_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = Permissions }, getPermissionRequestTelemetryData(Permissions), not game:GetFastFlag("PermissionsProtocolNonStickyResponses") and nil))
	else
		local NewPromise = PromiseModule.new(function(Callback, _)
			-- upvalues: self (copy)
			local PERMISSIONREQUESTPROTOCOLMETHODRESPONSEDESCRIPTOR = self.PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(PERMISSIONREQUESTPROTOCOLMETHODRESPONSEDESCRIPTOR, function(p1)
				-- upvalues: self (upval), PERMISSIONREQUESTPROTOCOLMETHODRESPONSEDESCRIPTOR (copy), Callback (copy)
				self.subscriber:unsubscribeToProtocolMethodResponse(PERMISSIONREQUESTPROTOCOLMETHODRESPONSEDESCRIPTOR)
				Callback(p1)
			end, not game:GetFastFlag("PermissionsProtocolNonStickyResponses") and nil)
		end)
		MessageBus.publishProtocolMethodRequest(self.PERMISSION_REQUEST_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = Permissions }, (getPermissionRequestTelemetryData(Permissions)))
		
		return NewPromise
	end
end

function PermissionsProtocolModule:getSupportedPermissionsList()
	-- upvalues: ScopedSubscribersForPermissionsProtocol2 (copy), createSequencedProtocolMethodCall (copy), PromiseModule (copy), MessageBus (copy)
	if ScopedSubscribersForPermissionsProtocol2 then
		return (createSequencedProtocolMethodCall(self.activeCalls, self.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, self.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {}, not game:GetFastFlag("PermissionsProtocolNonStickyResponses") and nil))
	else
		local NewPromise = PromiseModule.new(function(Callback, _)
			-- upvalues: self (copy)
			local SUPPORTSPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR = self.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(SUPPORTSPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR, function(p1)
				-- upvalues: self (upval), SUPPORTSPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR (copy), Callback (copy)
				self.subscriber:unsubscribeToProtocolMethodResponse(SUPPORTSPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR)
				Callback(p1)
			end, not game:GetFastFlag("PermissionsProtocolNonStickyResponses") and nil)
		end)
		MessageBus.publishProtocolMethodRequest(self.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {})
		
		return NewPromise
	end
end

function PermissionsProtocolModule:supportsPermissions(p1)
	-- upvalues: ArrayResult (copy), PromiseModule (copy)
	assert(ArrayResult(p1))
	
	return (self:getSupportedPermissionsList():andThen(function(Result)
		-- upvalues: p1 (copy), PromiseModule (upval)
		local Permissions = Result and Result.permissions
		
		if not Permissions then
			return PromiseModule.reject()
		end
		local Flag = nil
		for _, value in pairs(p1) do
			Flag = false
			
			for _, permission in pairs(Permissions) do
				if value == permission then
					Flag = true
					break
				end
			end
			if not Flag then
				return PromiseModule.resolve(false)
			end
		end
		return PromiseModule.resolve(true)
	end))
end

function PermissionsProtocolModule:checkOrRequestPermissions(Permissions)
	-- upvalues: ArrayResult (copy), PromiseModule (copy), PermissionsProtocolModule (copy)
	assert(ArrayResult(Permissions))
	
	return self:supportsPermissions(Permissions):andThen(function(Result)
		-- upvalues: PromiseModule (upval), PermissionsProtocolModule (upval), self (copy), Permissions (copy)
		return if Result then self:hasPermissions(Permissions):andThen(function(Result)
			-- upvalues: PermissionsProtocolModule (upval), PromiseModule (upval), self (upval), Permissions (upval)
			return if Result.status == PermissionsProtocolModule.Status.AUTHORIZED then PromiseModule.resolve(Result.status) else self:requestPermissions(Permissions):andThen(function(Result)
				-- upvalues: PromiseModule (upval)
				return PromiseModule.resolve(Result.status)
			end)
		end) else PromiseModule.resolve(PermissionsProtocolModule.Status.UNSUPPORTED)
	end, function(_)
		-- upvalues: PromiseModule (upval), PermissionsProtocolModule (upval)
		return PromiseModule.resolve(PermissionsProtocolModule.Status.UNSUPPORTED)
	end)
end

function PermissionsProtocolModule:shouldShowUpsell(Permissions)
	-- upvalues: GetFFlagLuaEnableShowUpsellMethodFunction (copy), PromiseModule (copy), ScopedSubscribersForPermissionsProtocol2 (copy), createSequencedProtocolMethodCall (copy), getPermissionRequestTelemetryData (copy), MessageBus (copy)
	if not GetFFlagLuaEnableShowUpsellMethodFunction() then
		return PromiseModule.resolve({})
	elseif ScopedSubscribersForPermissionsProtocol2 then
		return (createSequencedProtocolMethodCall(self.activeCalls, self.SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, self.SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = Permissions }, getPermissionRequestTelemetryData(Permissions), not game:GetFastFlag("PermissionsProtocolNonStickyResponses") and nil))
	else
		local NewPromise = PromiseModule.new(function(Callback, _)
			-- upvalues: self (copy)
			local SHOULDSHOWPERMISSIONUPSELLPROTOCOLMETHODRESPONSEDESCRIPTOR = self.SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(SHOULDSHOWPERMISSIONUPSELLPROTOCOLMETHODRESPONSEDESCRIPTOR, function(p2)
				-- upvalues: self (upval), SHOULDSHOWPERMISSIONUPSELLPROTOCOLMETHODRESPONSEDESCRIPTOR (copy), Callback (copy)
				self.subscriber:unsubscribeToProtocolMethodResponse(SHOULDSHOWPERMISSIONUPSELLPROTOCOLMETHODRESPONSEDESCRIPTOR)
				Callback(p2)
			end, not game:GetFastFlag("PermissionsProtocolNonStickyResponses") and nil)
		end)
		MessageBus.publishProtocolMethodRequest(self.SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = Permissions }, (getPermissionRequestTelemetryData(Permissions)))
		
		return NewPromise
	end
end

function PermissionsProtocolModule:shouldShowRationale(Permissions)
	-- upvalues: ScopedSubscribersForPermissionsProtocol2 (copy), createSequencedProtocolMethodCall (copy), getPermissionRequestTelemetryData (copy), PromiseModule (copy), MessageBus (copy)
	if ScopedSubscribersForPermissionsProtocol2 then
		return (createSequencedProtocolMethodCall(self.activeCalls, self.SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, self.SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = Permissions }, getPermissionRequestTelemetryData(Permissions), not game:GetFastFlag("PermissionsProtocolNonStickyResponses") and nil))
	else
		local NewPromise = PromiseModule.new(function(Callback, _)
			-- upvalues: self (copy)
			local SHOULDSHOWPERMISSIONRATIONALEPROTOCOLMETHODRESPONSEDESCRIPTOR = self.SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(SHOULDSHOWPERMISSIONRATIONALEPROTOCOLMETHODRESPONSEDESCRIPTOR, function(p2)
				-- upvalues: self (upval), SHOULDSHOWPERMISSIONRATIONALEPROTOCOLMETHODRESPONSEDESCRIPTOR (copy), Callback (copy)
				self.subscriber:unsubscribeToProtocolMethodResponse(SHOULDSHOWPERMISSIONRATIONALEPROTOCOLMETHODRESPONSEDESCRIPTOR)
				Callback(p2)
			end, not game:GetFastFlag("PermissionsProtocolNonStickyResponses") and nil)
		end)
		MessageBus.publishProtocolMethodRequest(self.SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = Permissions }, (getPermissionRequestTelemetryData(Permissions)))
		
		return NewPromise
	end
end

function PermissionsProtocolModule.isOpenNotificationSettingsSupported()
	-- upvalues: PermissionsProtocolModule (copy), IsVersionAtLeastModule (copy)
	local Success, Result = pcall(PermissionsProtocolModule._getPlatform)
	local Result1 = if Success then Result else nil
	
	return Result1 == Enum.Platform.IOS or Result1 == Enum.Platform.Android and (game:GetFastFlag("EnableAndroidOpenNotificationSettings") and IsVersionAtLeastModule(PermissionsProtocolModule._getVersion(), game:GetFastString("AndroidOpenNotificationSettingsMinVersion")))
end

function PermissionsProtocolModule.openNotificationSettings(p2)
	-- upvalues: PermissionsProtocolModule (copy), PromiseModule (copy), OpenSettingsStatus (copy), callPushNotificationSettingsMethod (copy)
	if PermissionsProtocolModule.isOpenNotificationSettingsSupported() then
		local Success, Result = pcall(PermissionsProtocolModule._getPlatform)
		
		return if (if Success then Result else nil) == Enum.Platform.IOS then p2:requestPermissions({ PermissionsProtocolModule.Permissions.POST_NOTIFICATIONS }):andThen(function()
			-- upvalues: OpenSettingsStatus (upval)
			return { status = OpenSettingsStatus.OPENED_APP_SETTINGS }
		end, function()
			-- upvalues: OpenSettingsStatus (upval)
			return { status = OpenSettingsStatus.FAILED }
		end) else callPushNotificationSettingsMethod(p2, p2.OPEN_NOTIFICATION_SETTINGS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, p2.OPEN_NOTIFICATION_SETTINGS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR):timeout(PermissionsProtocolModule._openNotificationSettingsTimeoutSeconds):andThen(function(Result)
			return { status = Result.status }
		end, function()
			-- upvalues: OpenSettingsStatus (upval)
			return { status = OpenSettingsStatus.FAILED }
		end)
	else
		return PromiseModule.resolve({ status = OpenSettingsStatus.FAILED })
	end
end

function PermissionsProtocolModule:getPushNotificationsEnabled()
	-- upvalues: PermissionsProtocolModule (copy), IsVersionAtLeastModule (copy), PromiseModule (copy), callPushNotificationSettingsMethod (copy)
	local Success, Result = pcall(PermissionsProtocolModule._getPlatform)
	
	if (if Success then Result else nil) == Enum.Platform.Android and (game:GetFastFlag("EnableAndroidOpenNotificationSettings") and IsVersionAtLeastModule(PermissionsProtocolModule._getVersion(), game:GetFastString("AndroidOpenNotificationSettingsMinVersion"))) then
		return callPushNotificationSettingsMethod(self, self.GET_PUSH_NOTIFICATIONS_ENABLED_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, self.GET_PUSH_NOTIFICATIONS_ENABLED_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR):timeout(PermissionsProtocolModule._getPushNotificationsEnabledTimeoutSeconds, "TIMEOUT"):andThen(function(Result)
			return { enabled = Result.enabled }
		end)
	else
		return PromiseModule.reject("UNSUPPORTED")
	end
end

PermissionsProtocolModule.default = PermissionsProtocolModule.new()

return PermissionsProtocolModule