local parent = script.Parent.Parent
local messageBus = require(parent.MessageBus).MessageBus
local promiseModule = require(parent.Promise)
local tModule = require(parent.t)
local getFFlagLuaEnableShowUpsellMethod = require(parent.SharedFlags).GetFFlagLuaEnableShowUpsellMethod
local scopedSubscribersForPermissionsProtocol2 = game:DefineFastFlag("ScopedSubscribersForPermissionsProtocol2", false)
local _ = require(script.Parent.PermissionsProtocolTypes)
game:DefineFastFlag("DebugRomarkAudioPermissionsBypass", false)
local t = {
	CAMERA_ACCESS = "CAMERA_ACCESS",
	MICROPHONE_ACCESS = "MICROPHONE_ACCESS",
	LOCAL_NETWORK = "LOCAL_NETWORK",
	CONTACTS_ACCESS = "CONTACTS_ACCESS",
	WRITE_MEDIA_STORAGE = "WRITE_MEDIA_STORAGE",
	POST_NOTIFICATIONS = "POST_NOTIFICATIONS"
}
local t_1 = {
	AUTHORIZED = "AUTHORIZED",
	DENIED = "DENIED",
	RESTRICTED = "RESTRICTED",
	UNSUPPORTED = "UNSUPPORTED"
}
local t_2 = {
	SHOW = "SHOW",
	HIDE = "HIDE",
	UNSUPPORTED = "UNSUPPORTED"
}
local var1 = tModule.array(tModule.valueOf(t))
local var2 = tModule.valueOf(t_1)
local var3 = tModule.valueOf(t_2)
local t_3 = {
	Permissions = t,
	Status = t_1,
	UpsellStatus = t_2,
	PERMISSION_REQUEST_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "PermissionsRequest",
		validateParams = tModule.strictInterface({ permissions = var1 })
	},
	PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "PermissionsRequest",
		validateParams = tModule.strictInterface({ status = var2, missingPermissions = var1 })
	},
	HAS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "HasPermissions",
		validateParams = tModule.strictInterface({ permissions = var1 })
	},
	HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "HasPermissions",
		validateParams = tModule.strictInterface({ status = var2, missingPermissions = var1 })
	},
	SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "SupportsPermissions",
		validateParams = tModule.strictInterface({ includeStatus = tModule.literal(false) })
	},
	SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "SupportsPermissions",
		validateParams = tModule.strictInterface({ permissions = var1 })
	},
	SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "ShouldShowPermissionUpsell",
		validateParams = tModule.strictInterface({ permissions = var1 })
	},
	SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "ShouldShowPermissionUpsell",
		validateParams = tModule.strictInterface({ hiddenUpsellPermissions = var1, upsellStatus = var3 })
	},
	SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "ShouldShowRequestPermissionRationale",
		validateParams = tModule.strictInterface({ permissions = var1 })
	},
	SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "ShouldShowRequestPermissionRationale",
		validateParams = tModule.strictInterface({ hiddenUpsellPermissions = var1, upsellStatus = var3 })
	}
}
t_3.__index = t_3

local function getPermissionRequestTelemetryData(p1)
	-- upvalues: t_3 (ref)
	local t = {}
	
	for i, v in pairs(p1) do
		if v == t_3.Permissions.CAMERA_ACCESS then
			t.camera_access_requested = ""
		end
		if v == t_3.Permissions.MICROPHONE_ACCESS then
			t.microphone_access_requested = ""
		end
		if v == t_3.Permissions.LOCAL_NETWORK then
			t.local_network_requested = ""
		end
		if v == t_3.Permissions.CONTACTS_ACCESS then
			t.contacts_access_requested = ""
		end
	end
	return t
end

local function createSequencedProtocolMethodCall(p2, p3, p4, p5, p6)
	-- upvalues: promiseModule (ref), messageBus (ref)
	assert(p4.validateParams(p5))
	local var4 = (p2[p3] or promiseModule.resolve()):finally(function()
		-- upvalues: promiseModule (copy), messageBus (copy), p3 (ref), p4 (ref), p5 (ref), p6 (ref)
		return promiseModule.new(function(p7)
			-- upvalues: messageBus (copy), p3 (copy), p4 (copy), p5 (copy), p6 (copy)
			local var5 = messageBus.Subscriber.new()
			var5:subscribeProtocolMethodResponse(p3, function(p8)
				-- upvalues: var5 (ref), p3 (copy), p7 (ref)
				var5:unsubscribeToProtocolMethodResponse(p3)
				p7(p8)
			end)
			messageBus.publishProtocolMethodRequest(p4, p5, p6)
		end)
	end)
	p2[p3] = var4
	
	return var4
end

function t_3.new()
	-- upvalues: scopedSubscribersForPermissionsProtocol2 (ref), messageBus (ref), t_3 (ref)
	return setmetatable({
		activeCalls = if scopedSubscribersForPermissionsProtocol2 then {} else nil,
		subscriber = if scopedSubscribersForPermissionsProtocol2 then nil else messageBus.Subscriber.new()
	}, t_3)
end

function t_3:hasPermissions(p2)
	-- upvalues: scopedSubscribersForPermissionsProtocol2 (ref), createSequencedProtocolMethodCall (ref), getPermissionRequestTelemetryData (ref), promiseModule (ref), messageBus (ref)
	if scopedSubscribersForPermissionsProtocol2 then
		return createSequencedProtocolMethodCall(self.activeCalls, self.HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, self.HAS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = p2 }, getPermissionRequestTelemetryData(p2))
	end
	local var4 = promiseModule.new(function(p3, _)
		-- upvalues: self (ref)
		local HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = self.HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
		self.subscriber:subscribeProtocolMethodResponse(HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, function(p4)
			-- upvalues: self (copy), HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR (ref), p3 (ref)
			self.subscriber:unsubscribeToProtocolMethodResponse(HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR)
			p3(p4)
		end)
	end)
	messageBus.publishProtocolMethodRequest(self.HAS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = p2 }, getPermissionRequestTelemetryData(p2))
	
	return var4
end

function t_3:requestPermissions(p2)
	-- upvalues: t_3 (ref), promiseModule (ref), scopedSubscribersForPermissionsProtocol2 (ref), createSequencedProtocolMethodCall (ref), getPermissionRequestTelemetryData (ref), messageBus (ref)
	if game:GetFastFlag("DebugRomarkAudioPermissionsBypass") then
		return promiseModule.resolve({ missingPermissions = {}, status = t_3.Status.AUTHORIZED })
	elseif scopedSubscribersForPermissionsProtocol2 then
		return createSequencedProtocolMethodCall(self.activeCalls, self.PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, self.PERMISSION_REQUEST_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = p2 }, getPermissionRequestTelemetryData(p2))
	end
	local var4 = promiseModule.new(function(p3, _)
		-- upvalues: self (ref)
		local PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = self.PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
		self.subscriber:subscribeProtocolMethodResponse(PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, function(p4)
			-- upvalues: self (copy), PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR (ref), p3 (ref)
			self.subscriber:unsubscribeToProtocolMethodResponse(PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR)
			p3(p4)
		end)
	end)
	messageBus.publishProtocolMethodRequest(self.PERMISSION_REQUEST_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = p2 }, getPermissionRequestTelemetryData(p2))
	
	return var4
end

function t_3:getSupportedPermissionsList()
	-- upvalues: scopedSubscribersForPermissionsProtocol2 (ref), createSequencedProtocolMethodCall (ref), promiseModule (ref), messageBus (ref)
	if scopedSubscribersForPermissionsProtocol2 then
		return createSequencedProtocolMethodCall(self.activeCalls, self.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, self.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {})
	end
	local var4 = promiseModule.new(function(p2, _)
		-- upvalues: self (ref)
		local SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = self.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
		self.subscriber:subscribeProtocolMethodResponse(SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, function(p3)
			-- upvalues: self (copy), SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR (ref), p2 (ref)
			self.subscriber:unsubscribeToProtocolMethodResponse(SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR)
			p2(p3)
		end)
	end)
	messageBus.publishProtocolMethodRequest(self.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {})
	
	return var4
end

function t_3:supportsPermissions(p2)
	-- upvalues: var1 (ref), promiseModule (ref)
	assert(var1(p2))
	
	return self:getSupportedPermissionsList():andThen(function(p3)
		-- upvalues: p2 (ref), promiseModule (copy)
		local permissions = p3 and p3.permissions
		
		if not permissions then
			return promiseModule.reject()
		end
		local var4
		for i, v in pairs(p2) do
			var4 = false
			
			for i_1, v_1 in pairs(permissions) do
				if v == v_1 then
					var4 = true
					break
				end
			end
			if not var4 then
				return promiseModule.resolve(false)
			end
		end
		return promiseModule.resolve(true)
	end)
end

function t_3:checkOrRequestPermissions(p4)
	-- upvalues: var1 (ref), promiseModule (ref), t_3 (ref)
	assert(var1(p4))
	
	return self:supportsPermissions(p4):andThen(function(p5)
		-- upvalues: promiseModule (copy), t_3 (copy), self (ref), p4 (ref)
		return if p5 then self:hasPermissions(p4):andThen(function(p6)
			-- upvalues: t_3 (copy), promiseModule (copy), self (copy), p4 (copy)
			return if p6.status == t_3.Status.AUTHORIZED then promiseModule.resolve(p6.status) else self:requestPermissions(p4):andThen(function(p7)
				-- upvalues: promiseModule (copy)
				return promiseModule.resolve(p7.status)
			end)
		end) else promiseModule.resolve(t_3.Status.UNSUPPORTED)
	end, function(_)
		-- upvalues: promiseModule (copy), t_3 (copy)
		return promiseModule.resolve(t_3.Status.UNSUPPORTED)
	end)
end

function t_3:shouldShowUpsell(p4)
	-- upvalues: getFFlagLuaEnableShowUpsellMethod (ref), promiseModule (ref), scopedSubscribersForPermissionsProtocol2 (ref), createSequencedProtocolMethodCall (ref), getPermissionRequestTelemetryData (ref), messageBus (ref)
	if not getFFlagLuaEnableShowUpsellMethod() then
		return promiseModule.resolve({})
	elseif scopedSubscribersForPermissionsProtocol2 then
		return createSequencedProtocolMethodCall(self.activeCalls, self.SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, self.SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = p4 }, getPermissionRequestTelemetryData(p4))
	end
	local var5 = promiseModule.new(function(p5, _)
		-- upvalues: self (ref)
		local SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = self.SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
		self.subscriber:subscribeProtocolMethodResponse(SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, function(p6)
			-- upvalues: self (copy), SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR (ref), p5 (ref)
			self.subscriber:unsubscribeToProtocolMethodResponse(SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR)
			p5(p6)
		end)
	end)
	messageBus.publishProtocolMethodRequest(self.SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = p4 }, getPermissionRequestTelemetryData(p4))
	
	return var5
end

function t_3:shouldShowRationale(p4)
	-- upvalues: scopedSubscribersForPermissionsProtocol2 (ref), createSequencedProtocolMethodCall (ref), getPermissionRequestTelemetryData (ref), promiseModule (ref), messageBus (ref)
	if scopedSubscribersForPermissionsProtocol2 then
		return createSequencedProtocolMethodCall(self.activeCalls, self.SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, self.SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = p4 }, getPermissionRequestTelemetryData(p4))
	end
	local var5 = promiseModule.new(function(p5, _)
		-- upvalues: self (ref)
		local SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = self.SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
		self.subscriber:subscribeProtocolMethodResponse(SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, function(p6)
			-- upvalues: self (copy), SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR (ref), p5 (ref)
			self.subscriber:unsubscribeToProtocolMethodResponse(SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR)
			p5(p6)
		end)
	end)
	messageBus.publishProtocolMethodRequest(self.SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = p4 }, getPermissionRequestTelemetryData(p4))
	
	return var5
end

t_3.default = t_3.new()

return t_3