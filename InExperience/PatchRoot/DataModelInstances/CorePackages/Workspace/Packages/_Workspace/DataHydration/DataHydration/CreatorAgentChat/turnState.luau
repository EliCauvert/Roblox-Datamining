local _ = require(script.Parent.types)

local function createEmptyTurnState(p0, p1) --[[ line: 18 ]]
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

local function _(p2) --[[ line: 42 | named "getSequenceIndex" ]]
	local var11 = if p2 ~= nil then nil else p2.sequenceNumber
	
	return if typeof(var11) == "number" and var11 >= 0 then var11 + 1 else nil
end

local _ = function(p3) --[[ line: 50 | named "getMessageId" ]]
	local messageId = p3.messageId
	
	return if typeof(messageId) == "string" and messageId ~= "" then messageId else nil
end

local _ = function(p4) --[[ line: 55 | named "cloneArray" ]]
	local t = {}
	
	for i, v in p4 do
		table.insert(t, v)
	end
	return t
end

local function contentBlocksToText(p5) --[[ line: 63 ]]
	local t = {}
	
	for i, v in p5 do
		if v.type == "text" and typeof(v.text) == "string" then
			table.insert(t, v.text)
		end
	end
	return table.concat(t)
end

local function messageMapToText(p6, p7) --[[ line: 73 ]]
	-- upvalues: contentBlocksToText (ref)
	local t = {}
	
	for i, v in p7 do
		local var15 = p6[v]
		
		if var15 ~= nil then
			table.insert(t, contentBlocksToText(var15))
		end
	end
	return table.concat(t)
end

local _ = function(p8, p9) --[[ line: 84 | named "ensureMessageOrder" ]]
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

local _ = function(p10, p11, p12, p13) --[[ line: 95 | named "replaceMessageContent" ]]
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

local function appendMessageContent(p14, p15, p16, p17) --[[ line: 106 ]]
	local var23
	local cloned = table.clone(p14)
	local var21 = cloned[p16]
	
	if var21 == nil then
		var23 = {}
	else
		local t = {}
		
		for i, v in var21 do
			table.insert(t, v)
		end
		var23 = t
	end
	table.insert(var23, p17)
	cloned[p16] = var23
	
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

local function buildActivityItems(p18, p19) --[[ line: 120 ]]
	local t = {}
	local t_1 = {}
	
	for i in p18 do
		table.insert(t_1, i)
	end
	table.sort(t_1)
	
	for i_1, v in t_1 do
		local var27 = p18[v]
		
		if var27.kind == "agent_message" then
			table.insert(t, { kind = "agent_message", text = var27.text })
		elseif var27.kind == "tool_call" then
			local toolCallId = p19[var27.toolCallId]
			table.insert(t, {
				kind = "tool_call",
				toolCallId = var27.toolCallId,
				title = if toolCallId then toolCallId.title else nil,
				status = if toolCallId then toolCallId.status else nil
			})
		end
	end
	return t
end

local _ = function(p20) --[[ line: 153 | named "refreshActivityItems" ]]
	-- upvalues: buildActivityItems (ref)
	p20.activityItems = buildActivityItems(p20.activitySlots, p20.toolCalls)
end

local _ = function(p21, p22, p23) --[[ line: 157 | named "recordActivitySlotAtIndex" ]]
	-- upvalues: buildActivityItems (ref)
	if p22 <= 0 then
		return
	end
	local cloned = table.clone(p21.activitySlots)
	cloned[p22] = p23
	p21.activitySlots = cloned
	p21.activityItems = buildActivityItems(p21.activitySlots, p21.toolCalls)
end

local _ = function(p24, p25, p26) --[[ line: 168 | named "recordActivitySlot" ]]
	-- upvalues: buildActivityItems (ref)
	local var29 = if p25 ~= nil then nil else p25.sequenceNumber
	local var30 = if typeof(var29) == "number" and var29 >= 0 then var29 + 1 else nil
	
	if var30 == nil then return end
	if var30 <= 0 then
		return
	end
	var29 = table.clone(p24.activitySlots)
	var29[var30] = p26
	p24.activitySlots = var29
	p24.activityItems = buildActivityItems(p24.activitySlots, p24.toolCalls)
end

local _ = function(p27, p28, p29) --[[ line: 177 | named "recordToolCallSequenceSlot" ]]
	-- upvalues: buildActivityItems (ref)
	local t = { kind = "tool_call", toolCallId = p29 }
	local var32 = if p28 ~= nil then nil else p28.sequenceNumber
	local var33 = if typeof(var32) == "number" and var32 >= 0 then var32 + 1 else nil
	
	if var33 == nil then return end
	if var33 <= 0 then
		return
	end
	var32 = table.clone(p27.activitySlots)
	var32[var33] = t
	p27.activitySlots = var32
	p27.activityItems = buildActivityItems(p27.activitySlots, p27.toolCalls)
end

local _ = function(p30, p31) --[[ line: 181 | named "hasToolCallActivitySlot" ]]
	for i, v in p30.activitySlots do
		if v.kind == "tool_call" and v.toolCallId == p31 then
			return true
		end
	end
	return false
end

local _ = function(p32) --[[ line: 190 | named "clearPendingAgentMessage" ]]
	p32.pendingAgentMessageId = nil
	p32.pendingAgentMessageContent = {}
	p32.pendingAgentMessageSequenceIndex = nil
end

local function appendPendingAgentMessage(p33, p34, p35, p36) --[[ line: 196 ]]
	-- upvalues: contentBlocksToText (ref), buildActivityItems (ref)
	if p33.pendingAgentMessageId ~= nil and p33.pendingAgentMessageId ~= p34 then
		local var34 = contentBlocksToText(p33.pendingAgentMessageContent)
		
		if var34 ~= "" then
			local pendingAgentMessageSequenceIndex = p33.pendingAgentMessageSequenceIndex
			
			if pendingAgentMessageSequenceIndex ~= nil then
				local t = { kind = "agent_message", text = var34 }
				
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
		local var38 = if p36 ~= nil then nil else p36.sequenceNumber
		p33.pendingAgentMessageSequenceIndex = if typeof(var38) == "number" and var38 >= 0 then var38 + 1 else nil
	end
end

local function flushPendingAgentMessageToActivity(p37) --[[ line: 222 ]]
	-- upvalues: contentBlocksToText (ref), buildActivityItems (ref)
	local var39 = contentBlocksToText(p37.pendingAgentMessageContent)
	
	if var39 ~= "" then
		local pendingAgentMessageSequenceIndex = p37.pendingAgentMessageSequenceIndex
		
		if pendingAgentMessageSequenceIndex ~= nil then
			local t = { kind = "agent_message", text = var39 }
			
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

local function flushPendingAgentMessageToAssistant(p38) --[[ line: 233 ]]
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
		local var42, var43 = appendMessageContent(assistantMessages, assistantMessageOrder, pendingAgentMessageId, v)
		assistantMessages = var42
		assistantMessageOrder = var43
	end
	p38.assistantMessages = assistantMessages
	p38.assistantMessageOrder = assistantMessageOrder
	p38.assistantText = messageMapToText(assistantMessages, assistantMessageOrder)
	p38.pendingAgentMessageId = nil
	p38.pendingAgentMessageContent = {}
	p38.pendingAgentMessageSequenceIndex = nil
end

local _ = function(p39) --[[ line: 251 | named "extractRobloxMeta" ]]
	local roblox = p39._meta and p39._meta._roblox
	
	return if typeof(roblox) == "table" then roblox else nil
end

local function recordEventMeta(p40, p41, p42) --[[ line: 256 ]]
	if typeof(p41) ~= "number" or p41 < 0 then return end
	local roblox = p42._meta and p42._meta._roblox
	local var46 = if typeof(roblox) == "table" then roblox else nil
	
	if var46 == nil then return end
	local turnId = var46.turnId
	local emittedTime = var46.emittedTime
	local referenceId = var46.referenceId
	local var47 = typeof(turnId) == "number" and turnId > 0
	local var48 = typeof(emittedTime) == "string" and emittedTime ~= ""
	local var49 = typeof(referenceId) == "string" and referenceId ~= ""
	
	if not var47 and not var48 and not var49 then return end
	local var50 = if p40.eventMetaBySequenceId ~= nil then {} else table.clone(p40.eventMetaBySequenceId)
	local var51 = if var50[p41] ~= nil then {} else table.clone(var50[p41])
	
	if var47 then
		var51.turnId = turnId
	end
	if var48 then
		var51.emittedTime = emittedTime
	end
	if var49 then
		var51.referenceId = referenceId
	end
	var50[p41] = var51
	p40.eventMetaBySequenceId = var50
end

local _ = function(p43) --[[ line: 295 | named "extractTurnId" ]]
	local roblox = p43._meta and p43._meta._roblox
	local var53 = if typeof(roblox) == "table" then roblox else nil
	local var54 = if typeof(var53) == "table" then var53.turnId else nil
	
	return if typeof(var54) == "number" and var54 > 0 then var54 else nil
end

local _ = function(p44) --[[ line: 301 | named "extractReferenceId" ]]
	local roblox = p44._meta and p44._meta._roblox
	local var56 = if typeof(roblox) == "table" then roblox else nil
	local var57 = if typeof(var56) == "table" then var56.referenceId else nil
	
	return if typeof(var57) == "string" and var57 ~= "" then var57 else nil
end

local function applyToolCallUpdate(p45, p46, p47) --[[ line: 307 ]]
	-- upvalues: buildActivityItems (ref)
	local toolCallId = p46.toolCallId
	
	if typeof(toolCallId) ~= "string" or toolCallId == "" then return end
	local var58 = p45.toolCalls[toolCallId]
	local var59 = var58 == nil
	local var60 = if var58 ~= nil then { toolCallId = toolCallId } else table.clone(var58)
	
	if p46.title ~= nil then
		var60.title = p46.title
	end
	if p46.kind ~= nil then
		var60.kind = p46.kind
	end
	if p46.status ~= nil then
		var60.status = p46.status
	end
	if p46.rawInput ~= nil then
		var60.rawInput = p46.rawInput
	end
	if p46.rawOutput ~= nil then
		var60.rawOutput = p46.rawOutput
	end
	if p46.content ~= nil then
		var60.content = p46.content
	end
	local roblox = p46._meta and p46._meta._roblox
	local var62 = if typeof(roblox) == "table" then roblox else nil
	local var63 = if typeof(var62) == "table" then var62.turnId else nil
	local var64 = if typeof(var63) == "number" and var63 > 0 then var63 else nil
	
	if var64 ~= nil then
		var60.turnId = var64
	end
	local roblox_1 = p46._meta and p46._meta._roblox
	var63 = if typeof(roblox_1) == "table" then roblox_1 else nil
	local var66 = if typeof(var63) == "table" then var63.referenceId else nil
	local var67 = if typeof(var66) == "string" and var66 ~= "" then var66 else nil
	
	if var67 ~= nil then
		var60.referenceId = var67
	end
	var63 = table.clone(p45.toolCalls)
	var63[toolCallId] = var60
	p45.toolCalls = var63
	
	if var59 then
		p45.toolCallCount += 1
	end
	if not var59 then
		for i, v in p45.activitySlots do
			if v.kind == "tool_call" and v.toolCallId == toolCallId then
				var66 = true
				if var66 then
					p45.activityItems = buildActivityItems(p45.activitySlots, p45.toolCalls)
					
					return
				end
			end
		end
		var66 = false
	end
	var66 = { kind = "tool_call", toolCallId = toolCallId }
	local var68 = if p47 ~= nil then nil else p47.sequenceNumber
	local var69 = if typeof(var68) == "number" and var68 >= 0 then var68 + 1 else nil
	
	if var69 == nil then return end
	if var69 <= 0 then
		return
	end
	var68 = table.clone(p45.activitySlots)
	var68[var69] = var66
	p45.activitySlots = var68
	p45.activityItems = buildActivityItems(p45.activitySlots, p45.toolCalls)
end

local function applyToolCallContentChunk(p48, p49, p50) --[[ line: 356 ]]
	-- upvalues: buildActivityItems (ref)
	local toolCallId = p49.toolCallId
	local content = p49.content
	
	if typeof(toolCallId) ~= "string" or toolCallId == "" or typeof(content) ~= "table" then return end
	local var74
	local var70 = p48.toolCalls[toolCallId]
	local var71 = var70 == nil
	local var72 = if var70 ~= nil then { toolCallId = toolCallId } else table.clone(var70)
	local content_1 = var72.content
	
	if content_1 == nil then
		var74 = {}
	else
		local t = {}
		
		for i, v in content_1 do
			table.insert(t, v)
		end
		var74 = t
	end
	table.insert(var74, content)
	var72.content = var74
	local cloned = table.clone(p48.toolCalls)
	cloned[toolCallId] = var72
	p48.toolCalls = cloned
	
	if var71 then
		p48.toolCallCount += 1
	end
	if not var71 then
		local var76
		for i, v in p48.activitySlots do
			if v.kind == "tool_call" and v.toolCallId == toolCallId then
				var76 = true
				if var76 then
					p48.activityItems = buildActivityItems(p48.activitySlots, p48.toolCalls)
					
					return
				end
			end
		end
		var76 = false
	end
	local t = { kind = "tool_call", toolCallId = toolCallId }
	local var78 = if p50 ~= nil then nil else p50.sequenceNumber
	local var79 = if typeof(var78) == "number" and var78 >= 0 then var78 + 1 else nil
	
	if var79 == nil then return end
	if var79 <= 0 then
		return
	end
	var78 = table.clone(p48.activitySlots)
	var78[var79] = t
	p48.activitySlots = var78
	p48.activityItems = buildActivityItems(p48.activitySlots, p48.toolCalls)
end

return {
	applySessionUpdate = function(p51, p52, p53) --[[ line: 385 ]]
		-- upvalues: recordEventMeta (ref), flushPendingAgentMessageToAssistant (ref), flushPendingAgentMessageToActivity (ref), messageMapToText (ref), appendPendingAgentMessage (ref), applyToolCallUpdate (ref), applyToolCallContentChunk (ref)
		local messageId, var81
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
			var81 = if typeof(messageId) == "string" and messageId ~= "" then messageId else nil
			messageId = p52.content
			
			if var81 == nil or typeof(messageId) ~= "table" then
				return cloned
			end
			local assistantMessageOrder = cloned.assistantMessageOrder
			local cloned_1 = table.clone(cloned.assistantMessages)
			local t = {}
			
			for i, v in messageId do
				table.insert(t, v)
			end
			local var86
			cloned_1[var81] = t
			
			for i_1, v_1 in assistantMessageOrder do
				if v_1 == var81 then
					var86 = assistantMessageOrder
					cloned.assistantMessages = cloned_1
					cloned.assistantMessageOrder = var86
					cloned.assistantText = messageMapToText(cloned.assistantMessages, cloned.assistantMessageOrder)
					
					return cloned
				end
			end
			local t_1 = {}
			
			for i, v_2 in assistantMessageOrder do
				table.insert(t_1, v_2)
			end
			local var85 = t_1
			table.insert(var85, var81)
			var86 = var85
		elseif sessionUpdate == "agent_message_chunk" then
			messageId = p52.messageId
			var81 = if typeof(messageId) == "string" and messageId ~= "" then messageId else nil
			messageId = p52.content
			
			if var81 == nil or typeof(messageId) ~= "table" then
			else
				appendPendingAgentMessage(cloned, var81, messageId, p53)
				
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
			var81 = p52.stop_reason
			
			if typeof(var81) == "string" then
				cloned.stopReason = var81
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
	createEmptyTurnState = createEmptyTurnState
}