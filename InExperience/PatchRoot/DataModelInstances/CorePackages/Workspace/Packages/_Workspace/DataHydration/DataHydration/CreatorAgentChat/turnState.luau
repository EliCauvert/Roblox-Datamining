local _ = require(script.Parent.types)

local function createEmptyTurnState(p1, p2)
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
		sessionId = p1,
		requestId = p2,
		assistantMessages = {},
		assistantMessageOrder = {},
		pendingAgentMessageContent = {},
		activitySlots = {},
		activityItems = {},
		toolCalls = {},
		eventMetaBySequenceId = {}
	}
end

local function _(p1)
	local var1 = if p1 ~= nil then nil else p1.sequenceNumber
	
	return if typeof(var1) == "number" and var1 >= 0 then var1 + 1 else nil
end

local _ = function(p1)
	local messageId = p1.messageId
	
	return if typeof(messageId) == "string" and messageId ~= "" then messageId else nil
end

local _ = function(p1)
	local t = {}
	
	for i, v in p1 do
		table.insert(t, v)
	end
	return t
end

local function contentBlocksToText(p2)
	local t = {}
	
	for i, v in p2 do
		if v.type == "text" and typeof(v.text) == "string" then
			table.insert(t, v.text)
		end
	end
	return table.concat(t)
end

local function messageMapToText(p3, p4)
	-- upvalues: contentBlocksToText (ref)
	local t = {}
	
	for i, v in p4 do
		local var1 = p3[v]
		
		if var1 ~= nil then
			table.insert(t, contentBlocksToText(var1))
		end
	end
	return table.concat(t)
end

local _ = function(p5, p6)
	for i, v in p5 do
		if v == p6 then
			return p5
		end
	end
	local t = {}
	
	for i_1, v_1 in p5 do
		table.insert(t, v_1)
	end
	table.insert(t, p6)
	
	return t
end

local _ = function(p7, p8, p9, p10)
	local cloned = table.clone(p7)
	local t = {}
	
	for i, v in p10 do
		table.insert(t, v)
	end
	cloned[p9] = t
	
	for i, v_1 in p8 do
		if v_1 == p9 then
			return cloned, p8
		end
	end
	local t_1 = {}
	
	for i_2, v_2 in p8 do
		table.insert(t_1, v_2)
	end
	table.insert(t_1, p9)
	
	return cloned, t_1
end

local function appendMessageContent(p11, p12, p13, p14)
	local var2
	local cloned = table.clone(p11)
	local var3 = cloned[p13]
	
	if var3 == nil then
		var2 = {}
	else
		local t = {}
		
		for i, v in var3 do
			table.insert(t, v)
		end
		var2 = t
	end
	table.insert(var2, p14)
	cloned[p13] = var2
	
	for i, v in p12 do
		if v == p13 then
			return cloned, p12
		end
	end
	local t = {}
	
	for i_1, v_1 in p12 do
		table.insert(t, v_1)
	end
	table.insert(t, p13)
	
	return cloned, t
end

local function buildActivityItems(p15, p16)
	local t = {}
	local t_1 = {}
	
	for i in p15 do
		table.insert(t_1, i)
	end
	table.sort(t_1)
	
	for i_1, v in t_1 do
		local var4 = p15[v]
		
		if var4.kind == "agent_message" then
			table.insert(t, { kind = "agent_message", text = var4.text })
		elseif var4.kind == "tool_call" then
			local toolCallId = p16[var4.toolCallId]
			table.insert(t, {
				kind = "tool_call",
				toolCallId = var4.toolCallId,
				title = if toolCallId then toolCallId.title else nil,
				status = if toolCallId then toolCallId.status else nil
			})
		end
	end
	return t
end

local _ = function(p17)
	-- upvalues: buildActivityItems (ref)
	p17.activityItems = buildActivityItems(p17.activitySlots, p17.toolCalls)
end

local _ = function(p17, p18, p19)
	-- upvalues: buildActivityItems (ref)
	if p18 <= 0 then
		return
	end
	local cloned = table.clone(p17.activitySlots)
	cloned[p18] = p19
	p17.activitySlots = cloned
	p17.activityItems = buildActivityItems(p17.activitySlots, p17.toolCalls)
end

local _ = function(p17, p18, p19)
	-- upvalues: buildActivityItems (ref)
	local var5 = if p18 ~= nil then nil else p18.sequenceNumber
	local var6 = if typeof(var5) == "number" and var5 >= 0 then var5 + 1 else nil
	
	if var6 == nil then return end
	if var6 <= 0 then
		return
	end
	var5 = table.clone(p17.activitySlots)
	var5[var6] = p19
	p17.activitySlots = var5
	p17.activityItems = buildActivityItems(p17.activitySlots, p17.toolCalls)
end

local _ = function(p17, p18, p19)
	-- upvalues: buildActivityItems (ref)
	local t = { kind = "tool_call", toolCallId = p19 }
	local var5 = if p18 ~= nil then nil else p18.sequenceNumber
	local var6 = if typeof(var5) == "number" and var5 >= 0 then var5 + 1 else nil
	
	if var6 == nil then return end
	if var6 <= 0 then
		return
	end
	var5 = table.clone(p17.activitySlots)
	var5[var6] = t
	p17.activitySlots = var5
	p17.activityItems = buildActivityItems(p17.activitySlots, p17.toolCalls)
end

local _ = function(p17, p18)
	for i, v in p17.activitySlots do
		if v.kind == "tool_call" and v.toolCallId == p18 then
			return true
		end
	end
	return false
end

local _ = function(p19)
	p19.pendingAgentMessageId = nil
	p19.pendingAgentMessageContent = {}
	p19.pendingAgentMessageSequenceIndex = nil
end

local function appendPendingAgentMessage(p19, p20, p21, p22)
	-- upvalues: contentBlocksToText (ref), buildActivityItems (ref)
	if p19.pendingAgentMessageId ~= nil and p19.pendingAgentMessageId ~= p20 then
		local var5 = contentBlocksToText(p19.pendingAgentMessageContent)
		
		if var5 ~= "" then
			local pendingAgentMessageSequenceIndex = p19.pendingAgentMessageSequenceIndex
			
			if pendingAgentMessageSequenceIndex ~= nil then
				local t = { kind = "agent_message", text = var5 }
				
				if pendingAgentMessageSequenceIndex > 0 then
					local cloned = table.clone(p19.activitySlots)
					cloned[pendingAgentMessageSequenceIndex] = t
					p19.activitySlots = cloned
					p19.activityItems = buildActivityItems(p19.activitySlots, p19.toolCalls)
				end
			end
		end
		p19.pendingAgentMessageId = nil
		p19.pendingAgentMessageContent = {}
		p19.pendingAgentMessageSequenceIndex = nil
	end
	local t = {}
	
	for i, v in p19.pendingAgentMessageContent do
		table.insert(t, v)
	end
	table.insert(t, p21)
	p19.pendingAgentMessageId = p20
	p19.pendingAgentMessageContent = t
	
	if p19.pendingAgentMessageSequenceIndex == nil then
		local var6 = if p22 ~= nil then nil else p22.sequenceNumber
		p19.pendingAgentMessageSequenceIndex = if typeof(var6) == "number" and var6 >= 0 then var6 + 1 else nil
	end
end

local function flushPendingAgentMessageToActivity(p23)
	-- upvalues: contentBlocksToText (ref), buildActivityItems (ref)
	local var7 = contentBlocksToText(p23.pendingAgentMessageContent)
	
	if var7 ~= "" then
		local pendingAgentMessageSequenceIndex = p23.pendingAgentMessageSequenceIndex
		
		if pendingAgentMessageSequenceIndex ~= nil then
			local t = { kind = "agent_message", text = var7 }
			
			if pendingAgentMessageSequenceIndex > 0 then
				local cloned = table.clone(p23.activitySlots)
				cloned[pendingAgentMessageSequenceIndex] = t
				p23.activitySlots = cloned
				p23.activityItems = buildActivityItems(p23.activitySlots, p23.toolCalls)
			end
		end
	end
	p23.pendingAgentMessageId = nil
	p23.pendingAgentMessageContent = {}
	p23.pendingAgentMessageSequenceIndex = nil
end

local function flushPendingAgentMessageToAssistant(p23)
	-- upvalues: appendMessageContent (ref), messageMapToText (ref)
	local pendingAgentMessageId = p23.pendingAgentMessageId
	
	if pendingAgentMessageId == nil then
		p23.pendingAgentMessageId = nil
		p23.pendingAgentMessageContent = {}
		p23.pendingAgentMessageSequenceIndex = nil
		
		return
	end
	local assistantMessages = p23.assistantMessages
	local assistantMessageOrder = p23.assistantMessageOrder
	
	for i, v in p23.pendingAgentMessageContent do
		local var7, var8 = appendMessageContent(assistantMessages, assistantMessageOrder, pendingAgentMessageId, v)
		assistantMessages = var7
		assistantMessageOrder = var8
	end
	p23.assistantMessages = assistantMessages
	p23.assistantMessageOrder = assistantMessageOrder
	p23.assistantText = messageMapToText(assistantMessages, assistantMessageOrder)
	p23.pendingAgentMessageId = nil
	p23.pendingAgentMessageContent = {}
	p23.pendingAgentMessageSequenceIndex = nil
end

local _ = function(p24)
	local roblox = p24._meta and p24._meta._roblox
	
	return if typeof(roblox) == "table" then roblox else nil
end

local function recordEventMeta(p24, p25, p26)
	if typeof(p25) ~= "number" or p25 < 0 then return end
	local roblox = p26._meta and p26._meta._roblox
	local var9 = if typeof(roblox) == "table" then roblox else nil
	
	if var9 == nil then return end
	local turnId = var9.turnId
	local emittedTime = var9.emittedTime
	local referenceId = var9.referenceId
	local var10 = typeof(turnId) == "number" and turnId > 0
	local var11 = typeof(emittedTime) == "string" and emittedTime ~= ""
	local var12 = typeof(referenceId) == "string" and referenceId ~= ""
	
	if not var10 and not var11 and not var12 then return end
	local var13 = if p24.eventMetaBySequenceId ~= nil then {} else table.clone(p24.eventMetaBySequenceId)
	local var14 = if var13[p25] ~= nil then {} else table.clone(var13[p25])
	
	if var10 then
		var14.turnId = turnId
	end
	if var11 then
		var14.emittedTime = emittedTime
	end
	if var12 then
		var14.referenceId = referenceId
	end
	var13[p25] = var14
	p24.eventMetaBySequenceId = var13
end

local function extractTurnId(p24)
	local roblox = p24._meta and p24._meta._roblox
	local var9 = if typeof(roblox) == "table" then roblox else nil
	local var10 = if typeof(var9) == "table" then var9.turnId else nil
	
	return if typeof(var10) == "number" and var10 > 0 then var10 else nil
end

local _ = function(p24)
	local roblox = p24._meta and p24._meta._roblox
	local var9 = if typeof(roblox) == "table" then roblox else nil
	local var10 = if typeof(var9) == "table" then var9.referenceId else nil
	
	return if typeof(var10) == "string" and var10 ~= "" then var10 else nil
end

local function applyToolCallUpdate(p24, p25, p26)
	-- upvalues: buildActivityItems (ref)
	local toolCallId = p25.toolCallId
	
	if typeof(toolCallId) ~= "string" or toolCallId == "" then return end
	local var9 = p24.toolCalls[toolCallId]
	local var10 = var9 == nil
	local var11 = if var9 ~= nil then { toolCallId = toolCallId } else table.clone(var9)
	
	if p25.title ~= nil then
		var11.title = p25.title
	end
	if p25.kind ~= nil then
		var11.kind = p25.kind
	end
	if p25.status ~= nil then
		var11.status = p25.status
	end
	if p25.rawInput ~= nil then
		var11.rawInput = p25.rawInput
	end
	if p25.rawOutput ~= nil then
		var11.rawOutput = p25.rawOutput
	end
	if p25.content ~= nil then
		var11.content = p25.content
	end
	local roblox = p25._meta and p25._meta._roblox
	local var12 = if typeof(roblox) == "table" then roblox else nil
	local var13 = if typeof(var12) == "table" then var12.turnId else nil
	local var14 = if typeof(var13) == "number" and var13 > 0 then var13 else nil
	
	if var14 ~= nil then
		var11.turnId = var14
	end
	local roblox_1 = p25._meta and p25._meta._roblox
	var13 = if typeof(roblox_1) == "table" then roblox_1 else nil
	local var15 = if typeof(var13) == "table" then var13.referenceId else nil
	local var16 = if typeof(var15) == "string" and var15 ~= "" then var15 else nil
	
	if var16 ~= nil then
		var11.referenceId = var16
	end
	var13 = table.clone(p24.toolCalls)
	var13[toolCallId] = var11
	p24.toolCalls = var13
	
	if var10 then
		p24.toolCallCount += 1
	end
	if not var10 then
		for i, v in p24.activitySlots do
			if v.kind == "tool_call" and v.toolCallId == toolCallId then
				var15 = true
				if var15 then
					p24.activityItems = buildActivityItems(p24.activitySlots, p24.toolCalls)
					
					return
				end
			end
		end
		var15 = false
	end
	var15 = { kind = "tool_call", toolCallId = toolCallId }
	local var17 = if p26 ~= nil then nil else p26.sequenceNumber
	local var18 = if typeof(var17) == "number" and var17 >= 0 then var17 + 1 else nil
	
	if var18 == nil then return end
	if var18 <= 0 then
		return
	end
	var17 = table.clone(p24.activitySlots)
	var17[var18] = var15
	p24.activitySlots = var17
	p24.activityItems = buildActivityItems(p24.activitySlots, p24.toolCalls)
end

local function applyToolCallContentChunk(p27, p28, p29)
	-- upvalues: buildActivityItems (ref)
	local toolCallId = p28.toolCallId
	local content = p28.content
	
	if typeof(toolCallId) ~= "string" or toolCallId == "" or typeof(content) ~= "table" then return end
	local var19
	local var20 = p27.toolCalls[toolCallId]
	local var21 = var20 == nil
	local var22 = if var20 ~= nil then { toolCallId = toolCallId } else table.clone(var20)
	local content_1 = var22.content
	
	if content_1 == nil then
		var19 = {}
	else
		local t = {}
		
		for i, v in content_1 do
			table.insert(t, v)
		end
		var19 = t
	end
	table.insert(var19, content)
	var22.content = var19
	local cloned = table.clone(p27.toolCalls)
	cloned[toolCallId] = var22
	p27.toolCalls = cloned
	
	if var21 then
		p27.toolCallCount += 1
	end
	if not var21 then
		local var23
		for i, v in p27.activitySlots do
			if v.kind == "tool_call" and v.toolCallId == toolCallId then
				var23 = true
				if var23 then
					p27.activityItems = buildActivityItems(p27.activitySlots, p27.toolCalls)
					
					return
				end
			end
		end
		var23 = false
	end
	local t = { kind = "tool_call", toolCallId = toolCallId }
	local var24 = if p29 ~= nil then nil else p29.sequenceNumber
	local var25 = if typeof(var24) == "number" and var24 >= 0 then var24 + 1 else nil
	
	if var25 == nil then return end
	if var25 <= 0 then
		return
	end
	var24 = table.clone(p27.activitySlots)
	var24[var25] = t
	p27.activitySlots = var24
	p27.activityItems = buildActivityItems(p27.activitySlots, p27.toolCalls)
end

return {
	applySessionUpdate = function(p30, p31, p32)
		-- upvalues: recordEventMeta (ref), flushPendingAgentMessageToAssistant (ref), flushPendingAgentMessageToActivity (ref), messageMapToText (ref), appendPendingAgentMessage (ref), applyToolCallUpdate (ref), applyToolCallContentChunk (ref)
		local messageId, var26
		local sessionUpdate = p31.sessionUpdate
		local cloned = table.clone(p30)
		recordEventMeta(cloned, if p32 ~= nil then nil else p32.sequenceNumber, p31)
		
		if cloned.status == "queued" then
			cloned.status = "streaming"
		end
		if sessionUpdate ~= "agent_message_chunk" then
			if sessionUpdate == "state_change" and p31.state == "idle" then
				flushPendingAgentMessageToAssistant(cloned)
			else
				flushPendingAgentMessageToActivity(cloned)
			end
		end
		if sessionUpdate == "agent_message" then
			messageId = p31.messageId
			var26 = if typeof(messageId) == "string" and messageId ~= "" then messageId else nil
			messageId = p31.content
			
			if var26 == nil or typeof(messageId) ~= "table" then
				return cloned
			end
			local assistantMessageOrder = cloned.assistantMessageOrder
			local cloned_1 = table.clone(cloned.assistantMessages)
			local t = {}
			
			for i, v in messageId do
				table.insert(t, v)
			end
			local var27
			cloned_1[var26] = t
			
			for i_1, v_1 in assistantMessageOrder do
				if v_1 == var26 then
					var27 = assistantMessageOrder
					cloned.assistantMessages = cloned_1
					cloned.assistantMessageOrder = var27
					cloned.assistantText = messageMapToText(cloned.assistantMessages, cloned.assistantMessageOrder)
					
					return cloned
				end
			end
			local t_1 = {}
			
			for i, v_2 in assistantMessageOrder do
				table.insert(t_1, v_2)
			end
			local var28 = t_1
			table.insert(var28, var26)
			var27 = var28
		elseif sessionUpdate == "agent_message_chunk" then
			messageId = p31.messageId
			var26 = if typeof(messageId) == "string" and messageId ~= "" then messageId else nil
			messageId = p31.content
			
			if var26 == nil or typeof(messageId) ~= "table" then
			else
				appendPendingAgentMessage(cloned, var26, messageId, p32)
				
				return cloned
			end
		elseif sessionUpdate == "tool_call_update" then
			applyToolCallUpdate(cloned, p31, p32)
			
			return cloned
		elseif sessionUpdate == "tool_call_content_chunk" then
			applyToolCallContentChunk(cloned, p31, p32)
			
			return cloned
		elseif sessionUpdate == "state_change" then
			if p31.state == "running" or p31.state == "requires_action" then
				cloned.status = "streaming"
				
				return cloned
			elseif p31.state ~= "idle" then
			end
			var26 = p31.stop_reason
			
			if typeof(var26) == "string" then
				cloned.stopReason = var26
			else
				cloned.stopReason = "end_turn"
			end
			cloned.status = if cloned.stopReason == "cancelled" then "cancelled" else "succeeded"
			cloned.isDone = true
			
			return cloned
		elseif sessionUpdate == "session_info_update" then
			cloned.infoUpdate = { title = p31.title }
		end
	end,
	createEmptyTurnState = createEmptyTurnState,
	extractTurnId = extractTurnId
}