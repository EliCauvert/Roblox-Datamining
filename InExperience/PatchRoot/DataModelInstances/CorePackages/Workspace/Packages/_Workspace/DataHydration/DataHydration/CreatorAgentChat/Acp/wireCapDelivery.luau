local NotificationService = game:GetService("NotificationService")
local RealtimeDeliveryModule = require(script:FindFirstAncestor("DataHydration").Parent.RealtimeDelivery)
local AcpProtocolModule = require(script.Parent.AcpProtocol)
local DebugModule = require(script.Parent.Parent.debug)
local ParseFrameModule = require(script.Parent.parseFrame)
local _ = require(script.Parent.Parent.types)
local NewResult = nil
local Count = 0
local Callback = nil
local FramesReceivedCount = 0

local function _(p1): boolean --[[ Line: 28 | Named "isConnectionState" ]]
	return typeof(p1) == "EnumItem" and p1.EnumType == Enum.ConnectionState
end

local _ = function(Text: string): string --[[ Line: 32 | Named "previewString" ]]
	return if #Text <= 4000 then Text else string.sub(Text, 1, 4000) .. "…"
end

local function summarizeDetail(Text: string, DetailType) --[[ Line: 39 ]]
	if typeof(Text) == "string" then
		return {
			shape = "string",
			length = #Text,
			preview = if #Text <= 4000 then Text else string.sub(Text, 1, 4000) .. "…",
			detailType = DetailType
		}
	end
	if typeof(Text) ~= "table" then
		return {
			shape = typeof(Text),
			value = tostring(Text),
			detailType = DetailType
		}
	end
	local List = {}
	
	for i in Text do
		table.insert(List, i)
	end
	table.sort(List)
	
	return { shape = "table", keys = List, detailType = DetailType }
end

local function extractRawFrame(p1) --[[ Line: 69 ]]
	if typeof(p1) == "string" then
		return p1
	end
	if typeof(p1) ~= "table" then
		return nil
	end
	local v1 = nil
	for _, value in {
		"frame",
		"payload",
		"message",
		"data",
		"body"
	} do
		v1 = p1[value]
		
		if typeof(v1) == "string" and v1 ~= "" then
			return v1
		end
	end
	return nil
end

local _ = function(p2) --[[ Line: 85 | Named "extractRtnSequenceNumber" ]]
	return if typeof(p2) == "table" then p2.sequence_number else nil
end

local function describeParsedFrame(p2) --[[ Line: 92 ]]
	if typeof(p2) ~= "table" then
		return { kind = "unknown" }
	end
	if p2.kind ~= "notification" or typeof(p2.notification) ~= "table" then
		return if p2.kind == "response" and typeof(p2.response) == "table" then {
			kind = "response",
			id = p2.response.id,
			hasError = typeof(p2.response.error) == "table"
		} else { kind = p2.kind }
	end
	local config = { kind = "notification", method = p2.notification.method }
	local Params = p2.notification.params
	
	if typeof(Params) == "table" then
		config.sessionId = Params.sessionId
		local Update = Params.update
		
		if typeof(Update) == "table" then
			if typeof(Update.sessionUpdate) == "string" then
				config.sessionUpdate = Update.sessionUpdate
			end
			if Update.sessionUpdate == "state_change" then
				config.state = Update.state
				config.stopReason = Update.stop_reason
			end
		end
	end
	return config
end

local _ = function(p2, SequenceNumber, SeqByNamespace) --[[ Line: 128 | Named "onCapConnectionState" ]]
	-- upvalues: DebugModule (copy), AcpProtocolModule (copy)
	DebugModule.log("info", "CAP RTN connection state", {
		namespace = AcpProtocolModule.CapRtnNamespace,
		connectionState = tostring(p2),
		sequenceNumber = SequenceNumber,
		seqByNamespace = SeqByNamespace
	})
end

local function onSignalRConnectionState(p2, SequenceNumber, p3) --[[ Line: 137 ]]
	-- upvalues: AcpProtocolModule (copy), DebugModule (copy)
	DebugModule.log("info", "SignalR connection state", {
		connectionState = tostring(p2),
		sequenceNumber = SequenceNumber,
		capNamespace = AcpProtocolModule.CapRtnNamespace,
		capSequenceNumber = if typeof(p3) == "table" then p3[AcpProtocolModule.CapRtnNamespace] else nil
	})
end

local function onCapEvent(p2, p3, DetailType) --[[ Line: 151 ]]
	-- upvalues: FramesReceivedCount (ref), DebugModule (copy), AcpProtocolModule (copy), summarizeDetail (copy), extractRawFrame (copy), ParseFrameModule (copy), describeParsedFrame (copy)
	FramesReceivedCount += 1
	local MessageIndex: number = FramesReceivedCount
	DebugModule.log("info", "CAP RTN message received", {
		namespace = AcpProtocolModule.CapRtnNamespace,
		messageIndex = MessageIndex,
		sequenceNumber = if typeof(p3) == "table" then p3.sequence_number else nil,
		summary = summarizeDetail(p3, DetailType)
	})
	local ExtractRawFrameResult: string = extractRawFrame(p3)
	
	if ExtractRawFrameResult == nil then
		DebugModule.log("warn", "CAP RTN message has no parseable frame field", {
			hint = "Expected string body or table key frame|payload|message|data|body",
			namespace = AcpProtocolModule.CapRtnNamespace,
			messageIndex = MessageIndex,
			summary = summarizeDetail(p3, DetailType)
		})
		
		return
	end
	DebugModule.log("info", "CAP RTN raw frame", {
		namespace = AcpProtocolModule.CapRtnNamespace,
		messageIndex = MessageIndex,
		length = #ExtractRawFrameResult,
		preview = if #ExtractRawFrameResult <= 4000 then ExtractRawFrameResult else string.sub(ExtractRawFrameResult, 1, 4000) .. "…"
	})
	local ParseFrameModuleResult = ParseFrameModule(ExtractRawFrameResult)
	
	if ParseFrameModuleResult == nil then
		DebugModule.log("warn", "CAP frame dropped (parseFrame returned nil)", {
			hint = "Expected JSON-RPC notification or response",
			messageIndex = MessageIndex,
			preview = if #ExtractRawFrameResult <= 4000 then ExtractRawFrameResult else string.sub(ExtractRawFrameResult, 1, 4000) .. "…"
		})
		
		return
	end
	local DescribeParsedFrameResult = describeParsedFrame(ParseFrameModuleResult)
	DebugModule.log("info", "CAP frame ingested", {
		messageIndex = MessageIndex,
		parsed = DescribeParsedFrameResult
	})
	p2.ingestFrame(ParseFrameModuleResult, {
		sequenceNumber = if typeof(p3) == "table" then p3.sequence_number else nil
	})
	
	if ParseFrameModuleResult.kind == "response" then
		DebugModule.log("info", "CAP response ingested", {
			messageIndex = MessageIndex,
			parsed = DescribeParsedFrameResult
		})
		
		return
	end
	local SessionId = DescribeParsedFrameResult.sessionId
	
	local function logTurnSnapshot(Message) --[[ Line: 210 ]]
		-- upvalues: SessionId (copy), p2 (copy), DebugModule (upval), MessageIndex (copy)
		if typeof(SessionId) ~= "string" then return end
		local ActiveTurnHandle = p2.getActiveTurnHandle(SessionId)
		
		if ActiveTurnHandle ~= nil then
			DebugModule.log("info", Message, {
				messageIndex = MessageIndex,
				turn = DebugModule.formatTurnState(ActiveTurnHandle.state(false))
			})
			
			return
		end
	end
	
	if DescribeParsedFrameResult.sessionUpdate == "agent_message_chunk" or DescribeParsedFrameResult.sessionUpdate == "state_change" then
		logTurnSnapshot(`CAP turn state after {DescribeParsedFrameResult.sessionUpdate}`)
	end
end

local _ = function(p2, p3, SequenceNumber, SeqByNamespace) --[[ Line: 229 | Named "onNamespaceSignal" ]]
	-- upvalues: DebugModule (copy), AcpProtocolModule (copy), onCapEvent (copy)
	if typeof(p3) == "EnumItem" and p3.EnumType == Enum.ConnectionState then
		DebugModule.log("info", "CAP RTN connection state", {
			namespace = AcpProtocolModule.CapRtnNamespace,
			connectionState = tostring(p3),
			sequenceNumber = SequenceNumber,
			seqByNamespace = SeqByNamespace
		})
		
		return
	else
		onCapEvent(p2, p3, SequenceNumber)
	end
end

local _ = function() --[[ Line: 238 | Named "ensureReceiver" ]]
	-- upvalues: NewResult (ref), RealtimeDeliveryModule (copy), NotificationService (copy)
	if NewResult == nil then
		NewResult = RealtimeDeliveryModule.RobloxEventReceiver.new(NotificationService)
	end
end

local function subscribeCapNamespace(p2) --[[ Line: 244 ]]
	-- upvalues: AcpProtocolModule (copy), DebugModule (copy), NewResult (ref), onCapEvent (copy), onSignalRConnectionState (copy)
	local CapRtnNamespace = AcpProtocolModule.CapRtnNamespace
	DebugModule.log("info", "listening on CAP RTN namespace (SignalR topic)", {
		via = "NotificationService.RobloxEventReceived + RobloxConnectionChanged",
		namespace = CapRtnNamespace
	})
	local ObserveEventResult = NewResult:observeEvent(CapRtnNamespace, function(p3, SequenceNumber, SeqByNamespace) --[[ Line: 251 ]]
		-- upvalues: p2 (copy), DebugModule (upval), AcpProtocolModule (upval), onCapEvent (upval)
		if typeof(p3) == "EnumItem" and p3.EnumType == Enum.ConnectionState then
			DebugModule.log("info", "CAP RTN connection state", {
				namespace = AcpProtocolModule.CapRtnNamespace,
				connectionState = tostring(p3),
				sequenceNumber = SequenceNumber,
				seqByNamespace = SeqByNamespace
			})
			
			return
		else
			onCapEvent(p2, p3, SequenceNumber)
		end
	end)
	local SignalR = NewResult:observeEvent("signalR", function(p3, SequenceNumber, p4) --[[ Line: 257 ]]
		-- upvalues: onSignalRConnectionState (upval)
		if typeof(p3) == "EnumItem" and p3.EnumType == Enum.ConnectionState then
			onSignalRConnectionState(p3, SequenceNumber, p4)
		end
	end)
	
	return function() --[[ Line: 264 ]]
		-- upvalues: ObserveEventResult (copy), SignalR (copy)
		ObserveEventResult:Disconnect()
		SignalR:Disconnect()
	end
end

return function(p2) --[[ Line: 270 | Named "wireCapDelivery" ]]
	-- upvalues: NewResult (ref), RealtimeDeliveryModule (copy), NotificationService (copy), Count (ref), Callback (ref), FramesReceivedCount (ref), subscribeCapNamespace (copy), DebugModule (copy), AcpProtocolModule (copy)
	if NewResult == nil then
		NewResult = RealtimeDeliveryModule.RobloxEventReceiver.new(NotificationService)
	end
	Count += 1
	
	if Callback == nil then
		FramesReceivedCount = 0
		Callback = subscribeCapNamespace(p2)
		DebugModule.log("info", "CAP RTN listener active — waiting for SignalR posts", { namespace = AcpProtocolModule.CapRtnNamespace })
	end
	return function() --[[ Line: 282 ]]
		-- upvalues: Count (upval), Callback (upval), DebugModule (upval), AcpProtocolModule (upval), FramesReceivedCount (upval)
		Count -= 1
		
		if Count <= 0 and Callback then
			Callback()
			Callback = nil
			Count = 0
			DebugModule.log("info", "CAP RTN listener stopped", {
				namespace = AcpProtocolModule.CapRtnNamespace,
				framesReceivedCount = FramesReceivedCount
			})
		end
	end
end