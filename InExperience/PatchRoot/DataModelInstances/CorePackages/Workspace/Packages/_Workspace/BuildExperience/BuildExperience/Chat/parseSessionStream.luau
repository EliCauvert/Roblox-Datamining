local buildExperience = script:FindFirstAncestor("BuildExperience")
local creatorAgentChatModule = require(buildExperience.Parent.DataHydration.CreatorAgentChat)
local _ = require(script.Parent.chatTypes)
local fFlagBuildAgentRollbackModule = require(buildExperience.Flags.FFlagBuildAgentRollback)
local fFlagBuildExperienceSinglePlaytestCardModule = require(buildExperience.Flags.FFlagBuildExperienceSinglePlaytestCard)
local publishToolUtils = creatorAgentChatModule.PublishToolUtils
local turnStateReducer = creatorAgentChatModule.TurnStateReducer
local subagentTasks = creatorAgentChatModule.SubagentTasks

local function _(p1)
	return if p1 == nil or p1.type ~= "text" or typeof(p1.text) ~= "string" then "" else p1.text
end

local function contentBlocksToText(p1)
	if typeof(p1) ~= "table" then
		return ""
	end
	local t = {}
	
	for i, v in p1 do
		local var1 = if v == nil or v.type ~= "text" or typeof(v.text) ~= "string" then "" else v.text
		
		if var1 ~= "" then
			table.insert(t, var1)
		end
	end
	return table.concat(t)
end

local _ = function(p2)
	local sequenceId = p2.sequenceId
	
	return if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil
end

local _ = function(p2)
	-- upvalues: turnStateReducer (ref)
	return turnStateReducer.applySessionUpdate(p2, {
		sessionUpdate = "state_change",
		state = "idle",
		stop_reason = "cancelled"
	}, nil)
end

local _ = function(p2)
	local messageId = p2.messageId
	
	return if typeof(messageId) == "string" and messageId ~= "" then messageId else nil
end

local _ = function(p2)
	return if p2 ~= "agent_message" then if p2 ~= "agent_message_chunk" then if p2 ~= "tool_call_update" then if p2 ~= "tool_call_content_chunk" then p2 == "state_change" else true else true else true else true
end

local _ = function(p2)
	return if p2.assistantText == "" then if #p2.activityItems <= 0 then p2.toolCallCount > 0 else true else true
end

local _ = function(p2)
	local var2 = if p2.assistantText == "" then if #p2.activityItems <= 0 then p2.toolCallCount > 0 else true else true
	
	if not var2 then
		var2 = if #p2.pendingAgentMessageContent <= 0 then if p2.status ~= "cancelled" then if p2.stopReason ~= "cancelled" then p2.stopReason == "error" else true else true else true
	end
	return var2
end

local _ = function(p2)
	local cloned = table.clone(p2)
	table.sort(cloned, function(p3, p4)
		local sequenceId = p3.sequenceId
		local var2 = (if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil) or -1
		local sequenceId_1 = p4.sequenceId
		sequenceId = if typeof(sequenceId_1) == "number" and sequenceId_1 >= 0 then sequenceId_1 else nil
		
		return var2 < (sequenceId or -1)
	end)
	
	return cloned
end

local function parseChatItems(p2, p3)
	-- upvalues: contentBlocksToText (ref), turnStateReducer (ref)
	local t = {}
	local var2 = nil
	local var3 = nil
	local var4 = nil
	local t_1 = {}
	local var5 = false
	
	local function flushActiveTurn()
		-- upvalues: var2 (write), var5 (write), t (ref), var3 (write), var4 (write), t_1 (write)
		if var2 ~= nil and var5 then
			local var6 = var6
			local var7 = if var6.assistantText == "" then if #var6.activityItems <= 0 then var6.toolCallCount > 0 else true else true
			
			if not var7 then
				var7 = if #var6.pendingAgentMessageContent <= 0 then if var6.status ~= "cancelled" then if var6.stopReason ~= "cancelled" then var6.stopReason == "error" else true else true else true
			end
			if var7 then
				table.insert(t, {
					kind = "assistant_turn",
					startSequenceId = var7,
					endSequenceId = var4,
					sequenceIds = t_1,
					turnState = var6
				})
			end
		end
		var6 = nil
		var7 = nil
		var4 = nil
		t_1 = {}
		var5 = false
	end
	
	local function appendUserMessage(p4, p5, p6)
		-- upvalues: t (ref)
		if p6 == "" then return end
		local var6 = t[#t]
		
		if var6 == nil or var6.kind ~= "user_message" or var6.messageId ~= p4 then
			table.insert(t, {
				kind = "user_message",
				messageId = p4,
				sequenceId = p5,
				text = p6
			})
			
			return
		end
		var6.text ..= p6
	end
	
	for i, v in p2 do
		local var4
		local sessionUpdate = v.sessionUpdate
		local sequenceId = v.sequenceId
		local var5 = if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil
		
		if sessionUpdate ~= "user_message" and sessionUpdate ~= "user_message_chunk" then
			sequenceId = if sessionUpdate ~= "agent_message" then if sessionUpdate ~= "agent_message_chunk" then if sessionUpdate ~= "tool_call_update" then if sessionUpdate ~= "tool_call_content_chunk" then sessionUpdate == "state_change" else true else true else true else true
			
			if sequenceId then
				if var2 == nil then
					var2 = turnStateReducer.createEmptyTurnState(p3)
				end
				if sessionUpdate == "state_change" and v.state == "running" then
					var5 = true
				end
				if var5 ~= nil then
					table.insert(t_1, var5)
					
					if var3 == nil or var5 < var3 then
						var3 = var5
					end
					if var4 == nil or var4 < var5 then
						var4 = var5
					end
				end
				var2 = turnStateReducer.applySessionUpdate(var2, v, { sequenceNumber = var5 })
				
				if var2.isDone then
					flushActiveTurn()
				end
			end
		end
		if var2 ~= nil then
			var4 = var2
			sequenceId = if var4.assistantText == "" then if #var4.activityItems <= 0 then var4.toolCallCount > 0 else true else true
			
			if sequenceId then
				flushActiveTurn()
			end
		end
		if sessionUpdate == "user_message" then
			sequenceId = contentBlocksToText(v.content)
		else
			var4 = v.content
			sequenceId = if var4 == nil or var4.type ~= "text" or typeof(var4.text) ~= "string" then "" else var4.text
		end
		var4 = appendUserMessage
		local messageId = v.messageId
		var4(if typeof(messageId) == "string" and messageId ~= "" then messageId else nil, var5, sequenceId)
	end
	flushActiveTurn()
	
	return t
end

local _ = function(p4, p5)
	return {
		kind = "user_message",
		id = if p5 == nil or p4.sequenceId == nil then p4.messageId else `{p5}:{p4.sequenceId}:user`,
		text = p4.text
	}
end

local _ = function(p4, p5)
	return if p5 == nil or p4.eventMetaBySequenceId == nil then nil else p4.eventMetaBySequenceId[p5]
end

local function resolveTurnId(p4, p5)
	local endSequenceId = p5.endSequenceId
	local var6 = if endSequenceId == nil or p4.eventMetaBySequenceId == nil then nil else p4.eventMetaBySequenceId[endSequenceId]
	
	if var6 ~= nil and var6.turnId ~= nil then
		return var6.turnId
	end
	for i, v in p5.sequenceIds do
		local var7 = if v == nil or p4.eventMetaBySequenceId == nil then nil else p4.eventMetaBySequenceId[v]
		
		if var7 ~= nil and var7.turnId ~= nil then
			return var7.turnId
		end
	end
	return nil
end

local function buildTurnFeedbackIds(p6, p7)
	-- upvalues: publishToolUtils (ref), resolveTurnId (ref)
	local latestSuccessfulResult = publishToolUtils.getLatestSuccessfulResult(p6.turnState)
	
	return {
		universeId = p7.universeId,
		placeId = p7.placeId,
		sessionId = p7.sessionId,
		sequenceId = p6.endSequenceId,
		turnId = resolveTurnId(p6.turnState, p6),
		publishedVersionNumber = if latestSuccessfulResult ~= nil then nil else latestSuccessfulResult.publishedVersionNumber,
		rollbackTargetVersionNumber = if latestSuccessfulResult ~= nil then nil else latestSuccessfulResult.rollbackTargetVersionNumber
	}
end

return function(p6, p7)
	-- upvalues: parseChatItems (ref), turnStateReducer (ref), publishToolUtils (ref), subagentTasks (ref), buildTurnFeedbackIds (ref), fFlagBuildExperienceSinglePlaytestCardModule (ref), fFlagBuildAgentRollbackModule (ref)
	local sequenceIds
	local sessionId = p7.sessionId
	local cloned = table.clone(p6)
	table.sort(cloned, function(p8, p9)
		local sequenceId = p8.sequenceId
		local sequenceId_1 = p9.sequenceId
		
		return ((if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil) or -1) < ((if typeof(sequenceId_1) == "number" and sequenceId_1 >= 0 then sequenceId_1 else nil) or -1)
	end)
	local var8 = parseChatItems(cloned, sessionId or "")
	local var9 = nil
	
	for i, v in p6 do
		sequenceIds = v.sequenceId
		local var10 = if typeof(sequenceIds) == "number" and sequenceIds >= 0 then sequenceIds else nil
		
		if var10 ~= nil and (var9 == nil or var9 < var10) then
			var9 = var10
		end
	end
	local v_1
	local t = {}
	local var11 = false
	local var12 = nil
	local tCount = nil
	local var13 = nil
	local startSequenceId = nil
	sequenceIds = nil
	local tCount_1 = nil
	
	for i_1, v_1 in var8 do
		if v_1.kind == "user_message" then
			table.insert(t, {
				kind = "user_message",
				id = if sessionId == nil or v_1.sequenceId == nil then v_1.messageId else `{sessionId}:{v_1.sequenceId}:user`,
				text = v_1.text
			})
		end
		local turnState = v_1.turnState
		
		if p7.optimisticCancelledStartSequenceId ~= nil and v_1.startSequenceId == p7.optimisticCancelledStartSequenceId and not turnState.isDone then
			turnState = turnStateReducer.applySessionUpdate(turnState, {
				sessionUpdate = "state_change",
				state = "idle",
				stop_reason = "cancelled"
			}, nil)
		end
		local var14 = publishToolUtils.includesPublishPlaceTool(turnState)
		
		if var14 then
			var11 = true
		end
		local var15 = subagentTasks.fromTurnState(turnState)
		
		if var15 ~= nil then
			var12 = var15
		end
		local var16 = if sessionId == nil or v_1.startSequenceId == nil then nil else `{sessionId}:{v_1.startSequenceId}`
		local var17 = not turnState.isDone
		table.insert(t, {
			kind = "assistant_turn",
			id = var16,
			isDone = turnState.isDone,
			turnState = turnState,
			turnKey = var16,
			startSequenceId = v_1.startSequenceId,
			endSequenceId = v_1.endSequenceId,
			optimisticLocalTools = if var17 then p7.optimisticLocalTools else nil,
			universeId = p7.universeId,
			sessionId = sessionId,
			turnFeedbackIds = buildTurnFeedbackIds(v_1, p7)
		})
		
		if var14 and turnState.isDone then
			tCount_1 = #t
		end
		if var17 then
			tCount = #t
			var13 = turnState
			startSequenceId = v_1.startSequenceId
			sequenceIds = v_1.sequenceIds
		end
	end
	if fFlagBuildExperienceSinglePlaytestCardModule and tCount_1 ~= nil then
		t[tCount_1].isLatestPublishTurn = true
	end
	local pendingUserMessage = p7.pendingUserMessage
	
	if pendingUserMessage ~= nil and pendingUserMessage ~= "" then
		local pendingUserMessageAfterSequenceId = p7.pendingUserMessageAfterSequenceId or -1
		local var18 = false
		
		for i_2, v_2 in var8 do
			if v_2.kind == "user_message" then
				local sequenceId = v_2.sequenceId
				
				if sequenceId ~= nil and pendingUserMessageAfterSequenceId < sequenceId then
					var18 = true
					break
				end
			end
		end
		if not var18 then
			table.insert(t, {
				kind = "user_message",
				id = if sessionId ~= nil then nil else `{sessionId}:pending`,
				text = pendingUserMessage
			})
		end
	end
	local liveAssistantMessage = p7.liveAssistantMessage
	local var19 = t[#t]
	local var20 = var19 ~= nil and var19.kind == "assistant_turn"
	
	if fFlagBuildAgentRollbackModule and var20 then
		v_1 = var19.startSequenceId
		var20 = if v_1 ~= nil then (p7.pendingUserMessageAfterSequenceId or -1) < v_1 else true
	end
	if liveAssistantMessage ~= nil and not var20 then
		v_1 = if sessionId ~= nil then nil else `{sessionId}:live`
		table.insert(t, {
			kind = "assistant_turn",
			isDone = false,
			id = v_1,
			turnKey = v_1,
			loading = liveAssistantMessage.setupErrorText == nil or nil,
			setupErrorText = liveAssistantMessage.setupErrorText,
			universeId = p7.universeId,
			turnFeedbackIds = {}
		})
	end
	return {
		messages = t,
		includesPublishTool = var11,
		activeTurnItemIndex = tCount,
		activeTurnState = var13,
		activeTurnStartSequenceId = startSequenceId,
		activeTurnSequenceIds = sequenceIds,
		subagentTaskState = var12,
		latestSequenceId = var9
	}
end