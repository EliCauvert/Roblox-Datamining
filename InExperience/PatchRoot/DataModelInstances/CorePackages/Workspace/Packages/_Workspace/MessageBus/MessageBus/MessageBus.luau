local messageBusService = game:GetService("MessageBusService")
local _ = require(script.Parent.MessageBusTypes)
local disableMessageBusUnSubscribeError = game:DefineFastFlag("DisableMessageBusUnSubscribeError", false)
local enableMessageBusUnSubscribeErrorTelemetry = game:DefineFastFlag("EnableMessageBusUnSubscribeErrorTelemetry", false)
local t = {}
t.__index = t

function t.publish(p0, p1)
	-- upvalues: messageBusService (ref)
	assert(p0.validateParams(p1))
	messageBusService:Publish(p0.mid, p1)
end

function t.publishProtocolMethodRequest(p2, p3, p4)
	-- upvalues: messageBusService (ref)
	assert(p2.validateParams(p3))
	messageBusService:PublishProtocolMethodRequest(p2.protocolName, p2.methodName, p3, p4)
end

function t.publishProtocolMethodResponse(p5, p6, p7, p8)
	-- upvalues: messageBusService (ref)
	assert(p5.validateParams(p6))
	messageBusService:PublishProtocolMethodResponse(p5.protocolName, p5.methodName, p6, p7, p8)
end

function t.getLast(p9)
	-- upvalues: messageBusService (ref)
	local midLast = messageBusService:GetLast(p9.mid)
	
	if midLast == nil then
		return nil
	end
	assert(p9.validateParams(midLast))
	
	return midLast
end

function t.getMessageId(p10, p11)
	-- upvalues: messageBusService (ref)
	return messageBusService:GetMessageId(p10, p11)
end

function t.getProtocolMethodRequestMessageId(p12, p13)
	-- upvalues: messageBusService (ref)
	return messageBusService:GetProtocolMethodRequestMessageId(p12, p13)
end

function t.getProtocolMethodResponseMessageId(p14, p15)
	-- upvalues: messageBusService (ref)
	return messageBusService:GetProtocolMethodResponseMessageId(p14, p15)
end

function t.call(p16, p17)
	-- upvalues: messageBusService (ref)
	assert(p16.validateParams(p17))
	
	return messageBusService:Call(p16.fid, p17)
end

local t_1 = {}
t_1.__index = t_1

function t_1.new()
	-- upvalues: t_1 (ref)
	return setmetatable({ connections = {} }, t_1)
end

function t_1:getSubscriptionCount()
	local var6 = 0
	
	for i in pairs(self.connections) do
		var6 += 1
	end
	return var6
end

function t_1:subscribe(p18, p19, p20, p21)
	-- upvalues: messageBusService (ref)
	local var7 = if p20 ~= nil then p20 else true
	local var8 = p21 ~= nil and p21
	local mid = p18.mid
	
	if self.connections[mid] ~= nil then
		self:unsubscribe(p18)
	end
	self.connections[mid] = messageBusService:Subscribe(mid, p19, var8, var7)
end

function t_1:subscribeProtocolMethodRequest(p22, p23, p24, p25)
	-- upvalues: t (ref), messageBusService (ref)
	local var9 = if p24 ~= nil then p24 else true
	local var10 = p25 ~= nil and p25
	local protocolName = p22.protocolName
	local methodName = p22.methodName
	local protocolMethodRequestMessageId = t.getProtocolMethodRequestMessageId(protocolName, methodName)
	
	if self.connections[protocolMethodRequestMessageId] ~= nil then
		self:unsubscribeWithMsgId(protocolMethodRequestMessageId)
	end
	self.connections[protocolMethodRequestMessageId] = messageBusService:SubscribeToProtocolMethodRequest(protocolName, methodName, p23, var10, var9)
end

function t_1:subscribeProtocolMethodResponse(p26, p27, p28, p29)
	-- upvalues: t (ref), messageBusService (ref)
	local var12 = if p28 ~= nil then p28 else true
	local var13 = p29 ~= nil and p29
	local protocolName = p26.protocolName
	local methodName = p26.methodName
	local protocolMethodResponseMessageId = t.getProtocolMethodResponseMessageId(protocolName, methodName)
	
	if self.connections[protocolMethodResponseMessageId] ~= nil then
		self:unsubscribeWithMsgId(protocolMethodResponseMessageId)
	end
	self.connections[protocolMethodResponseMessageId] = messageBusService:SubscribeToProtocolMethodResponse(protocolName, methodName, p27, var13, var12)
end

function t_1:unsubscribeToProtocolMethodRequest(p30)
	-- upvalues: messageBusService (ref)
	self:unsubscribeWithMsgId(messageBusService:GetProtocolMethodRequestMessageId(p30.protocolName, p30.methodName))
end

function t_1:unsubscribeToProtocolMethodResponse(p31)
	-- upvalues: messageBusService (ref)
	self:unsubscribeWithMsgId(messageBusService:GetProtocolMethodResponseMessageId(p31.protocolName, p31.methodName))
end

function t_1:unsubscribe(p32)
	self:unsubscribeWithMsgId(p32.mid)
end

function t_1:unsubscribeWithMsgId(p33)
	-- upvalues: disableMessageBusUnSubscribeError (ref), enableMessageBusUnSubscribeErrorTelemetry (ref), messageBusService (ref)
	local var15 = self.connections[p33]
	
	if var15 == nil then
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
	self.connections[p33] = nil
	var15:Disconnect()
end

function t_1:unsubscribeFromAllMessages()
	for i, v in pairs(self.connections) do
		self.connections[i] = nil
		v:Disconnect()
	end
end

t.Subscriber = t_1

return t