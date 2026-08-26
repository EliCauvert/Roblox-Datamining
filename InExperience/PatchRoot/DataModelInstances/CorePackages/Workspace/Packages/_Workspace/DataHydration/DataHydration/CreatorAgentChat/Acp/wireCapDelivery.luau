local notificationService = game:GetService("NotificationService")
local realtimeDeliveryModule = require(script:FindFirstAncestor("DataHydration").Parent.RealtimeDelivery)
local acpProtocolModule = require(script.Parent.AcpProtocol)
local debugModule = require(script.Parent.Parent.debug)
local parseFrameModule = require(script.Parent.parseFrame)
local _ = require(script.Parent.Parent.types)
local var1 = nil
local var2 = 0
local var3 = nil
local var4 = 0

local function _(p1)
	return typeof(p1) == "EnumItem" and p1.EnumType == Enum.ConnectionState
end

local _ = function(p1)
	return if #p1 <= 4000 then p1 else string.sub(p1, 1, 4000) .. "\226\128\166"
end

local function summarizeDetail(p1, p2)
	if typeof(p1) == "string" then
		return {
			shape = "string",
			length = #p1,
			preview = if #p1 <= 4000 then p1 else string.sub(p1, 1, 4000) .. "\226\128\166",
			detailType = p2
		}
	elseif typeof(p1) ~= "table" then
		return {
			shape = typeof(p1),
			value = tostring(p1),
			detailType = p2
		}
	end
	local t = {}
	
	for i in p1 do
		table.insert(t, i)
	end
	table.sort(t)
	
	return { shape = "table", keys = t, detailType = p2 }
end

local function extractRawFrame(p3)
	if typeof(p3) == "string" then
		return p3
	elseif typeof(p3) ~= "table" then
		return nil
	end
	for i, v in {
		"frame",
		"payload",
		"message",
		"data",
		"body"
	} do
		local var5 = p3[v]
		
		if typeof(var5) == "string" and var5 ~= "" then
			return var5
		end
	end
	return nil
end

local _ = function(p4)
	return if typeof(p4) == "table" then p4.sequence_number else nil
end

local function describeParsedFrame(p4)
	if typeof(p4) ~= "table" then
		return { kind = "unknown" }
	elseif p4.kind == "notification" and typeof(p4.notification) == "table" then
		local t = { kind = "notification", method = p4.notification.method }
		local params = p4.notification.params
		
		if typeof(params) == "table" then
			t.sessionId = params.sessionId
			local update = params.update
			
			if typeof(update) == "table" then
				if typeof(update.sessionUpdate) == "string" then
					t.sessionUpdate = update.sessionUpdate
				end
				if update.sessionUpdate == "state_change" then
					t.state = update.state
					t.stopReason = update.stop_reason
				end
			end
		end
		return t
	else
		return if p4.kind == "response" and typeof(p4.response) == "table" then {
			kind = "response",
			id = p4.response.id,
			hasError = typeof(p4.response.error) == "table"
		} else { kind = p4.kind }
	end
end

local _ = function(p4, p5, p6)
	-- upvalues: debugModule (ref), acpProtocolModule (ref)
	debugModule.log("info", "CAP RTN connection state", {
		namespace = acpProtocolModule.CapRtnNamespace,
		connectionState = tostring(p4),
		sequenceNumber = p5,
		seqByNamespace = p6
	})
end

local function onSignalRConnectionState(value, p4, p5)
	-- upvalues: acpProtocolModule (ref), debugModule (ref)
	debugModule.log("info", "SignalR connection state", {
		connectionState = tostring(value),
		sequenceNumber = p4,
		capNamespace = acpProtocolModule.CapRtnNamespace,
		capSequenceNumber = if typeof(p5) == "table" then p5[acpProtocolModule.CapRtnNamespace] else nil
	})
end

local function onCapEvent(p4, p5, p6)
	-- upvalues: var4 (write), debugModule (ref), acpProtocolModule (ref), summarizeDetail (ref), extractRawFrame (ref), parseFrameModule (ref), describeParsedFrame (ref)
	var4 += 1
	local var6 = var4
	debugModule.log("info", "CAP RTN message received", {
		namespace = acpProtocolModule.CapRtnNamespace,
		messageIndex = var6,
		sequenceNumber = if typeof(p5) ~= "table" then p5.sequence_number else nil,
		summary = summarizeDetail(p5, p6)
	})
	local var7 = extractRawFrame(p5)
	
	if var7 == nil then
		debugModule.log("warn", "CAP RTN message has no parseable frame field", {
			hint = "Expected string body or table key frame|payload|message|data|body",
			namespace = acpProtocolModule.CapRtnNamespace,
			messageIndex = var6,
			summary = summarizeDetail(p5, p6)
		})
		
		return
	end
	debugModule.log("info", "CAP RTN raw frame", {
		namespace = acpProtocolModule.CapRtnNamespace,
		messageIndex = var6,
		length = #var7,
		preview = if #var7 <= 4000 then var7 else string.sub(var7, 1, 4000) .. "\226\128\166"
	})
	local var8 = parseFrameModule(var7)
	
	if var8 == nil then
		debugModule.log("warn", "CAP frame dropped (parseFrame returned nil)", {
			hint = "Expected JSON-RPC notification or response",
			messageIndex = var6,
			preview = if #var7 <= 4000 then var7 else string.sub(var7, 1, 4000) .. "\226\128\166"
		})
		
		return
	end
	local var9 = describeParsedFrame(var8)
	debugModule.log("info", "CAP frame ingested", { messageIndex = var6, parsed = var9 })
	p4.ingestFrame(var8, {
		sequenceNumber = if typeof(p5) ~= "table" then p5.sequence_number else nil
	})
	
	if var8.kind == "response" then
		debugModule.log("info", "CAP response ingested", { messageIndex = var6, parsed = var9 })
		
		return
	end
	local sessionId = var9.sessionId
	
	local function logTurnSnapshot(p7)
		-- upvalues: sessionId (ref), p4 (ref), debugModule (copy), var6 (ref)
		if typeof(sessionId) ~= "string" then return end
		local activeTurnHandle = p4.getActiveTurnHandle(sessionId)
		
		if activeTurnHandle == nil then
			return
		end
		debugModule.log("info", p7, {
			messageIndex = var6,
			turn = debugModule.formatTurnState(activeTurnHandle.state(false))
		})
	end
	
	if var9.sessionUpdate == "agent_message_chunk" or var9.sessionUpdate == "state_change" then
		logTurnSnapshot(`CAP turn state after {var9.sessionUpdate}`)
	end
end

local _ = function(value, p4, p5, p6)
	-- upvalues: debugModule (ref), acpProtocolModule (ref), onCapEvent (ref)
	if typeof(p4) == "EnumItem" and p4.EnumType == Enum.ConnectionState then
		debugModule.log("info", "CAP RTN connection state", {
			namespace = acpProtocolModule.CapRtnNamespace,
			connectionState = tostring(p4),
			sequenceNumber = p5,
			seqByNamespace = p6
		})
		
		return
	end
	onCapEvent(value, p4, p5)
end

local _ = function()
	-- upvalues: var1 (write), realtimeDeliveryModule (ref), notificationService (ref)
	if var1 == nil then
		var1 = realtimeDeliveryModule.RobloxEventReceiver.new(notificationService)
	end
end

local function subscribeCapNamespace(p4)
	-- upvalues: acpProtocolModule (ref), debugModule (ref), var1 (write), onCapEvent (ref), onSignalRConnectionState (ref)
	local capRtnNamespace = acpProtocolModule.CapRtnNamespace
	debugModule.log("info", "listening on CAP RTN namespace (SignalR topic)", {
		via = "NotificationService.RobloxEventReceived + RobloxConnectionChanged",
		namespace = capRtnNamespace
	})
	local var6 = var1:observeEvent(capRtnNamespace, function(p5, p6, p7)
		-- upvalues: p4 (ref), debugModule (copy), acpProtocolModule (copy), onCapEvent (copy)
		if typeof(p5) == "EnumItem" and p5.EnumType == Enum.ConnectionState then
			debugModule.log("info", "CAP RTN connection state", {
				namespace = acpProtocolModule.CapRtnNamespace,
				connectionState = tostring(p5),
				sequenceNumber = p6,
				seqByNamespace = p7
			})
			
			return
		end
		onCapEvent(p4, p5, p6)
	end)
	local signalR = var1:observeEvent("signalR", function(p5, p6, p7)
		-- upvalues: onSignalRConnectionState (copy)
		if typeof(p5) == "EnumItem" and p5.EnumType == Enum.ConnectionState then
			onSignalRConnectionState(p5, p6, p7)
		end
	end)
	
	return function()
		-- upvalues: var6 (ref), signalR (ref)
		var6:Disconnect()
		signalR:Disconnect()
	end
end

return function(p4)
	-- upvalues: var1 (write), realtimeDeliveryModule (ref), notificationService (ref), var2 (write), var3 (write), var4 (write), subscribeCapNamespace (ref), debugModule (ref), acpProtocolModule (ref)
	if var1 == nil then
		var1 = realtimeDeliveryModule.RobloxEventReceiver.new(notificationService)
	end
	var2 += 1
	
	if var3 == nil then
		var4 = 0
		var3 = subscribeCapNamespace(p4)
		debugModule.log("info", "CAP RTN listener active \226\128\148 waiting for SignalR posts", { namespace = acpProtocolModule.CapRtnNamespace })
	end
	return function()
		-- upvalues: var2 (copy), var3 (copy), debugModule (copy), acpProtocolModule (copy), var4 (copy)
		var2 -= 1
		
		if var2 <= 0 and var3 then
			var3()
			var3 = nil
			var2 = 0
			debugModule.log("info", "CAP RTN listener stopped", {
				namespace = acpProtocolModule.CapRtnNamespace,
				framesReceivedCount = var4
			})
		end
	end
end