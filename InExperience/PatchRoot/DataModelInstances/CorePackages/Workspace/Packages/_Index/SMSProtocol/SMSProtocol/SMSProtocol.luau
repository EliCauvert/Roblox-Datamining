local parent = script.Parent.Parent
local messageBus = require(parent.MessageBus).MessageBus
local promiseModule = require(parent.Promise)
local tModule = require(parent.t)
local _ = require(script.Parent.SMSProtocolTypes)
local t = {
	SEND_SMS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "SMSProtocol",
		methodName = "sendSMS",
		validateParams = tModule.strictInterface({ address = tModule.string, message = tModule.string })
	},
	SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "SMSProtocol",
		methodName = "sendSMS",
		validateParams = tModule.strictInterface({ sent = tModule.optional(tModule.boolean) })
	},
	SUPPORTS_SMS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "SMSProtocol",
		methodName = "supportsSMS",
		validateParams = tModule.table
	},
	SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "SMSProtocol",
		methodName = "supportsSMS",
		validateParams = tModule.table
	}
}
t.__index = t

function t.new()
	-- upvalues: messageBus (ref), t (ref)
	return setmetatable({ subscriber = messageBus.Subscriber.new() }, t)
end

function t:sendSMS(p1)
	-- upvalues: promiseModule (ref), messageBus (ref)
	local var1 = promiseModule.new(function(p2, _)
		-- upvalues: self (ref)
		local SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = self.SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
		self.subscriber:subscribeProtocolMethodResponse(SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, function(p3)
			-- upvalues: self (copy), SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR (ref), p2 (ref)
			self.subscriber:unsubscribeToProtocolMethodResponse(SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR)
			p2(p3)
		end)
	end)
	messageBus.publishProtocolMethodRequest(self.SEND_SMS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, p1, {})
	
	return var1
end

function t:supportsSMS()
	-- upvalues: promiseModule (ref), messageBus (ref)
	local var1 = promiseModule.new(function(p1, _)
		-- upvalues: self (ref)
		local SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = self.SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
		self.subscriber:subscribeProtocolMethodResponse(SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, function(p2)
			-- upvalues: self (copy), SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR (ref), p1 (ref)
			self.subscriber:unsubscribeToProtocolMethodResponse(SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR)
			p1(p2.support)
		end)
	end)
	messageBus.publishProtocolMethodRequest(self.SUPPORTS_SMS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {})
	
	return var1
end

t.default = t.new()

return t