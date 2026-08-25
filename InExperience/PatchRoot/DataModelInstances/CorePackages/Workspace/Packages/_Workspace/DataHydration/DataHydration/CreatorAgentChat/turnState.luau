local _ = require(script.Parent.types)

local function createEmptyTurnState(p0, p1)
	return {
		status = "queued",
		assistantText = "",
		pendingAgentMessageId = nil,
		pendingAgentMessageSequenceIndex = nil,
		toolCallCount = 0,
		infoUpdate = nil,
		stopReason = nil,
		error = nil,
		errorCode = nil,
		isDone = false,
		sessionId = p0,
		requestId = p1,
		assistantMessages = {},
		assistantMessageOrder = {},
		pendingAgentMessageContent = {},
		activitySlots = {},
		activityItems = {},
		toolCalls = {},
		eventMetaBySequenceId = {}
	}
end

local function _(p2)
	local var12 = if p2 ~= nil then nil else p2.sequenceNumber
	
	return if typeof(var12) == "number" and var12 >= 0 then var12 + 1 else nil
end

local _ = function(p3)
	local messageId = p3.messageId
	
	return if typeof(messageId) == "string" and messageId ~= "" then messageId else nil
end

local _ = function(p4)
	local t = {}
	
	for i, v in p4 do
		table.insert(t, v)
	end
	return t
end

local function contentBlocksToText(p5)
	local t = {}
	
	for i, v in p5 do
		if v.type == "text" and typeof(v.text) == "string" then
			table.insert(t, v.text)
		end
	end
	return table.concat(t)
end

local function messageMapToText(p6, p7)
	-- upvalues: contentBlocksToText (ref)
	local t = {}
	
	for i, v in p7 do
		local var16 = p6[v]
		
		if var16 ~= nil then
			table.insert(t, contentBlocksToText(var16))
		end
	end
	return table.concat(t)
end

local _ = function(p8, p9)
	for i, v in p8 do
		if v == p9 then
			return p8
		end
	end
	local t = {}
	
	for i_1, v_1 in p8 do
		table.insert(t, v_1)
	end
	table.insert(t, p9)
	
	return t
end

local _ = function(p10, p11, p12, p13)
	local cloned = table.clone(p10)
	local t = {}
	
	for i, v in p13 do
		table.insert(t, v)
	end
	cloned[p12] = t
	
	for i, v_1 in p11 do
		if v_1 == p12 then
			return cloned, p11
		end
	end
	local t_1 = {}
	
	for i_2, v_2 in p11 do
		table.insert(t_1, v_2)
	end
	table.insert(t_1, p12)
	
	return cloned, t_1
end

local function appendMessageContent(p14, p15, p16, p17)
	local var24
	local cloned = table.clone(p14)
	local var22 = cloned[p16]
	
	if var22 == nil then
		var24 = {}
	else
		local t = {}
		
		for i, v in var22 do
			table.insert(t, v)
		end
		var24 = t
	end
	table.insert(var24, p17)
	cloned[p16] = var24
	
	for i, v in p15 do
		if v == p16 then
			return cloned, p15
		end
	end
	local t = {}
	
	for i_1, v_1 in p15 do
		table.insert(t, v_1)
	end
	table.insert(t, p16)
	
	return cloned, t
end

local function buildActivityItems(p18, p19)
	local t = {}
	local t_1 = {}
	
	for i in p18 do
		table.insert(t_1, i)
	end
	table.sort(t_1)
	
	for i_1, v in t_1 do
		local var28 = p18[v]
		
		if var28.kind == "agent_message" then
			table.insert(t, { kind = "agent_message", text = var28.text })
		elseif var28.kind == "tool_call" then
			local toolCallId = p19[var28.toolCallId]
			table.insert(t, {
				kind = "tool_call",
				toolCallId = var28.toolCallId,
				title = if toolCallId then toolCallId.title else nil,
				status = if toolCallId then toolCallId.status else nil
			})
		end
	end
	return t
end

local _ = function(p20)
	-- upvalues: buildActivityItems (ref)
	p20.activityItems = buildActivityItems(p20.activitySlots, p20.toolCalls)
end

local _ = function(p21, p22, p23)
	-- upvalues: buildActivityItems (ref)
	if p22 <= 0 then
		return
	end
	local cloned = table.clone(p21.activitySlots)
	cloned[p22] = p23
	p21.activitySlots = cloned
	p21.activityItems = buildActivityItems(p21.activitySlots, p21.toolCalls)
end

local _ = function(p24, p25, p26)
	-- upvalues: buildActivityItems (ref)
	local var30 = if p25 ~= nil then nil else p25.sequenceNumber
	local var31 = if typeof(var30) == "number" and var30 >= 0 then var30 + 1 else nil
	
	if var31 == nil then return end
	if var31 <= 0 then
		return
	end
	var30 = table.clone(p24.activitySlots)
	var30[var31] = p26
	p24.activitySlots = var30
	p24.activityItems = buildActivityItems(p24.activitySlots, p24.toolCalls)
end

local _ = function(p27, p28, p29)
	-- upvalues: buildActivityItems (ref)
	local t = { kind = "tool_call", toolCallId = p29 }
	local var33 = if p28 ~= nil then nil else p28.sequenceNumber
	local var34 = if typeof(var33) == "number" and var33 >= 0 then var33 + 1 else nil
	
	if var34 == nil then return end
	if var34 <= 0 then
		return
	end
	var33 = table.clone(p27.activitySlots)
	var33[var34] = t
	p27.activitySlots = var33
	p27.activityItems = buildActivityItems(p27.activitySlots, p27.toolCalls)
end

local _ = function(p30, p31)
	for i, v in p30.activitySlots do
		if v.kind == "tool_call" and v.toolCallId == p31 then
			return true
		end
	end
	return false
end

local _ = function(p32)
	p32.pendingAgentMessageId = nil
	p32.pendingAgentMessageContent = {}
	p32.pendingAgentMessageSequenceIndex = nil
end

local function appendPendingAgentMessage(p33, p34, p35, p36)
	-- upvalues: contentBlocksToText (ref), buildActivityItems (ref)
	if p33.pendingAgentMessageId ~= nil and p33.pendingAgentMessageId ~= p34 then
		local var35 = contentBlocksToText(p33.pendingAgentMessageContent)
		
		if var35 ~= "" then
			local pendingAgentMessageSequenceIndex = p33.pendingAgentMessageSequenceIndex
			
			if pendingAgentMessageSequenceIndex ~= nil then
				local t = { kind = "agent_message", text = var35 }
				
				if pendingAgentMessageSequenceIndex > 0 then
					local cloned = table.clone(p33.activitySlots)
					cloned[pendingAgentMessageSequenceIndex] = t
					p33.activitySlots = cloned
					p33.activityItems = buildActivityItems(p33.activitySlots, p33.toolCalls)
				end
			end
		end
		p33.pendingAgentMessageId = nil
		p33.pendingAgentMessageContent = {}
		p33.pendingAgentMessageSequenceIndex = nil
	end
	local t = {}
	
	for i, v in p33.pendingAgentMessageContent do
		table.insert(t, v)
	end
	table.insert(t, p35)
	p33.pendingAgentMessageId = p34
	p33.pendingAgentMessageContent = t
	
	if p33.pendingAgentMessageSequenceIndex == nil then
		local var39 = if p36 ~= nil then nil else p36.sequenceNumber
		p33.pendingAgentMessageSequenceIndex = if typeof(var39) == "number" and var39 >= 0 then var39 + 1 else nil
	end
end

local function flushPendingAgentMessageToActivity(p37)
	-- upvalues: contentBlocksToText (ref), buildActivityItems (ref)
	local var40 = contentBlocksToText(p37.pendingAgentMessageContent)
	
	if var40 ~= "" then
		local pendingAgentMessageSequenceIndex = p37.pendingAgentMessageSequenceIndex
		
		if pendingAgentMessageSequenceIndex ~= nil then
			local t = { kind = "agent_message", text = var40 }
			
			if pendingAgentMessageSequenceIndex > 0 then
				local cloned = table.clone(p37.activitySlots)
				cloned[pendingAgentMessageSequenceIndex] = t
				p37.activitySlots = cloned
				p37.activityItems = buildActivityItems(p37.activitySlots, p37.toolCalls)
			end
		end
	end
	p37.pendingAgentMessageId = nil
	p37.pendingAgentMessageContent = {}
	p37.pendingAgentMessageSequenceIndex = nil
end

local function flushPendingAgentMessageToAssistant(p38)
	-- upvalues: appendMessageContent (ref), messageMapToText (ref)
	local pendingAgentMessageId = p38.pendingAgentMessageId
	
	if pendingAgentMessageId == nil then
		p38.pendingAgentMessageId = nil
		p38.pendingAgentMessageContent = {}
		p38.pendingAgentMessageSequenceIndex = nil
		
		return
	end
	local assistantMessages = p38.assistantMessages
	local assistantMessageOrder = p38.assistantMessageOrder
	
	for i, v in p38.pendingAgentMessageContent do
		local var43, var44 = appendMessageContent(assistantMessages, assistantMessageOrder, pendingAgentMessageId, v)
		assistantMessages = var43
		assistantMessageOrder = var44
	end
	p38.assistantMessages = assistantMessages
	p38.assistantMessageOrder = assistantMessageOrder
	p38.assistantText = messageMapToText(assistantMessages, assistantMessageOrder)
	p38.pendingAgentMessageId = nil
	p38.pendingAgentMessageContent = {}
	p38.pendingAgentMessageSequenceIndex = nil
end

local _ = function(p39)
	local roblox = p39._meta and p39._meta._roblox
	
	return if typeof(roblox) == "table" then roblox else nil
end

local function recordEventMeta(p40, p41, p42)
	if typeof(p41) ~= "number" or p41 < 0 then return end
	local roblox = p42._meta and p42._meta._roblox
	local var47 = if typeof(roblox) == "table" then roblox else nil
	
	if var47 == nil then return end
	local turnId = var47.turnId
	local emittedTime = var47.emittedTime
	local referenceId = var47.referenceId
	local var48 = typeof(turnId) == "number" and turnId > 0
	local var49 = typeof(emittedTime) == "string" and emittedTime ~= ""
	local var50 = typeof(referenceId) == "string" and referenceId ~= ""
	
	if not var48 and not var49 and not var50 then return end
	local var51 = if p40.eventMetaBySequenceId ~= nil then {} else table.clone(p40.eventMetaBySequenceId)
	local var52 = if var51[p41] ~= nil then {} else table.clone(var51[p41])
	
	if var48 then
		var52.turnId = turnId
	end
	if var49 then
		var52.emittedTime = emittedTime
	end
	if var50 then
		var52.referenceId = referenceId
	end
	var51[p41] = var52
	p40.eventMetaBySequenceId = var51
end

local function extractTurnId(p43)
	local roblox = p43._meta and p43._meta._roblox
	local var54 = if typeof(roblox) == "table" then roblox else nil
	local var55 = if typeof(var54) == "table" then var54.turnId else nil
	
	return if typeof(var55) == "number" and var55 > 0 then var55 else nil
end

local _ = function(p44)
	local roblox = p44._meta and p44._meta._roblox
	local var57 = if typeof(roblox) == "table" then roblox else nil
	local var58 = if typeof(var57) == "table" then var57.referenceId else nil
	
	return if typeof(var58) == "string" and var58 ~= "" then var58 else nil
end

local function applyToolCallUpdate(p45, p46, p47)
	-- upvalues: buildActivityItems (ref)
	local toolCallId = p46.toolCallId
	
	if typeof(toolCallId) ~= "string" or toolCallId == "" then return end
	local var59 = p45.toolCalls[toolCallId]
	local var60 = var59 == nil
	local var61 = if var59 ~= nil then { toolCallId = toolCallId } else table.clone(var59)
	
	if p46.title ~= nil then
		var61.title = p46.title
	end
	if p46.kind ~= nil then
		var61.kind = p46.kind
	end
	if p46.status ~= nil then
		var61.status = p46.status
	end
	if p46.rawInput ~= nil then
		var61.rawInput = p46.rawInput
	end
	if p46.rawOutput ~= nil then
		var61.rawOutput = p46.rawOutput
	end
	if p46.content ~= nil then
		var61.content = p46.content
	end
	local roblox = p46._meta and p46._meta._roblox
	local var63 = if typeof(roblox) == "table" then roblox else nil
	local var64 = if typeof(var63) == "table" then var63.turnId else nil
	local var65 = if typeof(var64) == "number" and var64 > 0 then var64 else nil
	
	if var65 ~= nil then
		var61.turnId = var65
	end
	local roblox_1 = p46._meta and p46._meta._roblox
	var64 = if typeof(roblox_1) == "table" then roblox_1 else nil
	local var67 = if typeof(var64) == "table" then var64.referenceId else nil
	local var68 = if typeof(var67) == "string" and var67 ~= "" then var67 else nil
	
	if var68 ~= nil then
		var61.referenceId = var68
	end
	var64 = table.clone(p45.toolCalls)
	var64[toolCallId] = var61
	p45.toolCalls = var64
	
	if var60 then
		p45.toolCallCount += 1
	end
	if not var60 then
		for i, v in p45.activitySlots do
			if v.kind == "tool_call" and v.toolCallId == toolCallId then
				var67 = true
				if var67 then
					p45.activityItems = buildActivityItems(p45.activitySlots, p45.toolCalls)
					
					return
				end
			end
		end
		var67 = false
	end
	var67 = { kind = "tool_call", toolCallId = toolCallId }
	local var69 = if p47 ~= nil then nil else p47.sequenceNumber
	local var70 = if typeof(var69) == "number" and var69 >= 0 then var69 + 1 else nil
	
	if var70 == nil then return end
	if var70 <= 0 then
		return
	end
	var69 = table.clone(p45.activitySlots)
	var69[var70] = var67
	p45.activitySlots = var69
	p45.activityItems = buildActivityItems(p45.activitySlots, p45.toolCalls)
end

local function applyToolCallContentChunk(p48, p49, p50)
	-- upvalues: buildActivityItems (ref)
	local toolCallId = p49.toolCallId
	local content = p49.content
	
	if typeof(toolCallId) ~= "string" or toolCallId == "" or typeof(content) ~= "table" then return end
	local var75
	local var71 = p48.toolCalls[toolCallId]
	local var72 = var71 == nil
	local var73 = if var71 ~= nil then { toolCallId = toolCallId } else table.clone(var71)
	local content_1 = var73.content
	
	if content_1 == nil then
		var75 = {}
	else
		local t = {}
		
		for i, v in content_1 do
			table.insert(t, v)
		end
		var75 = t
	end
	table.insert(var75, content)
	var73.content = var75
	local cloned = table.clone(p48.toolCalls)
	cloned[toolCallId] = var73
	p48.toolCalls = cloned
	
	if var72 then
		p48.toolCallCount += 1
	end
	if not var72 then
		local var77
		for i, v in p48.activitySlots do
			if v.kind == "tool_call" and v.toolCallId == toolCallId then
				var77 = true
				if var77 then
					p48.activityItems = buildActivityItems(p48.activitySlots, p48.toolCalls)
					
					return
				end
			end
		end
		var77 = false
	end
	local t = { kind = "tool_call", toolCallId = toolCallId }
	local var79 = if p50 ~= nil then nil else p50.sequenceNumber
	local var80 = if typeof(var79) == "number" and var79 >= 0 then var79 + 1 else nil
	
	if var80 == nil then return end
	if var80 <= 0 then
		return
	end
	var79 = table.clone(p48.activitySlots)
	var79[var80] = t
	p48.activitySlots = var79
	p48.activityItems = buildActivityItems(p48.activitySlots, p48.toolCalls)
end

return {
	applySessionUpdate = function(p51, p52, p53)
		-- upvalues: recordEventMeta (ref), flushPendingAgentMessageToAssistant (ref), flushPendingAgentMessageToActivity (ref), messageMapToText (ref), appendPendingAgentMessage (ref), applyToolCallUpdate (ref), applyToolCallContentChunk (ref)
		local messageId, var82
		local sessionUpdate = p52.sessionUpdate
		local cloned = table.clone(p51)
		recordEventMeta(cloned, if p53 ~= nil then nil else p53.sequenceNumber, p52)
		
		if cloned.status == "queued" then
			cloned.status = "streaming"
		end
		if sessionUpdate ~= "agent_message_chunk" then
			if sessionUpdate == "state_change" and p52.state == "idle" then
				flushPendingAgentMessageToAssistant(cloned)
			else
				flushPendingAgentMessageToActivity(cloned)
			end
		end
		if sessionUpdate == "agent_message" then
			messageId = p52.messageId
			var82 = if typeof(messageId) == "string" and messageId ~= "" then messageId else nil
			messageId = p52.content
			
			if var82 == nil or typeof(messageId) ~= "table" then
				return cloned
			end
			local assistantMessageOrder = cloned.assistantMessageOrder
			local cloned_1 = table.clone(cloned.assistantMessages)
			local t = {}
			
			for i, v in messageId do
				table.insert(t, v)
			end
			local var87
			cloned_1[var82] = t
			
			for i_1, v_1 in assistantMessageOrder do
				if v_1 == var82 then
					var87 = assistantMessageOrder
					cloned.assistantMessages = cloned_1
					cloned.assistantMessageOrder = var87
					cloned.assistantText = messageMapToText(cloned.assistantMessages, cloned.assistantMessageOrder)
					
					return cloned
				end
			end
			local t_1 = {}
			
			for i, v_2 in assistantMessageOrder do
				table.insert(t_1, v_2)
			end
			local var86 = t_1
			table.insert(var86, var82)
			var87 = var86
		elseif sessionUpdate == "agent_message_chunk" then
			messageId = p52.messageId
			var82 = if typeof(messageId) == "string" and messageId ~= "" then messageId else nil
			messageId = p52.content
			
			if var82 == nil or typeof(messageId) ~= "table" then
			else
				appendPendingAgentMessage(cloned, var82, messageId, p53)
				
				return cloned
			end
		elseif sessionUpdate == "tool_call_update" then
			applyToolCallUpdate(cloned, p52, p53)
			
			return cloned
		elseif sessionUpdate == "tool_call_content_chunk" then
			applyToolCallContentChunk(cloned, p52, p53)
			
			return cloned
		elseif sessionUpdate == "state_change" then
			if p52.state == "running" or p52.state == "requires_action" then
				cloned.status = "streaming"
				
				return cloned
			elseif p52.state ~= "idle" then
			end
			var82 = p52.stop_reason
			
			if typeof(var82) == "string" then
				cloned.stopReason = var82
			else
				cloned.stopReason = "end_turn"
			end
			cloned.status = if cloned.stopReason == "cancelled" then "cancelled" else "succeeded"
			cloned.isDone = true
			
			return cloned
		elseif sessionUpdate == "session_info_update" then
			cloned.infoUpdate = { title = p52.title }
		end
	end,
	createEmptyTurnState = createEmptyTurnState,
	extractTurnId = extractTurnId
}