local Parent = script.Parent.Parent
local MessageBus = require(Parent.MessageBus).MessageBus
local PromiseModule = require(Parent.Promise)
local TModule = require(Parent.t)
local GetFFlagLuaEnableShowUpsellMethodFunction = require(Parent.SharedFlags).GetFFlagLuaEnableShowUpsellMethod
local ScopedSubscribersForPermissionsProtocol2 = game:DefineFastFlag("ScopedSubscribersForPermissionsProtocol2", false)
local _ = require(script.Parent.PermissionsProtocolTypes)
game:DefineFastFlag("DebugRomarkAudioPermissionsBypass", false)
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
local ArrayResult = TModule.array(TModule.valueOf(Permissions))
local ValueOfResult = TModule.valueOf(Status)
local ValueOfResult1 = TModule.valueOf(UpsellStatus)
local PermissionsProtocolModule = {
	Permissions = Permissions,
	Status = Status,
	UpsellStatus = UpsellStatus,
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
	}
}
PermissionsProtocolModule.__index = PermissionsProtocolModule

local function getPermissionRequestTelemetryData(Permissions) --[[ Line: 145 ]]
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

local function createSequencedProtocolMethodCall(ActiveCalls, HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR, HASPERMISSIONSPROTOCOLMETHODREQUESTDESCRIPTOR, p1, p2) --[[ Line: 164 ]]
	-- upvalues: PromiseModule (copy), MessageBus (copy)
	assert(HASPERMISSIONSPROTOCOLMETHODREQUESTDESCRIPTOR.validateParams(p1))
	local v1 = (ActiveCalls[HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR] or PromiseModule.resolve()):finally(function() --[[ Line: 175 ]]
		-- upvalues: PromiseModule (upval), MessageBus (upval), HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR (copy), HASPERMISSIONSPROTOCOLMETHODREQUESTDESCRIPTOR (copy), p1 (copy), p2 (copy)
		return PromiseModule.new(function(Callback) --[[ Line: 176 ]]
			-- upvalues: MessageBus (upval), HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR (upval), HASPERMISSIONSPROTOCOLMETHODREQUESTDESCRIPTOR (upval), p1 (upval), p2 (upval)
			local NewResult = MessageBus.Subscriber.new()
			NewResult:subscribeProtocolMethodResponse(HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR, function(p3) --[[ Line: 178 ]]
				-- upvalues: NewResult (copy), HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR (upval), Callback (copy)
				NewResult:unsubscribeToProtocolMethodResponse(HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR)
				Callback(p3)
			end)
			MessageBus.publishProtocolMethodRequest(HASPERMISSIONSPROTOCOLMETHODREQUESTDESCRIPTOR, p1, p2)
		end)
	end)
	ActiveCalls[HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR] = v1
	
	return v1
end

function PermissionsProtocolModule.new() --[[ Line: 190 ]]
	-- upvalues: ScopedSubscribersForPermissionsProtocol2 (copy), MessageBus (copy), PermissionsProtocolModule (copy)
	return (setmetatable({
		activeCalls = if ScopedSubscribersForPermissionsProtocol2 then {} else nil,
		subscriber = if ScopedSubscribersForPermissionsProtocol2 then nil else MessageBus.Subscriber.new()
	}, PermissionsProtocolModule))
end

function PermissionsProtocolModule:hasPermissions(Permissions) --[[ Line: 208 ]]
	-- upvalues: ScopedSubscribersForPermissionsProtocol2 (copy), createSequencedProtocolMethodCall (copy), getPermissionRequestTelemetryData (copy), PromiseModule (copy), MessageBus (copy)
	if ScopedSubscribersForPermissionsProtocol2 then
		return (createSequencedProtocolMethodCall(self.activeCalls, self.HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, self.HAS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = Permissions }, (getPermissionRequestTelemetryData(Permissions))))
	else
		local NewPromise = PromiseModule.new(function(Callback, _) --[[ Line: 217 ]]
			-- upvalues: self (copy)
			local HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR = self.HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR, function(p1) --[[ Line: 219 ]]
				-- upvalues: self (upval), HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR (copy), Callback (copy)
				self.subscriber:unsubscribeToProtocolMethodResponse(HASPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR)
				Callback(p1)
			end)
		end)
		MessageBus.publishProtocolMethodRequest(self.HAS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = Permissions }, (getPermissionRequestTelemetryData(Permissions)))
		
		return NewPromise
	end
end

function PermissionsProtocolModule:requestPermissions(Permissions) --[[ Line: 239 ]]
	-- upvalues: PermissionsProtocolModule (copy), PromiseModule (copy), ScopedSubscribersForPermissionsProtocol2 (copy), createSequencedProtocolMethodCall (copy), getPermissionRequestTelemetryData (copy), MessageBus (copy)
	if game:GetFastFlag("DebugRomarkAudioPermissionsBypass") then
		return PromiseModule.resolve({
			missingPermissions = {},
			status = PermissionsProtocolModule.Status.AUTHORIZED
		})
	elseif ScopedSubscribersForPermissionsProtocol2 then
		return (createSequencedProtocolMethodCall(self.activeCalls, self.PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, self.PERMISSION_REQUEST_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = Permissions }, (getPermissionRequestTelemetryData(Permissions))))
	else
		local NewPromise = PromiseModule.new(function(Callback, _) --[[ Line: 256 ]]
			-- upvalues: self (copy)
			local PERMISSIONREQUESTPROTOCOLMETHODRESPONSEDESCRIPTOR = self.PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(PERMISSIONREQUESTPROTOCOLMETHODRESPONSEDESCRIPTOR, function(p1) --[[ Line: 258 ]]
				-- upvalues: self (upval), PERMISSIONREQUESTPROTOCOLMETHODRESPONSEDESCRIPTOR (copy), Callback (copy)
				self.subscriber:unsubscribeToProtocolMethodResponse(PERMISSIONREQUESTPROTOCOLMETHODRESPONSEDESCRIPTOR)
				Callback(p1)
			end)
		end)
		MessageBus.publishProtocolMethodRequest(self.PERMISSION_REQUEST_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = Permissions }, (getPermissionRequestTelemetryData(Permissions)))
		
		return NewPromise
	end
end

function PermissionsProtocolModule:getSupportedPermissionsList() --[[ Line: 276 ]]
	-- upvalues: ScopedSubscribersForPermissionsProtocol2 (copy), createSequencedProtocolMethodCall (copy), PromiseModule (copy), MessageBus (copy)
	if ScopedSubscribersForPermissionsProtocol2 then
		return (createSequencedProtocolMethodCall(self.activeCalls, self.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, self.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {}))
	else
		local NewPromise = PromiseModule.new(function(Callback, _) --[[ Line: 285 ]]
			-- upvalues: self (copy)
			local SUPPORTSPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR = self.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(SUPPORTSPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR, function(p1) --[[ Line: 287 ]]
				-- upvalues: self (upval), SUPPORTSPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR (copy), Callback (copy)
				self.subscriber:unsubscribeToProtocolMethodResponse(SUPPORTSPERMISSIONSPROTOCOLMETHODRESPONSEDESCRIPTOR)
				Callback(p1)
			end)
		end)
		MessageBus.publishProtocolMethodRequest(self.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {})
		
		return NewPromise
	end
end

function PermissionsProtocolModule:supportsPermissions(p1) --[[ Line: 306 ]]
	-- upvalues: ArrayResult (copy), PromiseModule (copy)
	assert(ArrayResult(p1))
	
	return (self:getSupportedPermissionsList():andThen(function(Result) --[[ Line: 309 ]]
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

function PermissionsProtocolModule:checkOrRequestPermissions(Permissions) --[[ Line: 348 ]]
	-- upvalues: ArrayResult (copy), PromiseModule (copy), PermissionsProtocolModule (copy)
	assert(ArrayResult(Permissions))
	
	return self:supportsPermissions(Permissions):andThen(function(Result) --[[ Line: 351 ]]
		-- upvalues: PromiseModule (upval), PermissionsProtocolModule (upval), self (copy), Permissions (copy)
		return if Result then self:hasPermissions(Permissions):andThen(function(Result) --[[ Line: 358 ]]
			-- upvalues: PermissionsProtocolModule (upval), PromiseModule (upval), self (upval), Permissions (upval)
			return if Result.status == PermissionsProtocolModule.Status.AUTHORIZED then PromiseModule.resolve(Result.status) else self:requestPermissions(Permissions):andThen(function(Result) --[[ Line: 364 ]]
				-- upvalues: PromiseModule (upval)
				return PromiseModule.resolve(Result.status)
			end)
		end) else PromiseModule.resolve(PermissionsProtocolModule.Status.UNSUPPORTED)
	end, function(_) --[[ Line: 370 ]]
		-- upvalues: PromiseModule (upval), PermissionsProtocolModule (upval)
		return PromiseModule.resolve(PermissionsProtocolModule.Status.UNSUPPORTED)
	end)
end

function PermissionsProtocolModule:shouldShowUpsell(Permissions) --[[ Line: 385 ]]
	-- upvalues: GetFFlagLuaEnableShowUpsellMethodFunction (copy), PromiseModule (copy), ScopedSubscribersForPermissionsProtocol2 (copy), createSequencedProtocolMethodCall (copy), getPermissionRequestTelemetryData (copy), MessageBus (copy)
	if not GetFFlagLuaEnableShowUpsellMethodFunction() then
		return PromiseModule.resolve({})
	elseif ScopedSubscribersForPermissionsProtocol2 then
		return (createSequencedProtocolMethodCall(self.activeCalls, self.SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, self.SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = Permissions }, (getPermissionRequestTelemetryData(Permissions))))
	else
		local NewPromise = PromiseModule.new(function(Callback, _) --[[ Line: 398 ]]
			-- upvalues: self (copy)
			local SHOULDSHOWPERMISSIONUPSELLPROTOCOLMETHODRESPONSEDESCRIPTOR = self.SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(SHOULDSHOWPERMISSIONUPSELLPROTOCOLMETHODRESPONSEDESCRIPTOR, function(p2) --[[ Line: 400 ]]
				-- upvalues: self (upval), SHOULDSHOWPERMISSIONUPSELLPROTOCOLMETHODRESPONSEDESCRIPTOR (copy), Callback (copy)
				self.subscriber:unsubscribeToProtocolMethodResponse(SHOULDSHOWPERMISSIONUPSELLPROTOCOLMETHODRESPONSEDESCRIPTOR)
				Callback(p2)
			end)
		end)
		MessageBus.publishProtocolMethodRequest(self.SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = Permissions }, (getPermissionRequestTelemetryData(Permissions)))
		
		return NewPromise
	end
end

function PermissionsProtocolModule:shouldShowRationale(Permissions) --[[ Line: 421 ]]
	-- upvalues: ScopedSubscribersForPermissionsProtocol2 (copy), createSequencedProtocolMethodCall (copy), getPermissionRequestTelemetryData (copy), PromiseModule (copy), MessageBus (copy)
	if ScopedSubscribersForPermissionsProtocol2 then
		return (createSequencedProtocolMethodCall(self.activeCalls, self.SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, self.SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = Permissions }, (getPermissionRequestTelemetryData(Permissions))))
	else
		local NewPromise = PromiseModule.new(function(Callback, _) --[[ Line: 430 ]]
			-- upvalues: self (copy)
			local SHOULDSHOWPERMISSIONRATIONALEPROTOCOLMETHODRESPONSEDESCRIPTOR = self.SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(SHOULDSHOWPERMISSIONRATIONALEPROTOCOLMETHODRESPONSEDESCRIPTOR, function(p2) --[[ Line: 432 ]]
				-- upvalues: self (upval), SHOULDSHOWPERMISSIONRATIONALEPROTOCOLMETHODRESPONSEDESCRIPTOR (copy), Callback (copy)
				self.subscriber:unsubscribeToProtocolMethodResponse(SHOULDSHOWPERMISSIONRATIONALEPROTOCOLMETHODRESPONSEDESCRIPTOR)
				Callback(p2)
			end)
		end)
		MessageBus.publishProtocolMethodRequest(self.SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = Permissions }, (getPermissionRequestTelemetryData(Permissions)))
		
		return NewPromise
	end
end

PermissionsProtocolModule.default = PermissionsProtocolModule.new()

return PermissionsProtocolModule