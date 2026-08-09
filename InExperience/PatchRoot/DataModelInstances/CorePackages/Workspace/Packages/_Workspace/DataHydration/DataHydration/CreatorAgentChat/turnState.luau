local _ = require(script.Parent.types)

local function _(p0) --[[ line: 15 | named "getSequenceIndex" ]]
	local var12 = if p0 ~= nil then nil else p0.sequenceNumber
	
	return if typeof(var12) == "number" and var12 >= 0 then var12 + 1 else nil
end

local _ = function(p1) --[[ line: 23 | named "getMessageId" ]]
	local messageId = p1.messageId
	
	return if typeof(messageId) == "string" and messageId ~= "" then messageId else nil
end

local _ = function(p2) --[[ line: 28 | named "cloneArray" ]]
	local t = {}
	
	for i, v in p2 do
		table.insert(t, v)
	end
	return t
end

local function contentBlocksToText(p3) --[[ line: 36 ]]
	local t = {}
	
	for i, v in p3 do
		if v.type == "text" and typeof(v.text) == "string" then
			table.insert(t, v.text)
		end
	end
	return table.concat(t)
end

local function messageMapToText(p4, p5) --[[ line: 46 ]]
	-- upvalues: contentBlocksToText (ref)
	local t = {}
	
	for i, v in p5 do
		local var16 = p4[v]
		
		if var16 ~= nil then
			table.insert(t, contentBlocksToText(var16))
		end
	end
	return table.concat(t)
end

local _ = function(p6, p7) --[[ line: 57 | named "ensureMessageOrder" ]]
	for i, v in p6 do
		if v == p7 then
			return p6
		end
	end
	local t = {}
	
	for i_1, v_1 in p6 do
		table.insert(t, v_1)
	end
	table.insert(t, p7)
	
	return t
end

local _ = function(p8, p9, p10, p11) --[[ line: 68 | named "replaceMessageContent" ]]
	local cloned = table.clone(p8)
	local t = {}
	
	for i, v in p11 do
		table.insert(t, v)
	end
	cloned[p10] = t
	
	for i, v_1 in p9 do
		if v_1 == p10 then
			return cloned, p9
		end
	end
	local t_1 = {}
	
	for i_2, v_2 in p9 do
		table.insert(t_1, v_2)
	end
	table.insert(t_1, p10)
	
	return cloned, t_1
end

local function appendMessageContent(p12, p13, p14, p15) --[[ line: 79 ]]
	local var24
	local cloned = table.clone(p12)
	local var22 = cloned[p14]
	
	if var22 == nil then
		var24 = {}
	else
		local t = {}
		
		for i, v in var22 do
			table.insert(t, v)
		end
		var24 = t
	end
	table.insert(var24, p15)
	cloned[p14] = var24
	
	for i, v in p13 do
		if v == p14 then
			return cloned, p13
		end
	end
	local t = {}
	
	for i_1, v_1 in p13 do
		table.insert(t, v_1)
	end
	table.insert(t, p14)
	
	return cloned, t
end

local function buildContiguousThoughtText(p16) --[[ line: 93 ]]
	local t = {}
	
	for i = 1, #p16 do
		local var27 = p16[i]
		
		if var27 ~= "" then
			table.insert(t, var27)
		end
	end
	return table.concat(t)
end

local function buildActivityItems(p17, p18) --[[ line: 104 ]]
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	local function flushThought() --[[ line: 112 ]]
		-- upvalues: t_1 (write), t (ref)
		if #t_1 == 0 then
			return
		end
		table.insert(t, { kind = "thought", text = table.concat(t_1) })
		t_1 = {}
	end
	
	for i in p17 do
		table.insert(t_2, i)
	end
	table.sort(t_2)
	
	for i_1, v in t_2 do
		local var32 = p17[v]
		
		if var32.kind == "thought" then
			table.insert(t_1, var32.text)
		elseif var32.kind == "tool_call" then
			flushThought()
			local toolCallId = p18[var32.toolCallId]
			table.insert(t, {
				kind = "tool_call",
				toolCallId = var32.toolCallId,
				title = if toolCallId then toolCallId.title else nil,
				status = if toolCallId then toolCallId.status else nil
			})
		end
	end
	flushThought()
	
	return t
end

local _ = function(p19) --[[ line: 148 | named "refreshActivityItems" ]]
	-- upvalues: buildActivityItems (ref)
	p19.activityItems = buildActivityItems(p19.activitySlots, p19.toolCalls)
end

local _ = function(p20, p21) --[[ line: 152 | named "shiftNumberKeyedTable" ]]
	local t = {}
	
	for i, v in p20 do
		t[i + p21] = v
	end
	return t
end

local function rebaseSequencedState(p22, p23) --[[ line: 160 ]]
	-- upvalues: buildContiguousThoughtText (ref), buildActivityItems (ref)
	if p23 <= 0 then return end
	local t = {}
	
	for i, v in p22.thoughtChunks do
		t[i + p23] = v
	end
	p22.thoughtChunks = t
	p22.thoughtText = buildContiguousThoughtText(p22.thoughtChunks)
	local t_1 = {}
	
	for i_1, v_1 in p22.activitySlots do
		t_1[i_1 + p23] = v_1
	end
	p22.activitySlots = t_1
	
	if p22.pendingAgentMessageSequenceIndex ~= nil then
		p22.pendingAgentMessageSequenceIndex += p23
	end
	p22.activityItems = buildActivityItems(p22.activitySlots, p22.toolCalls)
end

local _ = function(p24, p25, p26) --[[ line: 173 | named "recordActivitySlotAtIndex" ]]
	-- upvalues: buildActivityItems (ref)
	if p25 <= 0 then
		return
	end
	local cloned = table.clone(p24.activitySlots)
	cloned[p25] = p26
	p24.activitySlots = cloned
	p24.activityItems = buildActivityItems(p24.activitySlots, p24.toolCalls)
end

local _ = function(p27, p28, p29) --[[ line: 184 | named "recordActivitySlot" ]]
	-- upvalues: buildActivityItems (ref)
	local var37 = if p28 ~= nil then nil else p28.sequenceNumber
	local var38 = if typeof(var37) == "number" and var37 >= 0 then var37 + 1 else nil
	
	if var38 == nil then return end
	if var38 <= 0 then
		return
	end
	var37 = table.clone(p27.activitySlots)
	var37[var38] = p29
	p27.activitySlots = var37
	p27.activityItems = buildActivityItems(p27.activitySlots, p27.toolCalls)
end

local function recordThoughtSequenceSlot(p30, p31, p32) --[[ line: 193 ]]
	-- upvalues: buildContiguousThoughtText (ref), buildActivityItems (ref)
	local var42
	local var39 = if p31 ~= nil then nil else p31.sequenceNumber
	local var40 = if typeof(var39) == "number" and var39 >= 0 then var39 + 1 else nil
	
	if var40 == nil then return end
	if p32 == nil then
		var39 = table.clone(p30.thoughtChunks)
		var39[var40] = var39[var40] or ""
		p30.thoughtChunks = var39
		p30.thoughtText = buildContiguousThoughtText(var39)
		local t = { kind = "empty" }
		var42 = if p31 ~= nil then nil else p31.sequenceNumber
		local var43 = if typeof(var42) == "number" and var42 >= 0 then var42 + 1 else nil
		
		if var43 == nil then return end
		if var43 <= 0 then
			return
		end
		var42 = table.clone(p30.activitySlots)
		var42[var43] = t
		p30.activitySlots = var42
		p30.activityItems = buildActivityItems(p30.activitySlots, p30.toolCalls)
		
		return
	else
		var39 = table.clone(p30.thoughtChunks)
		var39[var40] = p32
		p30.thoughtChunks = var39
		p30.thoughtText = buildContiguousThoughtText(var39)
		local t = { kind = "thought", text = p32 }
		var42 = if p31 ~= nil then nil else p31.sequenceNumber
		local var45 = if typeof(var42) == "number" and var42 >= 0 then var42 + 1 else nil
		
		if var45 == nil then return end
		if var45 <= 0 then
			return
		end
		var42 = table.clone(p30.activitySlots)
		var42[var45] = t
		p30.activitySlots = var42
		p30.activityItems = buildActivityItems(p30.activitySlots, p30.toolCalls)
	end
end

local _ = function(p33, p34, p35) --[[ line: 215 | named "recordToolCallSequenceSlot" ]]
	-- upvalues: buildActivityItems (ref)
	local t = { kind = "tool_call", toolCallId = p35 }
	local var47 = if p34 ~= nil then nil else p34.sequenceNumber
	local var48 = if typeof(var47) == "number" and var47 >= 0 then var47 + 1 else nil
	
	if var48 == nil then return end
	if var48 <= 0 then
		return
	end
	var47 = table.clone(p33.activitySlots)
	var47[var48] = t
	p33.activitySlots = var47
	p33.activityItems = buildActivityItems(p33.activitySlots, p33.toolCalls)
end

local _ = function(p36, p37) --[[ line: 219 | named "hasToolCallActivitySlot" ]]
	for i, v in p36.activitySlots do
		if v.kind == "tool_call" and v.toolCallId == p37 then
			return true
		end
	end
	return false
end

local _ = function(p38) --[[ line: 228 | named "clearPendingAgentMessage" ]]
	p38.pendingAgentMessageId = nil
	p38.pendingAgentMessageContent = {}
	p38.pendingAgentMessageSequenceIndex = nil
end

local function appendPendingAgentMessage(p39, p40, p41, p42) --[[ line: 234 ]]
	-- upvalues: contentBlocksToText (ref), buildActivityItems (ref)
	if p39.pendingAgentMessageId ~= nil and p39.pendingAgentMessageId ~= p40 then
		local var49 = contentBlocksToText(p39.pendingAgentMessageContent)
		
		if var49 ~= "" then
			local pendingAgentMessageSequenceIndex = p39.pendingAgentMessageSequenceIndex
			
			if pendingAgentMessageSequenceIndex ~= nil then
				local t = { kind = "thought", text = var49 }
				
				if pendingAgentMessageSequenceIndex > 0 then
					local cloned = table.clone(p39.activitySlots)
					cloned[pendingAgentMessageSequenceIndex] = t
					p39.activitySlots = cloned
					p39.activityItems = buildActivityItems(p39.activitySlots, p39.toolCalls)
				end
			end
		end
		p39.pendingAgentMessageId = nil
		p39.pendingAgentMessageContent = {}
		p39.pendingAgentMessageSequenceIndex = nil
	end
	local t = {}
	
	for i, v in p39.pendingAgentMessageContent do
		table.insert(t, v)
	end
	table.insert(t, p41)
	p39.pendingAgentMessageId = p40
	p39.pendingAgentMessageContent = t
	
	if p39.pendingAgentMessageSequenceIndex == nil then
		local var53 = if p42 ~= nil then nil else p42.sequenceNumber
		p39.pendingAgentMessageSequenceIndex = if typeof(var53) == "number" and var53 >= 0 then var53 + 1 else nil
	end
end

local function flushPendingAgentMessageToActivity(p43) --[[ line: 260 ]]
	-- upvalues: contentBlocksToText (ref), buildActivityItems (ref)
	local var54 = contentBlocksToText(p43.pendingAgentMessageContent)
	
	if var54 ~= "" then
		local pendingAgentMessageSequenceIndex = p43.pendingAgentMessageSequenceIndex
		
		if pendingAgentMessageSequenceIndex ~= nil then
			local t = { kind = "thought", text = var54 }
			
			if pendingAgentMessageSequenceIndex > 0 then
				local cloned = table.clone(p43.activitySlots)
				cloned[pendingAgentMessageSequenceIndex] = t
				p43.activitySlots = cloned
				p43.activityItems = buildActivityItems(p43.activitySlots, p43.toolCalls)
			end
		end
	end
	p43.pendingAgentMessageId = nil
	p43.pendingAgentMessageContent = {}
	p43.pendingAgentMessageSequenceIndex = nil
end

local function flushPendingAgentMessageToAssistant(p44) --[[ line: 271 ]]
	-- upvalues: appendMessageContent (ref), messageMapToText (ref)
	local pendingAgentMessageId = p44.pendingAgentMessageId
	
	if pendingAgentMessageId == nil then
		p44.pendingAgentMessageId = nil
		p44.pendingAgentMessageContent = {}
		p44.pendingAgentMessageSequenceIndex = nil
		
		return
	end
	local assistantMessages = p44.assistantMessages
	local assistantMessageOrder = p44.assistantMessageOrder
	
	for i, v in p44.pendingAgentMessageContent do
		local var57, var58 = appendMessageContent(assistantMessages, assistantMessageOrder, pendingAgentMessageId, v)
		assistantMessages = var57
		assistantMessageOrder = var58
	end
	p44.assistantMessages = assistantMessages
	p44.assistantMessageOrder = assistantMessageOrder
	p44.assistantText = messageMapToText(assistantMessages, assistantMessageOrder)
	p44.pendingAgentMessageId = nil
	p44.pendingAgentMessageContent = {}
	p44.pendingAgentMessageSequenceIndex = nil
end

local _ = function(p45) --[[ line: 289 | named "extractRobloxMeta" ]]
	local roblox = p45._meta and p45._meta._roblox
	
	return if typeof(roblox) == "table" then roblox else nil
end

local _ = function(p46) --[[ line: 294 | named "extractTurnId" ]]
	local roblox = p46._meta and p46._meta._roblox
	local var61 = if typeof(roblox) == "table" then roblox else nil
	local var62 = if typeof(var61) == "table" then var61.turnId else nil
	
	return if typeof(var62) == "number" and var62 > 0 then var62 else nil
end

local _ = function(p47) --[[ line: 300 | named "extractReferenceId" ]]
	local roblox = p47._meta and p47._meta._roblox
	local var64 = if typeof(roblox) == "table" then roblox else nil
	local var65 = if typeof(var64) == "table" then var64.referenceId else nil
	
	return if typeof(var65) == "string" and var65 ~= "" then var65 else nil
end

local function applyToolCallUpdate(p48, p49, p50) --[[ line: 306 ]]
	-- upvalues: buildActivityItems (ref)
	local toolCallId = p49.toolCallId
	
	if typeof(toolCallId) ~= "string" or toolCallId == "" then return end
	local var66 = p48.toolCalls[toolCallId]
	local var67 = var66 == nil
	local var68 = if var66 ~= nil then { toolCallId = toolCallId } else table.clone(var66)
	
	if p49.title ~= nil then
		var68.title = p49.title
	end
	if p49.kind ~= nil then
		var68.kind = p49.kind
	end
	if p49.status ~= nil then
		var68.status = p49.status
	end
	if p49.rawInput ~= nil then
		var68.rawInput = p49.rawInput
	end
	if p49.rawOutput ~= nil then
		var68.rawOutput = p49.rawOutput
	end
	if p49.content ~= nil then
		var68.content = p49.content
	end
	local roblox = p49._meta and p49._meta._roblox
	local var70 = if typeof(roblox) == "table" then roblox else nil
	local var71 = if typeof(var70) == "table" then var70.turnId else nil
	local var72 = if typeof(var71) == "number" and var71 > 0 then var71 else nil
	
	if var72 ~= nil then
		var68.turnId = var72
	end
	local roblox_1 = p49._meta and p49._meta._roblox
	var71 = if typeof(roblox_1) == "table" then roblox_1 else nil
	local var74 = if typeof(var71) == "table" then var71.referenceId else nil
	local var75 = if typeof(var74) == "string" and var74 ~= "" then var74 else nil
	
	if var75 ~= nil then
		var68.referenceId = var75
	end
	var71 = table.clone(p48.toolCalls)
	var71[toolCallId] = var68
	p48.toolCalls = var71
	
	if var67 then
		p48.toolCallCount += 1
	end
	if not var67 then
		for i, v in p48.activitySlots do
			if v.kind == "tool_call" and v.toolCallId == toolCallId then
				var74 = true
				if var74 then
					p48.activityItems = buildActivityItems(p48.activitySlots, p48.toolCalls)
					
					return
				end
			end
		end
		var74 = false
	end
	var74 = { kind = "tool_call", toolCallId = toolCallId }
	local var76 = if p50 ~= nil then nil else p50.sequenceNumber
	local var77 = if typeof(var76) == "number" and var76 >= 0 then var76 + 1 else nil
	
	if var77 == nil then return end
	if var77 <= 0 then
		return
	end
	var76 = table.clone(p48.activitySlots)
	var76[var77] = var74
	p48.activitySlots = var76
	p48.activityItems = buildActivityItems(p48.activitySlots, p48.toolCalls)
end

local function applyToolCallContentChunk(p51, p52, p53) --[[ line: 355 ]]
	-- upvalues: buildActivityItems (ref)
	local toolCallId = p52.toolCallId
	local content = p52.content
	
	if typeof(toolCallId) ~= "string" or toolCallId == "" or typeof(content) ~= "table" then return end
	local var82
	local var78 = p51.toolCalls[toolCallId]
	local var79 = var78 == nil
	local var80 = if var78 ~= nil then { toolCallId = toolCallId } else table.clone(var78)
	local content_1 = var80.content
	
	if content_1 == nil then
		var82 = {}
	else
		local t = {}
		
		for i, v in content_1 do
			table.insert(t, v)
		end
		var82 = t
	end
	table.insert(var82, content)
	var80.content = var82
	local cloned = table.clone(p51.toolCalls)
	cloned[toolCallId] = var80
	p51.toolCalls = cloned
	
	if var79 then
		p51.toolCallCount += 1
	end
	if not var79 then
		local var84
		for i, v in p51.activitySlots do
			if v.kind == "tool_call" and v.toolCallId == toolCallId then
				var84 = true
				if var84 then
					p51.activityItems = buildActivityItems(p51.activitySlots, p51.toolCalls)
					
					return
				end
			end
		end
		var84 = false
	end
	local t = { kind = "tool_call", toolCallId = toolCallId }
	local var86 = if p53 ~= nil then nil else p53.sequenceNumber
	local var87 = if typeof(var86) == "number" and var86 >= 0 then var86 + 1 else nil
	
	if var87 == nil then return end
	if var87 <= 0 then
		return
	end
	var86 = table.clone(p51.activitySlots)
	var86[var87] = t
	p51.activitySlots = var86
	p51.activityItems = buildActivityItems(p51.activitySlots, p51.toolCalls)
end

return {
	applySessionUpdate = function(p54, p55, p56) --[[ line: 384 ]]
		-- upvalues: flushPendingAgentMessageToAssistant (ref), flushPendingAgentMessageToActivity (ref), buildContiguousThoughtText (ref), buildActivityItems (ref), messageMapToText (ref), appendPendingAgentMessage (ref), recordThoughtSequenceSlot (ref), applyToolCallUpdate (ref), applyToolCallContentChunk (ref)
		local var89, var92
		local sessionUpdate = p55.sessionUpdate
		local cloned = table.clone(p54)
		
		if cloned.status == "queued" then
			cloned.status = "streaming"
		end
		if sessionUpdate ~= "agent_message_chunk" then
			if sessionUpdate == "state_change" and p55.state == "idle" then
				flushPendingAgentMessageToAssistant(cloned)
			else
				flushPendingAgentMessageToActivity(cloned)
			end
		end
		if sessionUpdate ~= "agent_thought" and sessionUpdate ~= "agent_thought_chunk" then
			var89 = if p56 ~= nil then nil else p56.sequenceNumber
			local var90 = if typeof(var89) == "number" and var89 >= 0 then var89 + 1 else nil
			
			if var90 ~= nil then
				local var94
				var89 = table.clone(cloned.thoughtChunks)
				var89[var90] = var89[var90] or ""
				cloned.thoughtChunks = var89
				cloned.thoughtText = buildContiguousThoughtText(var89)
				local t = { kind = "empty" }
				var92 = if p56 ~= nil then nil else p56.sequenceNumber
				local var93 = if typeof(var92) == "number" and var92 >= 0 then var92 + 1 else nil
				
				if var93 ~= nil and var93 > 0 then
					var92 = table.clone(cloned.activitySlots)
					var92[var93] = t
					cloned.activitySlots = var92
					cloned.activityItems = buildActivityItems(cloned.activitySlots, cloned.toolCalls)
				end
			end
		end
		if sessionUpdate == "agent_message" then
			var89 = p55.messageId
			var94 = if typeof(var89) == "string" and var89 ~= "" then var89 else nil
			var89 = p55.content
			
			if var94 == nil or typeof(var89) ~= "table" then
				return cloned
			end
			local assistantMessageOrder = cloned.assistantMessageOrder
			local cloned_1 = table.clone(cloned.assistantMessages)
			local t = {}
			
			for i, v in var89 do
				table.insert(t, v)
			end
			local var99
			cloned_1[var94] = t
			
			for i_1, v_1 in assistantMessageOrder do
				if v_1 == var94 then
					var99 = assistantMessageOrder
					cloned.assistantMessages = cloned_1
					cloned.assistantMessageOrder = var99
					cloned.assistantText = messageMapToText(cloned.assistantMessages, cloned.assistantMessageOrder)
					
					return cloned
				end
			end
			local t_1 = {}
			
			for i, v_2 in assistantMessageOrder do
				table.insert(t_1, v_2)
			end
			local var98 = t_1
			table.insert(var98, var94)
			var99 = var98
		elseif sessionUpdate == "agent_message_chunk" then
			var89 = p55.messageId
			var94 = if typeof(var89) == "string" and var89 ~= "" then var89 else nil
			var89 = p55.content
			
			if var94 == nil or typeof(var89) ~= "table" then
			else
				appendPendingAgentMessage(cloned, var94, var89, p56)
				
				return cloned
			end
		elseif sessionUpdate == "agent_thought" then
			var89 = p55.messageId
			var94 = if typeof(var89) == "string" and var89 ~= "" then var89 else nil
			var89 = p55.content
			
			if var94 == nil or typeof(var89) ~= "table" then
			end
			local thoughtMessageOrder = cloned.thoughtMessageOrder
			local cloned_1 = table.clone(cloned.thoughtMessages)
			local t = {}
			
			for i, v in var89 do
				table.insert(t, v)
			end
			local var104
			cloned_1[var94] = t
			
			for i_1, v_1 in thoughtMessageOrder do
				if v_1 == var94 then
					var104 = thoughtMessageOrder
					cloned.thoughtMessages = cloned_1
					cloned.thoughtMessageOrder = var104
					local var105 = messageMapToText(cloned.thoughtMessages, cloned.thoughtMessageOrder)
					cloned.thoughtText = var105
					local t_1 = { kind = "thought", text = var105 }
					local var107 = if p56 ~= nil then nil else p56.sequenceNumber
					var92 = if typeof(var107) == "number" and var107 >= 0 then var107 + 1 else nil
					
					if var92 == nil then
						return cloned
					elseif var92 <= 0 then
						return cloned
					end
					var107 = table.clone(cloned.activitySlots)
					var107[var92] = t_1
					cloned.activitySlots = var107
					cloned.activityItems = buildActivityItems(cloned.activitySlots, cloned.toolCalls)
					
					return cloned
				end
			end
			local t_1 = {}
			
			for i, v_3 in thoughtMessageOrder do
				table.insert(t_1, v_3)
			end
			local var103 = t_1
			table.insert(var103, var94)
			var104 = var103
		elseif sessionUpdate == "agent_thought_chunk" then
			var89 = p55.messageId
			var94 = if typeof(var89) == "string" and var89 ~= "" then var89 else nil
			var89 = p55.content
			
			if var94 == nil or not var89 or (var89.type ~= "text" or typeof(var89.text) ~= "string") then
			else
				recordThoughtSequenceSlot(cloned, p56, var89.text)
				
				return cloned
			end
		elseif sessionUpdate == "tool_call_update" then
			applyToolCallUpdate(cloned, p55, p56)
			
			return cloned
		elseif sessionUpdate == "tool_call_content_chunk" then
			applyToolCallContentChunk(cloned, p55, p56)
			
			return cloned
		elseif sessionUpdate == "state_change" then
			if p55.state == "running" or p55.state == "requires_action" then
				cloned.status = "streaming"
				
				return cloned
			elseif p55.state ~= "idle" then
			end
			var94 = p55.stop_reason
			
			if typeof(var94) == "string" then
				cloned.stopReason = var94
			else
				cloned.stopReason = "end_turn"
			end
			cloned.status = if cloned.stopReason == "cancelled" then "cancelled" else "succeeded"
			cloned.isDone = true
			
			return cloned
		elseif sessionUpdate == "session_info_update" then
			cloned.infoUpdate = { title = p55.title }
		end
	end,
	rebaseSequencedState = rebaseSequencedState
}