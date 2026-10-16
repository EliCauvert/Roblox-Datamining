local Parent = script.Parent.Parent
local MessageBus = require(Parent.MessageBus).MessageBus
local PromiseModule = require(Parent.Promise)
local TModule = require(Parent.t)
local _ = require(script.Parent.SMSProtocolTypes)
local SMSProtocolModule = {
	SEND_SMS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "SMSProtocol",
		methodName = "sendSMS",
		validateParams = TModule.strictInterface({ address = TModule.string, message = TModule.string })
	},
	SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "SMSProtocol",
		methodName = "sendSMS",
		validateParams = TModule.strictInterface({ sent = TModule.optional(TModule.boolean) })
	},
	SUPPORTS_SMS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "SMSProtocol",
		methodName = "supportsSMS",
		validateParams = TModule.table
	},
	SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "SMSProtocol",
		methodName = "supportsSMS",
		validateParams = TModule.table
	}
}
SMSProtocolModule.__index = SMSProtocolModule

function SMSProtocolModule.new() --[[ Line: 59 ]]
	-- upvalues: MessageBus (copy), SMSProtocolModule (copy)
	return (setmetatable({ subscriber = MessageBus.Subscriber.new() }, SMSProtocolModule))
end

function SMSProtocolModule:sendSMS(p1) --[[ Line: 72 ]]
	-- upvalues: PromiseModule (copy), MessageBus (copy)
	local NewPromise = PromiseModule.new(function(Callback, _) --[[ Line: 73 ]]
		-- upvalues: self (copy)
		local SENDSMSPROTOCOLMETHODRESPONSEDESCRIPTOR = self.SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
		self.subscriber:subscribeProtocolMethodResponse(SENDSMSPROTOCOLMETHODRESPONSEDESCRIPTOR, function(p2) --[[ Line: 75 ]]
			-- upvalues: self (upval), SENDSMSPROTOCOLMETHODRESPONSEDESCRIPTOR (copy), Callback (copy)
			self.subscriber:unsubscribeToProtocolMethodResponse(SENDSMSPROTOCOLMETHODRESPONSEDESCRIPTOR)
			Callback(p2)
		end)
	end)
	MessageBus.publishProtocolMethodRequest(self.SEND_SMS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, p1, {})
	
	return NewPromise
end

function SMSProtocolModule:supportsSMS() --[[ Line: 93 ]]
	-- upvalues: PromiseModule (copy), MessageBus (copy)
	local NewPromise = PromiseModule.new(function(Callback, _) --[[ Line: 94 ]]
		-- upvalues: self (copy)
		local SUPPORTSSMSPROTOCOLMETHODRESPONSEDESCRIPTOR = self.SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
		self.subscriber:subscribeProtocolMethodResponse(SUPPORTSSMSPROTOCOLMETHODRESPONSEDESCRIPTOR, function(p1) --[[ Line: 96 ]]
			-- upvalues: self (upval), SUPPORTSSMSPROTOCOLMETHODRESPONSEDESCRIPTOR (copy), Callback (copy)
			self.subscriber:unsubscribeToProtocolMethodResponse(SUPPORTSSMSPROTOCOLMETHODRESPONSEDESCRIPTOR)
			Callback(p1.support)
		end)
	end)
	MessageBus.publishProtocolMethodRequest(self.SUPPORTS_SMS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {})
	
	return NewPromise
end

SMSProtocolModule.default = SMSProtocolModule.new()

return SMSProtocolModule