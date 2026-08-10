local creatorAgentChatModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)
local _ = require(script.Parent.chatTypes)
local publishToolUtils = creatorAgentChatModule.PublishToolUtils
local turnStateReducer = creatorAgentChatModule.TurnStateReducer
local subagentTasks = creatorAgentChatModule.SubagentTasks

local function _(p0) --[[ line: 76 | named "contentBlockToText" ]]
	return if p0 == nil or p0.type ~= "text" or typeof(p0.text) ~= "string" then "" else p0.text
end

local function contentBlocksToText(p1) --[[ line: 83 ]]
	if typeof(p1) ~= "table" then
		return ""
	end
	local t = {}
	
	for i, v in p1 do
		local var6 = if v == nil or v.type ~= "text" or typeof(v.text) ~= "string" then "" else v.text
		
		if var6 ~= "" then
			table.insert(t, var6)
		end
	end
	return table.concat(t)
end

local _ = function(p2) --[[ line: 97 | named "getSequenceId" ]]
	local sequenceId = p2.sequenceId
	
	return if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil
end

local _ = function(p3) --[[ line: 105 | named "asOptimisticallyCancelled" ]]
	-- upvalues: turnStateReducer (ref)
	return turnStateReducer.applySessionUpdate(p3, {
		sessionUpdate = "state_change",
		state = "idle",
		stop_reason = "cancelled"
	}, nil)
end

local _ = function(p4) --[[ line: 113 | named "getMessageId" ]]
	local messageId = p4.messageId
	
	return if typeof(messageId) == "string" and messageId ~= "" then messageId else nil
end

local _ = function(p5) --[[ line: 118 | named "isAssistantTurnUpdate" ]]
	return if p5 ~= "agent_message" then if p5 ~= "agent_message_chunk" then if p5 ~= "tool_call_update" then if p5 ~= "tool_call_content_chunk" then p5 == "state_change" else true else true else true else true
end

local _ = function(p6) --[[ line: 126 | named "hasAssistantTurnContent" ]]
	return if p6.assistantText == "" then if #p6.activityItems <= 0 then p6.toolCallCount > 0 else true else true
end

local _ = function(p7) --[[ line: 134 | named "shouldEmitAssistantTurn" ]]
	local var7 = if p7.assistantText == "" then if #p7.activityItems <= 0 then p7.toolCallCount > 0 else true else true
	
	if not var7 then
		var7 = if #p7.pendingAgentMessageContent <= 0 then if p7.status ~= "cancelled" then if p7.stopReason ~= "cancelled" then p7.stopReason == "error" else true else true else true
	end
	return var7
end

local _ = function(p8) --[[ line: 142 | named "orderedBySequenceId" ]]
	local cloned = table.clone(p8)
	table.sort(cloned, function(p9, p10) --[[ line: 144 ]]
		local sequenceId = p9.sequenceId
		local var9 = (if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil) or -1
		local sequenceId_1 = p10.sequenceId
		sequenceId = if typeof(sequenceId_1) == "number" and sequenceId_1 >= 0 then sequenceId_1 else nil
		
		return var9 < (sequenceId or -1)
	end)
	
	return cloned
end

local function parseChatItems(p11, p12) --[[ line: 154 ]]
	-- upvalues: contentBlocksToText (ref), turnStateReducer (ref)
	local t = {}
	local var11 = nil
	local var12 = nil
	local var13 = nil
	local t_1 = {}
	local var15 = false
	
	local function flushActiveTurn() --[[ line: 162 ]]
		-- upvalues: var11 (write), var15 (write), t (ref), var12 (write), var13 (write), t_1 (write)
		if var11 ~= nil and var15 then
			local var20 = var11
			local var21 = if var20.assistantText == "" then if #var20.activityItems <= 0 then var20.toolCallCount > 0 else true else true
			
			if not var21 then
				var21 = if #var20.pendingAgentMessageContent <= 0 then if var20.status ~= "cancelled" then if var20.stopReason ~= "cancelled" then var20.stopReason == "error" else true else true else true
			end
			if var21 then
				table.insert(t, {
					kind = "assistant_turn",
					startSequenceId = var12,
					endSequenceId = var13,
					sequenceIds = t_1,
					turnState = var11
				})
			end
		end
		var11 = nil
		var12 = nil
		var13 = nil
		t_1 = {}
		var15 = false
	end
	
	local function appendUserMessage(p13, p14, p15) --[[ line: 179 ]]
		-- upvalues: t (ref)
		if p15 == "" then return end
		local var22 = t[#t]
		
		if var22 == nil or var22.kind ~= "user_message" or var22.messageId ~= p13 then
			table.insert(t, {
				kind = "user_message",
				messageId = p13,
				sequenceId = p14,
				text = p15
			})
			
			return
		end
		var22.text ..= p15
	end
	
	for i, v in p11 do
		local var19
		local sessionUpdate = v.sessionUpdate
		local sequenceId = v.sequenceId
		local var18 = if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil
		
		if sessionUpdate ~= "user_message" and sessionUpdate ~= "user_message_chunk" then
			sequenceId = if sessionUpdate ~= "agent_message" then if sessionUpdate ~= "agent_message_chunk" then if sessionUpdate ~= "tool_call_update" then if sessionUpdate ~= "tool_call_content_chunk" then sessionUpdate == "state_change" else true else true else true else true
			
			if sequenceId then
				if var11 == nil then
					var11 = turnStateReducer.createEmptyTurnState(p12)
				end
				if sessionUpdate == "state_change" and v.state == "running" then
					var15 = true
				end
				if var18 ~= nil then
					table.insert(t_1, var18)
					
					if var12 == nil or var18 < var12 then
						var12 = var18
					end
					if var13 == nil or var13 < var18 then
						var13 = var18
					end
				end
				var11 = turnStateReducer.applySessionUpdate(var11, v, { sequenceNumber = var18 })
				
				if var11.isDone then
					flushActiveTurn()
				end
			end
		end
		if var11 ~= nil then
			var19 = var11
			sequenceId = if var19.assistantText == "" then if #var19.activityItems <= 0 then var19.toolCallCount > 0 else true else true
			
			if sequenceId then
				flushActiveTurn()
			end
		end
		if sessionUpdate == "user_message" then
			sequenceId = contentBlocksToText(v.content)
		else
			var19 = v.content
			sequenceId = if var19 == nil or var19.type ~= "text" or typeof(var19.text) ~= "string" then "" else var19.text
		end
		var19 = appendUserMessage
		local messageId = v.messageId
		var19(if typeof(messageId) == "string" and messageId ~= "" then messageId else nil, var18, sequenceId)
	end
	flushActiveTurn()
	
	return t
end

local _ = function(p16, p17) --[[ line: 236 | named "buildUserMessageItem" ]]
	return {
		kind = "user_message",
		id = if p17 == nil or p16.sequenceId == nil then p16.messageId else `{p17}:{p16.sequenceId}:user`,
		text = p16.text
	}
end

local _ = function(p18, p19) --[[ line: 247 | named "getEventMeta" ]]
	return if p19 == nil or p18.eventMetaBySequenceId == nil then nil else p18.eventMetaBySequenceId[p19]
end

local function resolveTurnId(p20, p21) --[[ line: 254 ]]
	local endSequenceId = p21.endSequenceId
	local var23 = if endSequenceId == nil or p20.eventMetaBySequenceId == nil then nil else p20.eventMetaBySequenceId[endSequenceId]
	
	if var23 ~= nil and var23.turnId ~= nil then
		return var23.turnId
	end
	for i, v in p21.sequenceIds do
		local var24 = if v == nil or p20.eventMetaBySequenceId == nil then nil else p20.eventMetaBySequenceId[v]
		
		if var24 ~= nil and var24.turnId ~= nil then
			return var24.turnId
		end
	end
	return nil
end

local function buildTurnFeedbackIds(p22, p23) --[[ line: 268 ]]
	-- upvalues: publishToolUtils (ref), resolveTurnId (ref)
	local latestSuccessfulResult = publishToolUtils.getLatestSuccessfulResult(p22.turnState)
	
	return {
		universeId = p23.universeId,
		placeId = p23.placeId,
		sessionId = p23.sessionId,
		sequenceId = p22.endSequenceId,
		turnId = resolveTurnId(p22.turnState, p22),
		publishedVersionNumber = if latestSuccessfulResult ~= nil then nil else latestSuccessfulResult.publishedVersionNumber,
		rollbackTargetVersionNumber = if latestSuccessfulResult ~= nil then nil else latestSuccessfulResult.rollbackTargetVersionNumber
	}
end

return function(p24, p25) --[[ line: 281 | named "parseSessionStream" ]]
	-- upvalues: parseChatItems (ref), turnStateReducer (ref), publishToolUtils (ref), subagentTasks (ref), buildTurnFeedbackIds (ref)
	local sequenceIds
	local sessionId = p25.sessionId
	local cloned = table.clone(p24)
	table.sort(cloned, function(p26, p27) --[[ line: 144 ]]
		local sequenceId = p26.sequenceId
		local sequenceId_1 = p27.sequenceId
		
		return ((if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil) or -1) < ((if typeof(sequenceId_1) == "number" and sequenceId_1 >= 0 then sequenceId_1 else nil) or -1)
	end)
	local var27 = parseChatItems(cloned, sessionId or "")
	local var28 = nil
	
	for i, v in p24 do
		sequenceIds = v.sequenceId
		local var40 = if typeof(sequenceIds) == "number" and sequenceIds >= 0 then sequenceIds else nil
		
		if var40 ~= nil and (var28 == nil or var28 < var40) then
			var28 = var40
		end
	end
	local v_1
	local t = {}
	local var30 = false
	local var31 = nil
	local tCount = nil
	local var33 = nil
	local startSequenceId = nil
	sequenceIds = nil
	
	for i_1, v_1 in var27 do
		if v_1.kind == "user_message" then
			table.insert(t, {
				kind = "user_message",
				id = if sessionId == nil or v_1.sequenceId == nil then v_1.messageId else `{sessionId}:{v_1.sequenceId}:user`,
				text = v_1.text
			})
		end
		local turnState = v_1.turnState
		
		if p25.optimisticCancelledStartSequenceId ~= nil and v_1.startSequenceId == p25.optimisticCancelledStartSequenceId and not turnState.isDone then
			turnState = turnStateReducer.applySessionUpdate(turnState, {
				sessionUpdate = "state_change",
				state = "idle",
				stop_reason = "cancelled"
			}, nil)
		end
		if publishToolUtils.includesPublishPlaceTool(turnState) then
			var30 = true
		end
		local var37 = subagentTasks.fromTurnState(turnState)
		
		if var37 ~= nil then
			var31 = var37
		end
		local var38 = if sessionId == nil or v_1.startSequenceId == nil then nil else `{sessionId}:{v_1.startSequenceId}`
		local var39 = not turnState.isDone
		table.insert(t, {
			kind = "assistant_turn",
			id = var38,
			isDone = turnState.isDone,
			turnState = turnState,
			turnKey = var38,
			startSequenceId = v_1.startSequenceId,
			endSequenceId = v_1.endSequenceId,
			optimisticLocalTools = if var39 then p25.optimisticLocalTools else nil,
			universeId = p25.universeId,
			sessionId = sessionId,
			turnFeedbackIds = buildTurnFeedbackIds(v_1, p25)
		})
		
		if var39 then
			tCount = #t
			var33 = turnState
			startSequenceId = v_1.startSequenceId
			sequenceIds = v_1.sequenceIds
		end
	end
	local pendingUserMessage = p25.pendingUserMessage
	
	if pendingUserMessage ~= nil and pendingUserMessage ~= "" then
		local pendingUserMessageAfterSequenceId = p25.pendingUserMessageAfterSequenceId or -1
		local var35 = false
		
		for i_2, v_2 in var27 do
			if v_2.kind == "user_message" then
				local sequenceId = v_2.sequenceId
				
				if sequenceId ~= nil and pendingUserMessageAfterSequenceId < sequenceId then
					var35 = true
					break
				end
			end
		end
		if not var35 then
			table.insert(t, {
				kind = "user_message",
				id = if sessionId ~= nil then nil else `{sessionId}:pending`,
				text = pendingUserMessage
			})
		end
	end
	local liveAssistantMessage = p25.liveAssistantMessage
	local var36 = t[#t]
	
	if liveAssistantMessage ~= nil and not (var36 ~= nil and var36.kind == "assistant_turn") then
		v_1 = if sessionId ~= nil then nil else `{sessionId}:live`
		table.insert(t, {
			kind = "assistant_turn",
			isDone = false,
			id = v_1,
			turnKey = v_1,
			loading = liveAssistantMessage.setupErrorText == nil or nil,
			setupErrorText = liveAssistantMessage.setupErrorText,
			universeId = p25.universeId,
			turnFeedbackIds = {}
		})
	end
	return {
		messages = t,
		includesPublishTool = var30,
		activeTurnItemIndex = tCount,
		activeTurnState = var33,
		activeTurnStartSequenceId = startSequenceId,
		activeTurnSequenceIds = sequenceIds,
		subagentTaskState = var31,
		latestSequenceId = var28
	}
end