local notificationService = game:GetService("NotificationService")
local realtimeDeliveryModule = require(script:FindFirstAncestor("DataHydration").Parent.RealtimeDelivery)
local acpProtocolModule = require(script.Parent.AcpProtocol)
local debugModule = require(script.Parent.Parent.debug)
local parseFrameModule = require(script.Parent.parseFrame)
local _ = require(script.Parent.Parent.types)
local var5 = nil
local var6 = 0
local var7 = nil
local var8 = 0

local function _(p0) --[[ line: 28 | named "isConnectionState" ]]
	return typeof(p0) == "EnumItem" and p0.EnumType == Enum.ConnectionState
end

local _ = function(p1) --[[ line: 32 | named "previewString" ]]
	return if #p1 <= 4000 then p1 else string.sub(p1, 1, 4000) .. "\226\128\166"
end

local function summarizeDetail(p2, p3) --[[ line: 39 ]]
	if typeof(p2) == "string" then
		return {
			shape = "string",
			length = #p2,
			preview = if #p2 <= 4000 then p2 else string.sub(p2, 1, 4000) .. "\226\128\166",
			detailType = p3
		}
	elseif typeof(p2) ~= "table" then
		return {
			shape = typeof(p2),
			value = tostring(p2),
			detailType = p3
		}
	end
	local t = {}
	
	for i in p2 do
		table.insert(t, i)
	end
	table.sort(t)
	
	return { shape = "table", keys = t, detailType = p3 }
end

local function extractRawFrame(p4) --[[ line: 69 ]]
	if typeof(p4) == "string" then
		return p4
	elseif typeof(p4) ~= "table" then
		return nil
	end
	for i, v in {
		"frame",
		"payload",
		"message",
		"data",
		"body"
	} do
		local var16 = p4[v]
		
		if typeof(var16) == "string" and var16 ~= "" then
			return var16
		end
	end
	return nil
end

local _ = function(p5) --[[ line: 85 | named "extractRtnSequenceNumber" ]]
	return if typeof(p5) == "table" then p5.sequence_number else nil
end

local function describeParsedFrame(p6) --[[ line: 92 ]]
	if typeof(p6) ~= "table" then
		return { kind = "unknown" }
	elseif p6.kind == "notification" and typeof(p6.notification) == "table" then
		local t = { kind = "notification", method = p6.notification.method }
		local params = p6.notification.params
		
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
		return if p6.kind == "response" and typeof(p6.response) == "table" then {
			kind = "response",
			id = p6.response.id,
			hasError = typeof(p6.response.error) == "table"
		} else { kind = p6.kind }
	end
end

local _ = function(p7, p8, p9) --[[ line: 128 | named "onCapConnectionState" ]]
	-- upvalues: debugModule (ref), acpProtocolModule (ref)
	debugModule.log("info", "CAP RTN connection state", {
		namespace = acpProtocolModule.CapRtnNamespace,
		connectionState = tostring(p7),
		sequenceNumber = p8,
		seqByNamespace = p9
	})
end

local function onSignalRConnectionState(value, p10, p11) --[[ line: 137 ]]
	-- upvalues: acpProtocolModule (ref), debugModule (ref)
	debugModule.log("info", "SignalR connection state", {
		connectionState = tostring(value),
		sequenceNumber = p10,
		capNamespace = acpProtocolModule.CapRtnNamespace,
		capSequenceNumber = if typeof(p11) == "table" then p11[acpProtocolModule.CapRtnNamespace] else nil
	})
end

local function onCapEvent(p12, p13, p14) --[[ line: 151 ]]
	-- upvalues: var8 (write), debugModule (ref), acpProtocolModule (ref), summarizeDetail (ref), extractRawFrame (ref), parseFrameModule (ref), describeParsedFrame (ref)
	var8 += 1
	local var18 = var8
	debugModule.log("info", "CAP RTN message received", {
		namespace = acpProtocolModule.CapRtnNamespace,
		messageIndex = var18,
		sequenceNumber = if typeof(p13) ~= "table" then p13.sequence_number else nil,
		summary = summarizeDetail(p13, p14)
	})
	local var19 = extractRawFrame(p13)
	
	if var19 == nil then
		debugModule.log("warn", "CAP RTN message has no parseable frame field", {
			hint = "Expected string body or table key frame|payload|message|data|body",
			namespace = acpProtocolModule.CapRtnNamespace,
			messageIndex = var18,
			summary = summarizeDetail(p13, p14)
		})
		
		return
	end
	debugModule.log("info", "CAP RTN raw frame", {
		namespace = acpProtocolModule.CapRtnNamespace,
		messageIndex = var18,
		length = #var19,
		preview = if #var19 <= 4000 then var19 else string.sub(var19, 1, 4000) .. "\226\128\166"
	})
	local var20 = parseFrameModule(var19)
	
	if var20 == nil then
		debugModule.log("warn", "CAP frame dropped (parseFrame returned nil)", {
			hint = "Expected JSON-RPC notification or response",
			messageIndex = var18,
			preview = if #var19 <= 4000 then var19 else string.sub(var19, 1, 4000) .. "\226\128\166"
		})
		
		return
	end
	local var21 = describeParsedFrame(var20)
	debugModule.log("info", "CAP frame ingested", { messageIndex = var18, parsed = var21 })
	p12.ingestFrame(var20, {
		sequenceNumber = if typeof(p13) ~= "table" then p13.sequence_number else nil
	})
	
	if var20.kind == "response" then
		debugModule.log("info", "CAP response ingested", { messageIndex = var18, parsed = var21 })
		
		return
	end
	local sessionId = var21.sessionId
	
	local function logTurnSnapshot(p15) --[[ line: 210 ]]
		-- upvalues: sessionId (ref), p12 (ref), debugModule (copy), var18 (ref)
		if typeof(sessionId) ~= "string" then return end
		local activeTurnHandle = p12.getActiveTurnHandle(sessionId)
		
		if activeTurnHandle == nil then
			return
		end
		debugModule.log("info", p15, {
			messageIndex = var18,
			turn = debugModule.formatTurnState(activeTurnHandle.state(false))
		})
	end
	
	if var21.sessionUpdate == "agent_message_chunk" or var21.sessionUpdate == "state_change" then
		logTurnSnapshot(`CAP turn state after {var21.sessionUpdate}`)
	end
end

local _ = function(value, p16, p17, p18) --[[ line: 229 | named "onNamespaceSignal" ]]
	-- upvalues: debugModule (ref), acpProtocolModule (ref), onCapEvent (ref)
	if typeof(p16) == "EnumItem" and p16.EnumType == Enum.ConnectionState then
		debugModule.log("info", "CAP RTN connection state", {
			namespace = acpProtocolModule.CapRtnNamespace,
			connectionState = tostring(p16),
			sequenceNumber = p17,
			seqByNamespace = p18
		})
		
		return
	end
	onCapEvent(value, p16, p17)
end

local _ = function() --[[ line: 238 | named "ensureReceiver" ]]
	-- upvalues: var5 (write), realtimeDeliveryModule (ref), notificationService (ref)
	if var5 == nil then
		var5 = realtimeDeliveryModule.RobloxEventReceiver.new(notificationService)
	end
end

local function subscribeCapNamespace(p19) --[[ line: 244 ]]
	-- upvalues: acpProtocolModule (ref), debugModule (ref), var5 (write), onCapEvent (ref), onSignalRConnectionState (ref)
	local capRtnNamespace = acpProtocolModule.CapRtnNamespace
	debugModule.log("info", "listening on CAP RTN namespace (SignalR topic)", {
		via = "NotificationService.RobloxEventReceived + RobloxConnectionChanged",
		namespace = capRtnNamespace
	})
	local var24 = var5:observeEvent(capRtnNamespace, function(p20, p21, p22) --[[ line: 251 ]]
		-- upvalues: p19 (ref), debugModule (copy), acpProtocolModule (copy), onCapEvent (copy)
		if typeof(p20) == "EnumItem" and p20.EnumType == Enum.ConnectionState then
			debugModule.log("info", "CAP RTN connection state", {
				namespace = acpProtocolModule.CapRtnNamespace,
				connectionState = tostring(p20),
				sequenceNumber = p21,
				seqByNamespace = p22
			})
			
			return
		end
		onCapEvent(p19, p20, p21)
	end)
	local signalR = var5:observeEvent("signalR", function(p23, p24, p25) --[[ line: 257 ]]
		-- upvalues: onSignalRConnectionState (copy)
		if typeof(p23) == "EnumItem" and p23.EnumType == Enum.ConnectionState then
			onSignalRConnectionState(p23, p24, p25)
		end
	end)
	
	return function() --[[ line: 264 ]]
		-- upvalues: var24 (ref), signalR (ref)
		var24:Disconnect()
		signalR:Disconnect()
	end
end

return function(p26) --[[ line: 270 | named "wireCapDelivery" ]]
	-- upvalues: var5 (write), realtimeDeliveryModule (ref), notificationService (ref), var6 (write), var7 (write), var8 (write), subscribeCapNamespace (ref), debugModule (ref), acpProtocolModule (ref)
	if var5 == nil then
		var5 = realtimeDeliveryModule.RobloxEventReceiver.new(notificationService)
	end
	var6 += 1
	
	if var7 == nil then
		var8 = 0
		var7 = subscribeCapNamespace(p26)
		debugModule.log("info", "CAP RTN listener active \226\128\148 waiting for SignalR posts", { namespace = acpProtocolModule.CapRtnNamespace })
	end
	return function() --[[ line: 282 ]]
		-- upvalues: var6 (copy), var7 (copy), debugModule (copy), acpProtocolModule (copy), var8 (copy)
		var6 -= 1
		
		if var6 <= 0 and var7 then
			var7()
			var7 = nil
			var6 = 0
			debugModule.log("info", "CAP RTN listener stopped", {
				namespace = acpProtocolModule.CapRtnNamespace,
				framesReceivedCount = var8
			})
		end
	end
end