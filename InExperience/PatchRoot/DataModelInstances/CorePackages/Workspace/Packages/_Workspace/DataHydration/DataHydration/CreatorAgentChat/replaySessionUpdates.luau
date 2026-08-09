local turnStateModule = require(script.Parent.turnState)
local _ = require(script.Parent.types)

local function emptyTurnState(p0) --[[ line: 11 ]]
	return {
		requestId = nil,
		status = "queued",
		assistantText = "",
		pendingAgentMessageId = nil,
		pendingAgentMessageSequenceIndex = nil,
		thoughtText = "",
		toolCallCount = 0,
		infoUpdate = nil,
		stopReason = nil,
		error = nil,
		errorCode = nil,
		isDone = false,
		sessionId = p0,
		assistantMessages = {},
		assistantMessageOrder = {},
		pendingAgentMessageContent = {},
		thoughtMessages = {},
		thoughtMessageOrder = {},
		thoughtChunks = {},
		activitySlots = {},
		activityItems = {},
		toolCalls = {}
	}
end

local function _(p1) --[[ line: 38 | named "contentBlockToText" ]]
	return if p1.type == "text" and typeof(p1.text) == "string" then p1.text else ""
end

local function contentBlocksToText(p2) --[[ line: 45 ]]
	local t = {}
	
	for i, v in p2 do
		local var6 = if v.type == "text" and typeof(v.text) == "string" then v.text else ""
		
		if var6 ~= "" then
			table.insert(t, var6)
		end
	end
	return table.concat(t)
end

local _ = function(p3) --[[ line: 56 | named "getMessageId" ]]
	local messageId = p3.messageId
	
	return if typeof(messageId) == "string" and messageId ~= "" then messageId else nil
end

local _ = function(p4) --[[ line: 61 | named "getSequenceId" ]]
	local sequenceId = p4.sequenceId
	
	return if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil
end

local function orderSessionUpdates(p5) --[[ line: 72 ]]
	local t = {}
	
	for i, v in p5 do
		local t_1 = { update = v, originalIndex = i }
		local sequenceId = v.sequenceId
		t_1.sequenceId = if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil
		table.insert(t, t_1)
	end
	table.sort(t, function(p6, p7) --[[ line: 82 ]]
		return if p6.sequenceId == nil or p7.sequenceId == nil then p6.originalIndex < p7.originalIndex else p6.sequenceId < p7.sequenceId
	end)
	
	return t
end

local function appendUserMessage(p8, p9, p10, p11) --[[ line: 92 ]]
	if p11 == "" then return end
	local var9 = p8[#p8]
	
	if var9 == nil or var9.kind ~= "user_message" or var9.messageId ~= p9 then
		table.insert(p8, {
			kind = "user_message",
			messageId = p9,
			sequenceId = p10,
			text = p11
		})
		
		return
	end
	var9.text ..= p11
end

local _ = function(p12) --[[ line: 116 | named "isAssistantTurnUpdate" ]]
	local sessionUpdate = p12.sessionUpdate
	
	return if sessionUpdate ~= "agent_message" then if sessionUpdate ~= "agent_message_chunk" then if sessionUpdate ~= "agent_thought" then if sessionUpdate ~= "agent_thought_chunk" then if sessionUpdate ~= "tool_call_update" then if sessionUpdate ~= "tool_call_content_chunk" then sessionUpdate == "state_change" else true else true else true else true else true else true
end

local _ = function(p13) --[[ line: 127 | named "isTurnStartUpdate" ]]
	return p13.sessionUpdate == "state_change" and p13.state == "running"
end

local _ = function(p14) --[[ line: 131 | named "hasAssistantTurnContent" ]]
	return if p14.assistantText == "" then if p14.thoughtText == "" then if #p14.activityItems <= 0 then p14.toolCallCount > 0 else true else true else true
end

local _ = function(p15) --[[ line: 135 | named "shouldEmitAssistantTurn" ]]
	local var10 = if p15.assistantText == "" then if p15.thoughtText == "" then if #p15.activityItems <= 0 then p15.toolCallCount > 0 else true else true else true
	
	if not var10 then
		var10 = if p15.status ~= "cancelled" then p15.stopReason == "cancelled" else true
	end
	return var10
end

return function(p16, p17) --[[ line: 139 | named "replaySessionUpdates" ]]
	-- upvalues: orderSessionUpdates (ref), appendUserMessage (ref), contentBlocksToText (ref), emptyTurnState (ref), turnStateModule (ref)
	local t = {}
	local var12 = nil
	local var13 = orderSessionUpdates(p17)
	local var14 = 0
	local var15 = nil
	local var16 = nil
	local t_1 = {}
	local var18 = false
	
	local function _(p18) --[[ line: 149 | named "noteActiveTurnSequence" ]]
		-- upvalues: t_1 (write), var15 (write), var16 (write)
		if p18 == nil then return end
		table.insert(t_1, p18)
		
		if var15 == nil or p18 < var15 then
			var15 = p18
		end
		if var16 == nil or var16 < p18 then
			var16 = p18
		end
	end
	
	local function flushActiveTurn() --[[ line: 162 ]]
		-- upvalues: var12 (write), var18 (write), t (ref), var15 (write), var16 (write), t_1 (write), var14 (write)
		if var12 ~= nil and var18 then
			local var26 = var12
			local var27 = if var26.assistantText == "" then if var26.thoughtText == "" then if #var26.activityItems <= 0 then var26.toolCallCount > 0 else true else true else true
			
			if not var27 then
				var27 = if var26.status ~= "cancelled" then var26.stopReason == "cancelled" else true
			end
			if var27 then
				table.insert(t, {
					kind = "assistant_turn",
					startSequenceId = var15,
					endSequenceId = var16,
					sequenceIds = table.clone(t_1),
					turnState = var12
				})
			end
		end
		var12 = nil
		var14 = 0
		var15 = nil
		var16 = nil
		t_1 = {}
		var18 = false
	end
	
	for i, v in var13 do
		local messageId
		local update = v.update
		local sessionUpdate = update.sessionUpdate
		
		if sessionUpdate ~= "user_message" then
			if sessionUpdate ~= "user_message_chunk" then
				local sessionUpdate_1 = update.sessionUpdate
				local var25 = if sessionUpdate_1 ~= "agent_message" then if sessionUpdate_1 ~= "agent_message_chunk" then if sessionUpdate_1 ~= "agent_thought" then if sessionUpdate_1 ~= "agent_thought_chunk" then if sessionUpdate_1 ~= "tool_call_update" then if sessionUpdate_1 ~= "tool_call_content_chunk" then sessionUpdate_1 == "state_change" else true else true else true else true else true else true
				
				if var25 then
					if var12 == nil then
						var12 = emptyTurnState(p16)
					end
					if update.sessionUpdate == "state_change" and update.state == "running" then
						var18 = true
					end
					var25 = v.sequenceId
					
					if var25 ~= nil then
						table.insert(t_1, var25)
						
						if var15 == nil or var25 < var15 then
							var15 = var25
						end
						if var16 == nil or var16 < var25 then
							var16 = var25
						end
					end
					var12 = turnStateModule.applySessionUpdate(var12, update, { sequenceNumber = var14 })
					var14 += 1
					
					if var12.isDone then
						flushActiveTurn()
					end
				end
			end
			if var12 ~= nil then
				local var21 = var12
				
				if if var21.assistantText == "" then if var21.thoughtText == "" then if #var21.activityItems <= 0 then var21.toolCallCount > 0 else true else true else true then
					flushActiveTurn()
				end
			end
			local var22 = appendUserMessage
			local var23 = t
			messageId = update.messageId
			local var24 = if typeof(messageId) == "string" and messageId ~= "" then messageId else nil
			messageId = v.sequenceId
			local content = update.content
			var22(var23, var24, messageId, if content.type == "text" and typeof(content.text) == "string" then content.text else "")
		end
		if var12 ~= nil then
			local var20 = var12
			
			if if var20.assistantText == "" then if var20.thoughtText == "" then if #var20.activityItems <= 0 then var20.toolCallCount > 0 else true else true else true then
				flushActiveTurn()
			end
		end
		messageId = update.messageId
		appendUserMessage(t, if typeof(messageId) == "string" and messageId ~= "" then messageId else nil, v.sequenceId, contentBlocksToText(update.content))
	end
	flushActiveTurn()
	
	return t
end