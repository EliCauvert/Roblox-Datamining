local Parent = script.Parent.Parent
local MessageBus = require(Parent.MessageBus).MessageBus
local PromiseModule = require(Parent.Promise)
local TModule = require(Parent.t)
local GetFFlagLuaIdentityProtocolModule = require(script.Parent.Flags.getFFlagLuaIdentityProtocol)
local GetFFlagLuaIdentityGetSMSOTPFunction = require(Parent.SharedFlags).GetFFlagLuaIdentityGetSMSOTP
local GetFFlagLuaIdentityGetPhoneNumberFunction = require(Parent.SharedFlags).GetFFlagLuaIdentityGetPhoneNumber
local GetFFlagLuaIdentityVerifySNAFunction = require(Parent.SharedFlags).GetFFlagLuaIdentityVerifySNA
local _ = require(script.Parent.IdentityProtocolTypes)
local StrictInterfaceResult = TModule.strictInterface({ result = TModule.optional(TModule.string) })
local IdentityProtocolModule = {
	GET_PHONE_NUMBER_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "getPhoneNumber",
		validateParams = TModule.table
	},
	GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "getPhoneNumber",
		validateParams = StrictInterfaceResult
	},
	SUPPORTS_GET_PHONE_NUMBER_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "supportsGetPhoneNumber",
		validateParams = TModule.table
	},
	SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "supportsGetPhoneNumber",
		validateParams = TModule.table
	},
	GET_SMS_OTP_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "getSMSOTP",
		validateParams = TModule.table
	},
	GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "getSMSOTP",
		validateParams = StrictInterfaceResult
	},
	SUPPORTS_GET_SMS_OTP_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "supportsGetSMSOTP",
		validateParams = TModule.table
	},
	SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "supportsGetSMSOTP",
		validateParams = TModule.table
	},
	SUPPORTS_VERIFY_SNA_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "supportsVerifySNA",
		validateParams = TModule.table
	},
	SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "supportsVerifySNA",
		validateParams = TModule.table
	},
	VERIFY_SNA_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "verifySNA",
		validateParams = TModule.table
	},
	VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "IdentityProtocol",
		methodName = "verifySNA",
		validateParams = TModule.table
	}
}
IdentityProtocolModule.__index = IdentityProtocolModule

function IdentityProtocolModule.new()
	-- upvalues: MessageBus (copy), IdentityProtocolModule (copy)
	return (setmetatable({ subscriber = MessageBus.Subscriber.new() }, IdentityProtocolModule))
end

function IdentityProtocolModule:supportsVerifySNA()
	-- upvalues: GetFFlagLuaIdentityProtocolModule (copy), GetFFlagLuaIdentityVerifySNAFunction (copy), PromiseModule (copy), MessageBus (copy)
	if GetFFlagLuaIdentityProtocolModule() and GetFFlagLuaIdentityVerifySNAFunction() then
		local NewPromise = PromiseModule.new(function(Callback, _)
			-- upvalues: self (copy)
			local SUPPORTSVERIFYSNAMETHODRESPONSEDESCRIPTOR = self.SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(SUPPORTSVERIFYSNAMETHODRESPONSEDESCRIPTOR, function(p1)
				-- upvalues: self (upval), SUPPORTSVERIFYSNAMETHODRESPONSEDESCRIPTOR (copy), Callback (copy)
				self.subscriber:unsubscribeToProtocolMethodResponse(SUPPORTSVERIFYSNAMETHODRESPONSEDESCRIPTOR)
				Callback(p1.support)
			end)
		end)
		MessageBus.publishProtocolMethodRequest(self.SUPPORTS_VERIFY_SNA_METHOD_REQUEST_DESCRIPTOR, {}, {})
		
		return NewPromise
	else
		return PromiseModule.resolve(false)
	end
end

function IdentityProtocolModule:verifySNA(p1)
	-- upvalues: GetFFlagLuaIdentityProtocolModule (copy), GetFFlagLuaIdentityVerifySNAFunction (copy), PromiseModule (copy), MessageBus (copy)
	if GetFFlagLuaIdentityProtocolModule() and GetFFlagLuaIdentityVerifySNAFunction() then
		local NewPromise = PromiseModule.new(function(Callback, _)
			-- upvalues: self (copy)
			local VERIFYSNAMETHODRESPONSEDESCRIPTOR = self.VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(VERIFYSNAMETHODRESPONSEDESCRIPTOR, function(p2)
				-- upvalues: self (upval), VERIFYSNAMETHODRESPONSEDESCRIPTOR (copy), Callback (copy)
				self.subscriber:unsubscribeToProtocolMethodResponse(VERIFYSNAMETHODRESPONSEDESCRIPTOR)
				Callback(p2.result)
			end)
		end)
		MessageBus.publishProtocolMethodRequest(self.VERIFY_SNA_METHOD_REQUEST_DESCRIPTOR, p1, {})
		
		return NewPromise
	else
		return PromiseModule.resolve(false)
	end
end

function IdentityProtocolModule:getPhoneNumber()
	-- upvalues: GetFFlagLuaIdentityProtocolModule (copy), GetFFlagLuaIdentityGetPhoneNumberFunction (copy), PromiseModule (copy), MessageBus (copy)
	if GetFFlagLuaIdentityProtocolModule() and GetFFlagLuaIdentityGetPhoneNumberFunction() then
		local NewPromise = PromiseModule.new(function(Callback, _)
			-- upvalues: self (copy)
			local GETPHONENUMBERMETHODRESPONSEDESCRIPTOR = self.GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(GETPHONENUMBERMETHODRESPONSEDESCRIPTOR, function(p1)
				-- upvalues: self (upval), GETPHONENUMBERMETHODRESPONSEDESCRIPTOR (copy), Callback (copy)
				self.subscriber:unsubscribeToProtocolMethodResponse(GETPHONENUMBERMETHODRESPONSEDESCRIPTOR)
				Callback(p1.result)
			end)
		end)
		MessageBus.publishProtocolMethodRequest(self.GET_PHONE_NUMBER_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {})
		
		return NewPromise
	else
		return PromiseModule.resolve()
	end
end

function IdentityProtocolModule:supportsGetPhoneNumber()
	-- upvalues: GetFFlagLuaIdentityProtocolModule (copy), GetFFlagLuaIdentityGetPhoneNumberFunction (copy), PromiseModule (copy), MessageBus (copy)
	if GetFFlagLuaIdentityProtocolModule() and GetFFlagLuaIdentityGetPhoneNumberFunction() then
		local NewPromise = PromiseModule.new(function(Callback, _)
			-- upvalues: self (copy)
			local SUPPORTSGETPHONENUMBERMETHODRESPONSEDESCRIPTOR = self.SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(SUPPORTSGETPHONENUMBERMETHODRESPONSEDESCRIPTOR, function(p1)
				-- upvalues: self (upval), SUPPORTSGETPHONENUMBERMETHODRESPONSEDESCRIPTOR (copy), Callback (copy)
				self.subscriber:unsubscribeToProtocolMethodResponse(SUPPORTSGETPHONENUMBERMETHODRESPONSEDESCRIPTOR)
				Callback(p1.support)
			end)
		end)
		MessageBus.publishProtocolMethodRequest(self.SUPPORTS_GET_PHONE_NUMBER_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {})
		
		return NewPromise
	else
		return PromiseModule.resolve()
	end
end

function IdentityProtocolModule:getSMSOTP()
	-- upvalues: GetFFlagLuaIdentityProtocolModule (copy), GetFFlagLuaIdentityGetSMSOTPFunction (copy), PromiseModule (copy), MessageBus (copy)
	if GetFFlagLuaIdentityProtocolModule() and GetFFlagLuaIdentityGetSMSOTPFunction() then
		local NewPromise = PromiseModule.new(function(Callback, _)
			-- upvalues: self (copy)
			local GETSMSOTPMETHODRESPONSEDESCRIPTOR = self.GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(GETSMSOTPMETHODRESPONSEDESCRIPTOR, function(p1)
				-- upvalues: self (upval), GETSMSOTPMETHODRESPONSEDESCRIPTOR (copy), Callback (copy)
				self.subscriber:unsubscribeToProtocolMethodResponse(GETSMSOTPMETHODRESPONSEDESCRIPTOR)
				Callback(p1.result)
			end)
		end)
		MessageBus.publishProtocolMethodRequest(self.GET_SMS_OTP_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {})
		
		return NewPromise
	else
		return PromiseModule.resolve()
	end
end

function IdentityProtocolModule:supportsGetSMSOTP()
	-- upvalues: GetFFlagLuaIdentityProtocolModule (copy), GetFFlagLuaIdentityGetSMSOTPFunction (copy), PromiseModule (copy), MessageBus (copy)
	if GetFFlagLuaIdentityProtocolModule() and GetFFlagLuaIdentityGetSMSOTPFunction() then
		local NewPromise = PromiseModule.new(function(Callback, _)
			-- upvalues: self (copy)
			local SUPPORTSGETSMSOTPMETHODRESPONSEDESCRIPTOR = self.SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR
			self.subscriber:subscribeProtocolMethodResponse(SUPPORTSGETSMSOTPMETHODRESPONSEDESCRIPTOR, function(p1)
				-- upvalues: self (upval), SUPPORTSGETSMSOTPMETHODRESPONSEDESCRIPTOR (copy), Callback (copy)
				self.subscriber:unsubscribeToProtocolMethodResponse(SUPPORTSGETSMSOTPMETHODRESPONSEDESCRIPTOR)
				Callback(p1.support)
			end)
		end)
		MessageBus.publishProtocolMethodRequest(self.SUPPORTS_GET_SMS_OTP_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {})
		
		return NewPromise
	else
		return PromiseModule.resolve()
	end
end

IdentityProtocolModule.default = IdentityProtocolModule.new()

return IdentityProtocolModule