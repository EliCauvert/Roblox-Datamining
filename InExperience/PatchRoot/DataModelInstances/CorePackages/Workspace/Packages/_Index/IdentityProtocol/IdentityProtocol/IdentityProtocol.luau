local parent = script.Parent.Parent
local messageBus = require(parent.MessageBus).MessageBus
local promiseModule = require(parent.Promise)
local tModule = require(parent.t)
local getFFlagLuaIdentityProtocolModule = require(script.Parent.Flags.getFFlagLuaIdentityProtocol)
local getFFlagLuaIdentityGetSMSOTP = require(parent.SharedFlags).GetFFlagLuaIdentityGetSMSOTP
local getFFlagLuaIdentityGetPhoneNumber = require(parent.SharedFlags).GetFFlagLuaIdentityGetPhoneNumber
local getFFlagLuaIdentityVerifySNA = require(parent.SharedFlags).GetFFlagLuaIdentityVerifySNA
local _ = require(script.Parent.IdentityProtocolTypes)
local var1 = tModule.strictInterface({ result = tModule.optional(tModule.string) })
local t = {
	GET_PHONE_NUMBER_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "getPhoneNumber",
		validateParams = tModule.table
	},
	GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "getPhoneNumber",
		validateParams = var1
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
		validateParams = var1
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

function t.new()
	-- upvalues: messageBus (ref), t (ref)
	return setmetatable({ subscriber = messageBus.Subscriber.new() }, t)
end

function t:supportsVerifySNA()
	-- upvalues: getFFlagLuaIdentityProtocolModule (ref), getFFlagLuaIdentityVerifySNA (ref), promiseModule (ref), messageBus (ref)
	if getFFlagLuaIdentityProtocolModule() and getFFlagLuaIdentityVerifySNA() then
		local var2 = promiseModule.new(function(p1, _)
			-- upvalues: self (ref)
			local SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR = self.SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR, function(p2)
				-- upvalues: self (copy), SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR (ref), p1 (ref)
				self.subscriber:unsubscribeToProtocolMethodResponse(SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR)
				p1(p2.support)
			end)
		end)
		messageBus.publishProtocolMethodRequest(self.SUPPORTS_VERIFY_SNA_METHOD_REQUEST_DESCRIPTOR, {}, {})
		
		return var2
	end
	return promiseModule.resolve(false)
end

function t:verifySNA(p1)
	-- upvalues: getFFlagLuaIdentityProtocolModule (ref), getFFlagLuaIdentityVerifySNA (ref), promiseModule (ref), messageBus (ref)
	if getFFlagLuaIdentityProtocolModule() and getFFlagLuaIdentityVerifySNA() then
		local var2 = promiseModule.new(function(p2, _)
			-- upvalues: self (ref)
			local VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR = self.VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR, function(p3)
				-- upvalues: self (copy), VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR (ref), p2 (ref)
				self.subscriber:unsubscribeToProtocolMethodResponse(VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR)
				p2(p3.result)
			end)
		end)
		messageBus.publishProtocolMethodRequest(self.VERIFY_SNA_METHOD_REQUEST_DESCRIPTOR, p1, {})
		
		return var2
	end
	return promiseModule.resolve(false)
end

function t:getPhoneNumber()
	-- upvalues: getFFlagLuaIdentityProtocolModule (ref), getFFlagLuaIdentityGetPhoneNumber (ref), promiseModule (ref), messageBus (ref)
	if getFFlagLuaIdentityProtocolModule() and getFFlagLuaIdentityGetPhoneNumber() then
		local var2 = promiseModule.new(function(p1, _)
			-- upvalues: self (ref)
			local GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR = self.GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR, function(p2)
				-- upvalues: self (copy), GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR (ref), p1 (ref)
				self.subscriber:unsubscribeToProtocolMethodResponse(GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR)
				p1(p2.result)
			end)
		end)
		messageBus.publishProtocolMethodRequest(self.GET_PHONE_NUMBER_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {})
		
		return var2
	end
	return promiseModule.resolve()
end

function t:supportsGetPhoneNumber()
	-- upvalues: getFFlagLuaIdentityProtocolModule (ref), getFFlagLuaIdentityGetPhoneNumber (ref), promiseModule (ref), messageBus (ref)
	if getFFlagLuaIdentityProtocolModule() and getFFlagLuaIdentityGetPhoneNumber() then
		local var2 = promiseModule.new(function(p1, _)
			-- upvalues: self (ref)
			local SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR = self.SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR, function(p2)
				-- upvalues: self (copy), SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR (ref), p1 (ref)
				self.subscriber:unsubscribeToProtocolMethodResponse(SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR)
				p1(p2.support)
			end)
		end)
		messageBus.publishProtocolMethodRequest(self.SUPPORTS_GET_PHONE_NUMBER_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {})
		
		return var2
	end
	return promiseModule.resolve()
end

function t:getSMSOTP()
	-- upvalues: getFFlagLuaIdentityProtocolModule (ref), getFFlagLuaIdentityGetSMSOTP (ref), promiseModule (ref), messageBus (ref)
	if getFFlagLuaIdentityProtocolModule() and getFFlagLuaIdentityGetSMSOTP() then
		local var2 = promiseModule.new(function(p1, _)
			-- upvalues: self (ref)
			local GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR = self.GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR, function(p2)
				-- upvalues: self (copy), GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR (ref), p1 (ref)
				self.subscriber:unsubscribeToProtocolMethodResponse(GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR)
				p1(p2.result)
			end)
		end)
		messageBus.publishProtocolMethodRequest(self.GET_SMS_OTP_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {})
		
		return var2
	end
	return promiseModule.resolve()
end

function t:supportsGetSMSOTP()
	-- upvalues: getFFlagLuaIdentityProtocolModule (ref), getFFlagLuaIdentityGetSMSOTP (ref), promiseModule (ref), messageBus (ref)
	if getFFlagLuaIdentityProtocolModule() and getFFlagLuaIdentityGetSMSOTP() then
		local var2 = promiseModule.new(function(p1, _)
			-- upvalues: self (ref)
			local SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR = self.SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR, function(p2)
				-- upvalues: self (copy), SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR (ref), p1 (ref)
				self.subscriber:unsubscribeToProtocolMethodResponse(SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR)
				p1(p2.support)
			end)
		end)
		messageBus.publishProtocolMethodRequest(self.SUPPORTS_GET_SMS_OTP_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {})
		
		return var2
	end
	return promiseModule.resolve()
end

t.default = t.new()

return t