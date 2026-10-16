local Parent = script.Parent.Parent
local MessageBus = require(Parent.MessageBus).MessageBus
local PromiseModule = require(Parent.Promise)
local TModule = require(Parent.t)
local _ = require(script.Parent.ContactsProtocolTypes)
local ContactsProtocolModule = {
	GET_CONTACTS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "ContactsProtocol",
		methodName = "getContacts",
		validateParams = TModule.table
	},
	GET_CONTACTS_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "ContactsProtocol",
		methodName = "getContacts",
		validateParams = TModule.strictInterface({
			firstName = TModule.optional(TModule.string),
			lastName = TModule.optional(TModule.string),
			phoneNumbers = TModule.optional(TModule.table)
		})
	},
	SUPPORTS_CONTACTS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
		protocolName = "ContactsProtocol",
		methodName = "SupportsContacts",
		validateParams = TModule.table
	},
	SUPPORTS_CONTACTS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
		protocolName = "ContactsProtocol",
		methodName = "SupportsContacts",
		validateParams = TModule.table
	}
}
ContactsProtocolModule.__index = ContactsProtocolModule

function ContactsProtocolModule.new() --[[ Line: 55 ]]
	-- upvalues: MessageBus (copy), ContactsProtocolModule (copy)
	return (setmetatable({ subscriber = MessageBus.Subscriber.new() }, ContactsProtocolModule))
end

function ContactsProtocolModule:getContacts() --[[ Line: 68 ]]
	-- upvalues: PromiseModule (copy), MessageBus (copy)
	local NewPromise = PromiseModule.new(function(Callback, _) --[[ Line: 69 ]]
		-- upvalues: self (copy)
		local GETCONTACTSREQUESTPROTOCOLMETHODRESPONSEDESCRIPTOR = self.GET_CONTACTS_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
		self.subscriber:subscribeProtocolMethodResponse(GETCONTACTSREQUESTPROTOCOLMETHODRESPONSEDESCRIPTOR, function(p1) --[[ Line: 71 ]]
			-- upvalues: self (upval), GETCONTACTSREQUESTPROTOCOLMETHODRESPONSEDESCRIPTOR (copy), Callback (copy)
			self.subscriber:unsubscribeToProtocolMethodResponse(GETCONTACTSREQUESTPROTOCOLMETHODRESPONSEDESCRIPTOR)
			Callback(p1)
		end)
	end)
	MessageBus.publishProtocolMethodRequest(self.GET_CONTACTS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { includeVariable = false }, {})
	
	return NewPromise
end

function ContactsProtocolModule:supportsContacts() --[[ Line: 96 ]]
	-- upvalues: PromiseModule (copy), MessageBus (copy)
	local NewPromise = PromiseModule.new(function(Callback, _) --[[ Line: 97 ]]
		-- upvalues: self (copy)
		local SUPPORTSCONTACTSPROTOCOLMETHODRESPONSEDESCRIPTOR = self.SUPPORTS_CONTACTS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR
		self.subscriber:subscribeProtocolMethodResponse(SUPPORTSCONTACTSPROTOCOLMETHODRESPONSEDESCRIPTOR, function(p1) --[[ Line: 99 ]]
			-- upvalues: self (upval), SUPPORTSCONTACTSPROTOCOLMETHODRESPONSEDESCRIPTOR (copy), Callback (copy)
			self.subscriber:unsubscribeToProtocolMethodResponse(SUPPORTSCONTACTSPROTOCOLMETHODRESPONSEDESCRIPTOR)
			Callback(p1.support)
		end)
	end)
	MessageBus.publishProtocolMethodRequest(self.SUPPORTS_CONTACTS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, { includeStatus = false }, {})
	
	return NewPromise
end

ContactsProtocolModule.default = ContactsProtocolModule.new()

return ContactsProtocolModule