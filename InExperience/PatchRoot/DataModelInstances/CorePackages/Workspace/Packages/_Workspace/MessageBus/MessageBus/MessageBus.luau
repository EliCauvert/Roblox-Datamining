local MessageBusService = game:GetService("MessageBusService")
local _ = require(script.Parent.MessageBusTypes)
local DisableMessageBusUnSubscribeError = game:DefineFastFlag("DisableMessageBusUnSubscribeError", false)
local EnableMessageBusUnSubscribeErrorTelemetry = game:DefineFastFlag("EnableMessageBusUnSubscribeErrorTelemetry", false)
local MessageBusModule = {}
MessageBusModule.__index = MessageBusModule

function MessageBusModule.publish(p1, p2)
	-- upvalues: MessageBusService (copy)
	assert(p1.validateParams(p2))
	MessageBusService:Publish(p1.mid, p2)
end

function MessageBusModule.publishProtocolMethodRequest(p1, Message, CustomTelemetryData)
	-- upvalues: MessageBusService (copy)
	assert(p1.validateParams(Message))
	MessageBusService:PublishProtocolMethodRequest(p1.protocolName, p1.methodName, Message, CustomTelemetryData)
end

function MessageBusModule.publishProtocolMethodResponse(p1, Message, ResponseCode, CustomTelemetryData)
	-- upvalues: MessageBusService (copy)
	assert(p1.validateParams(Message))
	MessageBusService:PublishProtocolMethodResponse(p1.protocolName, p1.methodName, Message, ResponseCode, CustomTelemetryData)
end

function MessageBusModule.getLast(p1)
	-- upvalues: MessageBusService (copy)
	local Last = MessageBusService:GetLast(p1.mid)
	
	if Last == nil then
		return nil
	else
		assert(p1.validateParams(Last))
		
		return Last
	end
end

function MessageBusModule.getMessageId(DomainName, MessageName)
	-- upvalues: MessageBusService (copy)
	return MessageBusService:GetMessageId(DomainName, MessageName)
end

function MessageBusModule.getProtocolMethodRequestMessageId(ProtocolName, MethodName)
	-- upvalues: MessageBusService (copy)
	return MessageBusService:GetProtocolMethodRequestMessageId(ProtocolName, MethodName)
end

function MessageBusModule.getProtocolMethodResponseMessageId(ProtocolName, MethodName)
	-- upvalues: MessageBusService (copy)
	return MessageBusService:GetProtocolMethodResponseMessageId(ProtocolName, MethodName)
end

function MessageBusModule.call(p1, Input)
	-- upvalues: MessageBusService (copy)
	assert(p1.validateParams(Input))
	
	return MessageBusService:Call(p1.fid, Input)
end

local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy)
	return (setmetatable({ connections = {} }, Module))
end

function Module.getSubscriptionCount(p1): number
	local Count = 0
	
	for _ in pairs(p1.connections) do
		Count += 1
	end
	return Count
end

function Module:subscribe(p2, Callback, p3, p4)
	-- upvalues: MessageBusService (copy)
	local Sticky = p3 == nil or p3
	local P23 = p4 ~= nil and p4
	local Mid = p2.mid
	
	if self.connections[Mid] ~= nil then
		self:unsubscribe(p2)
	end
	self.connections[Mid] = MessageBusService:Subscribe(Mid, Callback, P23, Sticky)
end

function Module:subscribeProtocolMethodRequest(p2, Callback, p3, p4)
	-- upvalues: MessageBusModule (copy), MessageBusService (copy)
	local Sticky = p3 == nil or p3
	local P28 = p4 ~= nil and p4
	local ProtocolName = p2.protocolName
	local MethodName = p2.methodName
	local ProtocolMethodRequestMessageId = MessageBusModule.getProtocolMethodRequestMessageId(ProtocolName, MethodName)
	
	if self.connections[ProtocolMethodRequestMessageId] ~= nil then
		self:unsubscribeWithMsgId(ProtocolMethodRequestMessageId)
	end
	self.connections[ProtocolMethodRequestMessageId] = MessageBusService:SubscribeToProtocolMethodRequest(ProtocolName, MethodName, Callback, P28, Sticky)
end

function Module:subscribeProtocolMethodResponse(p2, Callback, p3, p4)
	-- upvalues: MessageBusModule (copy), MessageBusService (copy)
	local Sticky = p3 == nil or p3
	local P33 = p4 ~= nil and p4
	local ProtocolName = p2.protocolName
	local MethodName = p2.methodName
	local ProtocolMethodResponseMessageId = MessageBusModule.getProtocolMethodResponseMessageId(ProtocolName, MethodName)
	
	if self.connections[ProtocolMethodResponseMessageId] ~= nil then
		self:unsubscribeWithMsgId(ProtocolMethodResponseMessageId)
	end
	self.connections[ProtocolMethodResponseMessageId] = MessageBusService:SubscribeToProtocolMethodResponse(ProtocolName, MethodName, Callback, P33, Sticky)
end

function Module:unsubscribeToProtocolMethodRequest(p2)
	-- upvalues: MessageBusService (copy)
	self:unsubscribeWithMsgId(MessageBusService:GetProtocolMethodRequestMessageId(p2.protocolName, p2.methodName))
end

function Module:unsubscribeToProtocolMethodResponse(p2)
	-- upvalues: MessageBusService (copy)
	self:unsubscribeWithMsgId(MessageBusService:GetProtocolMethodResponseMessageId(p2.protocolName, p2.methodName))
end

function Module:unsubscribe(p2)
	self:unsubscribeWithMsgId(p2.mid)
end

function Module:unsubscribeWithMsgId(ProtocolMethodRequestMessageId)
	-- upvalues: DisableMessageBusUnSubscribeError (copy), EnableMessageBusUnSubscribeErrorTelemetry (copy), MessageBusService (copy)
	local Connection = self.connections[ProtocolMethodRequestMessageId]
	
	if Connection == nil then
		if not DisableMessageBusUnSubscribeError then
			error("unsubscribing from a message id not subscribed to: " .. ProtocolMethodRequestMessageId)
		else
			if EnableMessageBusUnSubscribeErrorTelemetry then
				MessageBusService:Call("Telemetry.logEventFromLua", {
					eventType = "RobloxTelemetry",
					config = {
						eventName = "MessageBusErrorEvent",
						throttlingPercentage = 10000,
						description = "Report MessageBus errors to Points\"",
						links = "",
						backends = { "Points" },
						lastUpdated = { 24, 11, 20 }
					},
					data = {
						standardizedFields = nil,
						eventContext = nil,
						customFields = {
							err = "unsubscribing from a message id not subscribed to: " .. ProtocolMethodRequestMessageId
						}
					}
				})
			end
			return
		end
	end
	self.connections[ProtocolMethodRequestMessageId] = nil
	Connection:Disconnect()
end

function Module:unsubscribeFromAllMessages()
	for i, connection in pairs(self.connections) do
		self.connections[i] = nil
		connection:Disconnect()
	end
end

MessageBusModule.Subscriber = Module

return MessageBusModule