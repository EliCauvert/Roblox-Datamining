local messageBusService = game:GetService("MessageBusService")
local _ = require(script.Parent.MessageBusTypes)
local disableMessageBusUnSubscribeError = game:DefineFastFlag("DisableMessageBusUnSubscribeError", false)
local enableMessageBusUnSubscribeErrorTelemetry = game:DefineFastFlag("EnableMessageBusUnSubscribeErrorTelemetry", false)
local t = {}
t.__index = t

function t.publish(p1, p2)
	-- upvalues: messageBusService (ref)
	assert(p1.validateParams(p2))
	messageBusService:Publish(p1.mid, p2)
end

function t.publishProtocolMethodRequest(p1, p2, p3)
	-- upvalues: messageBusService (ref)
	assert(p1.validateParams(p2))
	messageBusService:PublishProtocolMethodRequest(p1.protocolName, p1.methodName, p2, p3)
end

function t.publishProtocolMethodResponse(p1, p2, p3, p4)
	-- upvalues: messageBusService (ref)
	assert(p1.validateParams(p2))
	messageBusService:PublishProtocolMethodResponse(p1.protocolName, p1.methodName, p2, p3, p4)
end

function t.getLast(p1)
	-- upvalues: messageBusService (ref)
	local midLast = messageBusService:GetLast(p1.mid)
	
	if midLast == nil then
		return nil
	end
	assert(p1.validateParams(midLast))
	
	return midLast
end

function t.getMessageId(p1, p2)
	-- upvalues: messageBusService (ref)
	return messageBusService:GetMessageId(p1, p2)
end

function t.getProtocolMethodRequestMessageId(p1, p2)
	-- upvalues: messageBusService (ref)
	return messageBusService:GetProtocolMethodRequestMessageId(p1, p2)
end

function t.getProtocolMethodResponseMessageId(p1, p2)
	-- upvalues: messageBusService (ref)
	return messageBusService:GetProtocolMethodResponseMessageId(p1, p2)
end

function t.call(p1, p2)
	-- upvalues: messageBusService (ref)
	assert(p1.validateParams(p2))
	
	return messageBusService:Call(p1.fid, p2)
end

local t_1 = {}
t_1.__index = t_1

function t_1.new()
	-- upvalues: t_1 (ref)
	return setmetatable({ connections = {} }, t_1)
end

function t_1:getSubscriptionCount()
	local var1 = 0
	
	for i in pairs(self.connections) do
		var1 += 1
	end
	return var1
end

function t_1:subscribe(p1, p2, p3, p4)
	-- upvalues: messageBusService (ref)
	local var2 = if p3 ~= nil then p3 else true
	local var3 = p4 ~= nil and p4
	local mid = p1.mid
	
	if self.connections[mid] ~= nil then
		self:unsubscribe(p1)
	end
	self.connections[mid] = messageBusService:Subscribe(mid, p2, var3, var2)
end

function t_1:subscribeProtocolMethodRequest(p1, p2, p3, p4)
	-- upvalues: t (ref), messageBusService (ref)
	local var2 = if p3 ~= nil then p3 else true
	local var3 = p4 ~= nil and p4
	local protocolName = p1.protocolName
	local methodName = p1.methodName
	local protocolMethodRequestMessageId = t.getProtocolMethodRequestMessageId(protocolName, methodName)
	
	if self.connections[protocolMethodRequestMessageId] ~= nil then
		self:unsubscribeWithMsgId(protocolMethodRequestMessageId)
	end
	self.connections[protocolMethodRequestMessageId] = messageBusService:SubscribeToProtocolMethodRequest(protocolName, methodName, p2, var3, var2)
end

function t_1:subscribeProtocolMethodResponse(p1, p2, p3, p4)
	-- upvalues: t (ref), messageBusService (ref)
	local var2 = if p3 ~= nil then p3 else true
	local var3 = p4 ~= nil and p4
	local protocolName = p1.protocolName
	local methodName = p1.methodName
	local protocolMethodResponseMessageId = t.getProtocolMethodResponseMessageId(protocolName, methodName)
	
	if self.connections[protocolMethodResponseMessageId] ~= nil then
		self:unsubscribeWithMsgId(protocolMethodResponseMessageId)
	end
	self.connections[protocolMethodResponseMessageId] = messageBusService:SubscribeToProtocolMethodResponse(protocolName, methodName, p2, var3, var2)
end

function t_1:unsubscribeToProtocolMethodRequest(p1)
	-- upvalues: messageBusService (ref)
	self:unsubscribeWithMsgId(messageBusService:GetProtocolMethodRequestMessageId(p1.protocolName, p1.methodName))
end

function t_1:unsubscribeToProtocolMethodResponse(p1)
	-- upvalues: messageBusService (ref)
	self:unsubscribeWithMsgId(messageBusService:GetProtocolMethodResponseMessageId(p1.protocolName, p1.methodName))
end

function t_1:unsubscribe(p1)
	self:unsubscribeWithMsgId(p1.mid)
end

function t_1:unsubscribeWithMsgId(p1)
	-- upvalues: disableMessageBusUnSubscribeError (ref), enableMessageBusUnSubscribeErrorTelemetry (ref), messageBusService (ref)
	local var2 = self.connections[p1]
	
	if var2 == nil then
		if disableMessageBusUnSubscribeError then
			if enableMessageBusUnSubscribeErrorTelemetry then
				messageBusService:Call("Telemetry.logEventFromLua", {
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
							err = "unsubscribing from a message id not subscribed to: " .. p33
						}
					}
				})
			end
			return
		else
			error("unsubscribing from a message id not subscribed to: " .. p33)
		end
	end
	self.connections[p1] = nil
	var2:Disconnect()
end

function t_1:unsubscribeFromAllMessages()
	for i, v in pairs(self.connections) do
		self.connections[i] = nil
		v:Disconnect()
	end
end

t.Subscriber = t_1

return t