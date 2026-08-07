local parent = script.Parent.Parent
local messageBus = require(parent.MessageBus).MessageBus
local promiseModule = require(parent.Promise)
local tModule = require(parent.t)
local getFFlagLuaIdentityProtocolModule = require(script.Parent.Flags.getFFlagLuaIdentityProtocol)
local getFFlagLuaIdentityGetSMSOTP = require(parent.SharedFlags).GetFFlagLuaIdentityGetSMSOTP
local getFFlagLuaIdentityGetPhoneNumber = require(parent.SharedFlags).GetFFlagLuaIdentityGetPhoneNumber
local getFFlagLuaIdentityVerifySNA = require(parent.SharedFlags).GetFFlagLuaIdentityVerifySNA
local _ = require(script.Parent.IdentityProtocolTypes)
local var3 = tModule.strictInterface({ result = tModule.optional(tModule.string) })
local t = {
	GET_PHONE_NUMBER_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "getPhoneNumber",
		validateParams = tModule.table
	},
	GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "getPhoneNumber",
		validateParams = var3
	},
	SUPPORTS_GET_PHONE_NUMBER_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "supportsGetPhoneNumber",
		validateParams = tModule.table
	},
	SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "supportsGetPhoneNumber",
		validateParams = tModule.table
	},
	GET_SMS_OTP_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "getSMSOTP",
		validateParams = tModule.table
	},
	GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "getSMSOTP",
		validateParams = var3
	},
	SUPPORTS_GET_SMS_OTP_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "supportsGetSMSOTP",
		validateParams = tModule.table
	},
	SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "supportsGetSMSOTP",
		validateParams = tModule.table
	},
	SUPPORTS_VERIFY_SNA_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "supportsVerifySNA",
		validateParams = tModule.table
	},
	SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "supportsVerifySNA",
		validateParams = tModule.table
	},
	VERIFY_SNA_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "verifySNA",
		validateParams = tModule.table
	},
	VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "verifySNA",
		validateParams = tModule.table
	}
}
t.__index = t

function t.new() --[[ line: 101 ]]
	-- upvalues: messageBus (ref), t (ref)
	return setmetatable({ subscriber = messageBus.Subscriber.new() }, t)
end

function t:supportsVerifySNA() --[[ line: 113 ]]
	-- upvalues: getFFlagLuaIdentityProtocolModule (ref), getFFlagLuaIdentityVerifySNA (ref), promiseModule (ref), messageBus (ref)
	if getFFlagLuaIdentityProtocolModule() and getFFlagLuaIdentityVerifySNA() then
		local var5 = promiseModule.new(function(p0, _) --[[ line: 118 ]]
			-- upvalues: self (ref)
			local SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR = self.SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR, function(p1) --[[ line: 120 ]]
				-- upvalues: self (copy), SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR (ref), p0 (ref)
				self.subscriber:unsubscribeToProtocolMethodResponse(SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR)
				p0(p1.support)
			end)
		end)
		messageBus.publishProtocolMethodRequest(self.SUPPORTS_VERIFY_SNA_METHOD_REQUEST_DESCRIPTOR, {}, {})
		
		return var5
	end
	return promiseModule.resolve(false)
end

function t:verifySNA(p2) --[[ line: 142 ]]
	-- upvalues: getFFlagLuaIdentityProtocolModule (ref), getFFlagLuaIdentityVerifySNA (ref), promiseModule (ref), messageBus (ref)
	if getFFlagLuaIdentityProtocolModule() and getFFlagLuaIdentityVerifySNA() then
		local var6 = promiseModule.new(function(p3, _) --[[ line: 147 ]]
			-- upvalues: self (ref)
			local VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR = self.VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR, function(p4) --[[ line: 149 ]]
				-- upvalues: self (copy), VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR (ref), p3 (ref)
				self.subscriber:unsubscribeToProtocolMethodResponse(VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR)
				p3(p4.result)
			end)
		end)
		messageBus.publishProtocolMethodRequest(self.VERIFY_SNA_METHOD_REQUEST_DESCRIPTOR, p2, {})
		
		return var6
	end
	return promiseModule.resolve(false)
end

function t:getPhoneNumber() --[[ line: 168 ]]
	-- upvalues: getFFlagLuaIdentityProtocolModule (ref), getFFlagLuaIdentityGetPhoneNumber (ref), promiseModule (ref), messageBus (ref)
	if getFFlagLuaIdentityProtocolModule() and getFFlagLuaIdentityGetPhoneNumber() then
		local var7 = promiseModule.new(function(p5, _) --[[ line: 172 ]]
			-- upvalues: self (ref)
			local GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR = self.GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR, function(p6) --[[ line: 174 ]]
				-- upvalues: self (copy), GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR (ref), p5 (ref)
				self.subscriber:unsubscribeToProtocolMethodResponse(GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR)
				p5(p6.result)
			end)
		end)
		messageBus.publishProtocolMethodRequest(self.GET_PHONE_NUMBER_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {})
		
		return var7
	end
	return promiseModule.resolve()
end

function t:supportsGetPhoneNumber() --[[ line: 197 ]]
	-- upvalues: getFFlagLuaIdentityProtocolModule (ref), getFFlagLuaIdentityGetPhoneNumber (ref), promiseModule (ref), messageBus (ref)
	if getFFlagLuaIdentityProtocolModule() and getFFlagLuaIdentityGetPhoneNumber() then
		local var8 = promiseModule.new(function(p7, _) --[[ line: 202 ]]
			-- upvalues: self (ref)
			local SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR = self.SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR, function(p8) --[[ line: 204 ]]
				-- upvalues: self (copy), SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR (ref), p7 (ref)
				self.subscriber:unsubscribeToProtocolMethodResponse(SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR)
				p7(p8.support)
			end)
		end)
		messageBus.publishProtocolMethodRequest(self.SUPPORTS_GET_PHONE_NUMBER_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {})
		
		return var8
	end
	return promiseModule.resolve()
end

function t:getSMSOTP() --[[ line: 227 ]]
	-- upvalues: getFFlagLuaIdentityProtocolModule (ref), getFFlagLuaIdentityGetSMSOTP (ref), promiseModule (ref), messageBus (ref)
	if getFFlagLuaIdentityProtocolModule() and getFFlagLuaIdentityGetSMSOTP() then
		local var9 = promiseModule.new(function(p9, _) --[[ line: 231 ]]
			-- upvalues: self (ref)
			local GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR = self.GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR, function(p10) --[[ line: 233 ]]
				-- upvalues: self (copy), GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR (ref), p9 (ref)
				self.subscriber:unsubscribeToProtocolMethodResponse(GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR)
				p9(p10.result)
			end)
		end)
		messageBus.publishProtocolMethodRequest(self.GET_SMS_OTP_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {})
		
		return var9
	end
	return promiseModule.resolve()
end

function t:supportsGetSMSOTP() --[[ line: 256 ]]
	-- upvalues: getFFlagLuaIdentityProtocolModule (ref), getFFlagLuaIdentityGetSMSOTP (ref), promiseModule (ref), messageBus (ref)
	if getFFlagLuaIdentityProtocolModule() and getFFlagLuaIdentityGetSMSOTP() then
		local var10 = promiseModule.new(function(p11, _) --[[ line: 261 ]]
			-- upvalues: self (ref)
			local SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR = self.SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR, function(p12) --[[ line: 263 ]]
				-- upvalues: self (copy), SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR (ref), p11 (ref)
				self.subscriber:unsubscribeToProtocolMethodResponse(SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR)
				p11(p12.support)
			end)
		end)
		messageBus.publishProtocolMethodRequest(self.SUPPORTS_GET_SMS_OTP_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {})
		
		return var10
	end
	return promiseModule.resolve()
end

t.default = t.new()

return t