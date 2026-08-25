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
local var6 = tModule.array(tModule.valueOf(t))
local var7 = tModule.valueOf(t_1)
local var8 = tModule.valueOf(t_2)
local t_3 = {
	Permissions = t,
	Status = t_1,
	UpsellStatus = t_2,
	PERMISSION_REQUEST_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "PermissionsRequest",
		validateParams = tModule.strictInterface({ permissions = var6 })
	},
	PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "PermissionsRequest",
		validateParams = tModule.strictInterface({ status = var7, missingPermissions = var6 })
	},
	HAS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "HasPermissions",
		validateParams = tModule.strictInterface({ permissions = var6 })
	},
	HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "HasPermissions",
		validateParams = tModule.strictInterface({ status = var7, missingPermissions = var6 })
	},
	SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "SupportsPermissions",
		validateParams = tModule.strictInterface({ includeStatus = tModule.literal(false) })
	},
	SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "SupportsPermissions",
		validateParams = tModule.strictInterface({ permissions = var6 })
	},
	SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "ShouldShowPermissionUpsell",
		validateParams = tModule.strictInterface({ permissions = var6 })
	},
	SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "ShouldShowPermissionUpsell",
		validateParams = tModule.strictInterface({ hiddenUpsellPermissions = var6, upsellStatus = var8 })
	},
	SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "ShouldShowRequestPermissionRationale",
		validateParams = tModule.strictInterface({ permissions = var6 })
	},
	SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "PermissionsProtocol",
		methodName = "ShouldShowRequestPermissionRationale",
		validateParams = tModule.strictInterface({ hiddenUpsellPermissions = var6, upsellStatus = var8 })
	}
}
t_3.__index = t_3

local function getPermissionRequestTelemetryData(p0)
	-- upvalues: t_3 (ref)
	local t = {}
	
	for i, v in pairs(p0) do
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

local function createSequencedProtocolMethodCall(p1, p2, p3, p4, p5)
	-- upvalues: promiseModule (ref), messageBus (ref)
	assert(p3.validateParams(p4))
	local var13 = (p1[p2] or promiseModule.resolve()):finally(function()
		-- upvalues: promiseModule (copy), messageBus (copy), p2 (ref), p3 (ref), p4 (ref), p5 (ref)
		return promiseModule.new(function(p6)
			-- upvalues: messageBus (copy), p2 (copy), p3 (copy), p4 (copy), p5 (copy)
			local var14 = messageBus.Subscriber.new()
			var14:subscribeProtocolMethodResponse(p2, function(p7)
				-- upvalues: var14 (ref), p2 (copy), p6 (ref)
				var14:unsubscribeToProtocolMethodResponse(p2)
				p6(p7)
			end)
			messageBus.publishProtocolMethodRequest(p3, p4, p5)
		end)
	end)
	p1[p2] = var13
	
	return var13
end

function t_3.new()
	-- upvalues: scopedSubscribersForPermissionsProtocol2 (ref), messageBus (ref), t_3 (ref)
	return setmetatable({
		activeCalls = if scopedSubscribersForPermissionsProtocol2 then {} else nil,
		subscriber = if scopedSubscribersForPermissionsProtocol2 then nil else messageBus.Subscriber.new()
	}, t_3)
end

function t_3:hasPermissions(p8)
	-- upvalues: scopedSubscribersForPermissionsProtocol2 (ref), createSequencedProtocolMethodCall (ref), getPermissionRequestTelemetryData (ref), promiseModule (ref), messageBus (ref)
	if scopedSubscribersForPermissionsProtocol2 then
		return createSequencedProtocolMethodCall(self.activeCalls, self.HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, self.HAS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = p8 }, getPermissionRequestTelemetryData(p8))
	end
	local var15 = promiseModule.new(function(p9, _)
		-- upvalues: self (ref)
		local HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = self.HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
		self.subscriber:subscribeProtocolMethodResponse(HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, function(p10)
			-- upvalues: self (copy), HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR (ref), p9 (ref)
			self.subscriber:unsubscribeToProtocolMethodResponse(HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR)
			p9(p10)
		end)
	end)
	messageBus.publishProtocolMethodRequest(self.HAS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = p8 }, getPermissionRequestTelemetryData(p8))
	
	return var15
end

function t_3:requestPermissions(p11)
	-- upvalues: t_3 (ref), promiseModule (ref), scopedSubscribersForPermissionsProtocol2 (ref), createSequencedProtocolMethodCall (ref), getPermissionRequestTelemetryData (ref), messageBus (ref)
	if game:GetFastFlag("DebugRomarkAudioPermissionsBypass") then
		return promiseModule.resolve({ missingPermissions = {}, status = t_3.Status.AUTHORIZED })
	elseif scopedSubscribersForPermissionsProtocol2 then
		return createSequencedProtocolMethodCall(self.activeCalls, self.PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, self.PERMISSION_REQUEST_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = p11 }, getPermissionRequestTelemetryData(p11))
	end
	local var16 = promiseModule.new(function(p12, _)
		-- upvalues: self (ref)
		local PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = self.PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
		self.subscriber:subscribeProtocolMethodResponse(PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, function(p13)
			-- upvalues: self (copy), PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR (ref), p12 (ref)
			self.subscriber:unsubscribeToProtocolMethodResponse(PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR)
			p12(p13)
		end)
	end)
	messageBus.publishProtocolMethodRequest(self.PERMISSION_REQUEST_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = p11 }, getPermissionRequestTelemetryData(p11))
	
	return var16
end

function t_3:getSupportedPermissionsList()
	-- upvalues: scopedSubscribersForPermissionsProtocol2 (ref), createSequencedProtocolMethodCall (ref), promiseModule (ref), messageBus (ref)
	if scopedSubscribersForPermissionsProtocol2 then
		return createSequencedProtocolMethodCall(self.activeCalls, self.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, self.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {})
	end
	local var17 = promiseModule.new(function(p14, _)
		-- upvalues: self (ref)
		local SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = self.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
		self.subscriber:subscribeProtocolMethodResponse(SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, function(p15)
			-- upvalues: self (copy), SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR (ref), p14 (ref)
			self.subscriber:unsubscribeToProtocolMethodResponse(SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR)
			p14(p15)
		end)
	end)
	messageBus.publishProtocolMethodRequest(self.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {})
	
	return var17
end

function t_3:supportsPermissions(p16)
	-- upvalues: var6 (ref), promiseModule (ref)
	assert(var6(p16))
	
	return self:getSupportedPermissionsList():andThen(function(p17)
		-- upvalues: p16 (ref), promiseModule (copy)
		local permissions = p17 and p17.permissions
		
		if not permissions then
			return promiseModule.reject()
		end
		local var19
		for i, v in pairs(p16) do
			var19 = false
			
			for i_1, v_1 in pairs(permissions) do
				if v == v_1 then
					var19 = true
					break
				end
			end
			if not var19 then
				return promiseModule.resolve(false)
			end
		end
		return promiseModule.resolve(true)
	end)
end

function t_3:checkOrRequestPermissions(p18)
	-- upvalues: var6 (ref), promiseModule (ref), t_3 (ref)
	assert(var6(p18))
	
	return self:supportsPermissions(p18):andThen(function(p19)
		-- upvalues: promiseModule (copy), t_3 (copy), self (ref), p18 (ref)
		return if p19 then self:hasPermissions(p18):andThen(function(p20)
			-- upvalues: t_3 (copy), promiseModule (copy), self (copy), p18 (copy)
			return if p20.status == t_3.Status.AUTHORIZED then promiseModule.resolve(p20.status) else self:requestPermissions(p18):andThen(function(p21)
				-- upvalues: promiseModule (copy)
				return promiseModule.resolve(p21.status)
			end)
		end) else promiseModule.resolve(t_3.Status.UNSUPPORTED)
	end, function(_)
		-- upvalues: promiseModule (copy), t_3 (copy)
		return promiseModule.resolve(t_3.Status.UNSUPPORTED)
	end)
end

function t_3:shouldShowUpsell(p22)
	-- upvalues: getFFlagLuaEnableShowUpsellMethod (ref), promiseModule (ref), scopedSubscribersForPermissionsProtocol2 (ref), createSequencedProtocolMethodCall (ref), getPermissionRequestTelemetryData (ref), messageBus (ref)
	if not getFFlagLuaEnableShowUpsellMethod() then
		return promiseModule.resolve({})
	elseif scopedSubscribersForPermissionsProtocol2 then
		return createSequencedProtocolMethodCall(self.activeCalls, self.SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, self.SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = p22 }, getPermissionRequestTelemetryData(p22))
	end
	local var20 = promiseModule.new(function(p23, _)
		-- upvalues: self (ref)
		local SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = self.SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
		self.subscriber:subscribeProtocolMethodResponse(SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, function(p24)
			-- upvalues: self (copy), SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR (ref), p23 (ref)
			self.subscriber:unsubscribeToProtocolMethodResponse(SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR)
			p23(p24)
		end)
	end)
	messageBus.publishProtocolMethodRequest(self.SHOULD_SHOW_PERMISSION_UPSELL_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = p22 }, getPermissionRequestTelemetryData(p22))
	
	return var20
end

function t_3:shouldShowRationale(p25)
	-- upvalues: scopedSubscribersForPermissionsProtocol2 (ref), createSequencedProtocolMethodCall (ref), getPermissionRequestTelemetryData (ref), promiseModule (ref), messageBus (ref)
	if scopedSubscribersForPermissionsProtocol2 then
		return createSequencedProtocolMethodCall(self.activeCalls, self.SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, self.SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = p25 }, getPermissionRequestTelemetryData(p25))
	end
	local var21 = promiseModule.new(function(p26, _)
		-- upvalues: self (ref)
		local SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = self.SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
		self.subscriber:subscribeProtocolMethodResponse(SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, function(p27)
			-- upvalues: self (copy), SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR (ref), p26 (ref)
			self.subscriber:unsubscribeToProtocolMethodResponse(SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR)
			p26(p27)
		end)
	end)
	messageBus.publishProtocolMethodRequest(self.SHOULD_SHOW_PERMISSION_RATIONALE_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { permissions = p25 }, getPermissionRequestTelemetryData(p25))
	
	return var21
end

t_3.default = t_3.new()

return t_3