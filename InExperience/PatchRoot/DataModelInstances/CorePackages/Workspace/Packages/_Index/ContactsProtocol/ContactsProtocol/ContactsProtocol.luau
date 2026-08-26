local parent = script.Parent.Parent
local messageBus = require(parent.MessageBus).MessageBus
local promiseModule = require(parent.Promise)
local tModule = require(parent.t)
local _ = require(script.Parent.ContactsProtocolTypes)
local t = {
	GET_CONTACTS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "ContactsProtocol",
		methodName = "getContacts",
		validateParams = tModule.table
	},
	GET_CONTACTS_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "ContactsProtocol",
		methodName = "getContacts",
		validateParams = tModule.strictInterface({
			firstName = tModule.optional(tModule.string),
			lastName = tModule.optional(tModule.string),
			phoneNumbers = tModule.optional(tModule.table)
		})
	},
	SUPPORTS_CONTACTS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "ContactsProtocol",
		methodName = "SupportsContacts",
		validateParams = tModule.table
	},
	SUPPORTS_CONTACTS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "ContactsProtocol",
		methodName = "SupportsContacts",
		validateParams = tModule.table
	}
}
t.__index = t

function t.new()
	-- upvalues: messageBus (ref), t (ref)
	return setmetatable({ subscriber = messageBus.Subscriber.new() }, t)
end

function t:getContacts()
	-- upvalues: promiseModule (ref), messageBus (ref)
	local var1 = promiseModule.new(function(p1, _)
		-- upvalues: self (ref)
		local GET_CONTACTS_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = self.GET_CONTACTS_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
		self.subscriber:subscribeProtocolMethodResponse(GET_CONTACTS_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, function(p2)
			-- upvalues: self (copy), GET_CONTACTS_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR (ref), p1 (ref)
			self.subscriber:unsubscribeToProtocolMethodResponse(GET_CONTACTS_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR)
			p1(p2)
		end)
	end)
	messageBus.publishProtocolMethodRequest(self.GET_CONTACTS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { includeVariable = false }, {})
	
	return var1
end

function t:supportsContacts()
	-- upvalues: promiseModule (ref), messageBus (ref)
	local var1 = promiseModule.new(function(p1, _)
		-- upvalues: self (ref)
		local SUPPORTS_CONTACTS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = self.SUPPORTS_CONTACTS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
		self.subscriber:subscribeProtocolMethodResponse(SUPPORTS_CONTACTS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR, function(p2)
			-- upvalues: self (copy), SUPPORTS_CONTACTS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR (ref), p1 (ref)
			self.subscriber:unsubscribeToProtocolMethodResponse(SUPPORTS_CONTACTS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR)
			p1(p2.support)
		end)
	end)
	messageBus.publishProtocolMethodRequest(self.SUPPORTS_CONTACTS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {})
	
	return var1
end

t.default = t.new()

return t