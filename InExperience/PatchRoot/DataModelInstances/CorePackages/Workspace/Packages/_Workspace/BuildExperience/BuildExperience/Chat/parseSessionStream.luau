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

local _ = function(p1)
	local sequenceId = p1.sequenceId
	
	return if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil
end

local _ = function(p1)
	-- upvalues: turnStateReducer (ref)
	return turnStateReducer.applySessionUpdate(p1, {
		sessionUpdate = "state_change",
		state = "idle",
		stop_reason = "cancelled"
	}, nil)
end

local _ = function(p1)
	local messageId = p1.messageId
	
	return if typeof(messageId) == "string" and messageId ~= "" then messageId else nil
end

local _ = function(p1)
	return if p1 ~= "agent_message" then if p1 ~= "agent_message_chunk" then if p1 ~= "tool_call_update" then if p1 ~= "tool_call_content_chunk" then p1 == "state_change" else true else true else true else true
end

local _ = function(p1)
	return if p1.assistantText == "" then if #p1.activityItems <= 0 then p1.toolCallCount > 0 else true else true
end

local _ = function(p1)
	local var1 = if p1.assistantText == "" then if #p1.activityItems <= 0 then p1.toolCallCount > 0 else true else true
	
	if not var1 then
		var1 = if #p1.pendingAgentMessageContent <= 0 then if p1.status ~= "cancelled" then if p1.stopReason ~= "cancelled" then p1.stopReason == "error" else true else true else true
	end
	return var1
end

local _ = function(p1)
	local cloned = table.clone(p1)
	table.sort(cloned, function(p1, p2)
		local sequenceId = p1.sequenceId
		local var1 = (if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil) or -1
		local sequenceId_1 = p2.sequenceId
		sequenceId = if typeof(sequenceId_1) == "number" and sequenceId_1 >= 0 then sequenceId_1 else nil
		
		return var1 < (sequenceId or -1)
	end)
	
	return cloned
end

local function parseChatItems(p1, p2)
	-- upvalues: contentBlocksToText (ref), turnStateReducer (ref)
	local t = {}
	local var1 = nil
	local var2 = nil
	local var3 = nil
	local t_1 = {}
	local var4 = false
	
	local function flushActiveTurn()
		-- upvalues: var1 (write), var4 (write), t (ref), var2 (write), var3 (write), t_1 (write)
		if var1 ~= nil and var4 then
			local var1 = var1
			local var2 = if var1.assistantText == "" then if #var1.activityItems <= 0 then var1.toolCallCount > 0 else true else true
			
			if not var2 then
				var2 = if #var1.pendingAgentMessageContent <= 0 then if var1.status ~= "cancelled" then if var1.stopReason ~= "cancelled" then var1.stopReason == "error" else true else true else true
			end
			if var2 then
				table.insert(t, {
					kind = "assistant_turn",
					startSequenceId = var2,
					endSequenceId = var3,
					sequenceIds = t_1,
					turnState = var1
				})
			end
		end
		var1 = nil
		var2 = nil
		var3 = nil
		t_1 = {}
		var4 = false
	end
	
	local function appendUserMessage(p1, p2, p3)
		-- upvalues: t (ref)
		if p3 == "" then return end
		local var1 = t[#t]
		
		if var1 == nil or var1.kind ~= "user_message" or var1.messageId ~= p1 then
			table.insert(t, {
				kind = "user_message",
				messageId = p1,
				sequenceId = p2,
				text = p3
			})
			
			return
		end
		var1.text ..= p3
	end
	
	for i, v in p1 do
		local var3
		local sessionUpdate = v.sessionUpdate
		local sequenceId = v.sequenceId
		local var4 = if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil
		
		if sessionUpdate ~= "user_message" and sessionUpdate ~= "user_message_chunk" then
			sequenceId = if sessionUpdate ~= "agent_message" then if sessionUpdate ~= "agent_message_chunk" then if sessionUpdate ~= "tool_call_update" then if sessionUpdate ~= "tool_call_content_chunk" then sessionUpdate == "state_change" else true else true else true else true
			
			if sequenceId then
				if var1 == nil then
					var1 = turnStateReducer.createEmptyTurnState(p2)
				end
				if sessionUpdate == "state_change" and v.state == "running" then
					var4 = true
				end
				if var4 ~= nil then
					table.insert(t_1, var4)
					
					if var2 == nil or var4 < var2 then
						var2 = var4
					end
					if var3 == nil or var3 < var4 then
						var3 = var4
					end
				end
				var1 = turnStateReducer.applySessionUpdate(var1, v, { sequenceNumber = var4 })
				
				if var1.isDone then
					flushActiveTurn()
				end
			end
		end
		if var1 ~= nil then
			var3 = var1
			sequenceId = if var3.assistantText == "" then if #var3.activityItems <= 0 then var3.toolCallCount > 0 else true else true
			
			if sequenceId then
				flushActiveTurn()
			end
		end
		if sessionUpdate == "user_message" then
			sequenceId = contentBlocksToText(v.content)
		else
			var3 = v.content
			sequenceId = if var3 == nil or var3.type ~= "text" or typeof(var3.text) ~= "string" then "" else var3.text
		end
		var3 = appendUserMessage
		local messageId = v.messageId
		var3(if typeof(messageId) == "string" and messageId ~= "" then messageId else nil, var4, sequenceId)
	end
	flushActiveTurn()
	
	return t
end

local _ = function(p1, p2)
	return {
		kind = "user_message",
		id = if p2 == nil or p1.sequenceId == nil then p1.messageId else `{p2}:{p1.sequenceId}:user`,
		text = p1.text
	}
end

local _ = function(p1, p2)
	return if p2 == nil or p1.eventMetaBySequenceId == nil then nil else p1.eventMetaBySequenceId[p2]
end

local function resolveTurnId(p1, p2)
	local endSequenceId = p2.endSequenceId
	local var1 = if endSequenceId == nil or p1.eventMetaBySequenceId == nil then nil else p1.eventMetaBySequenceId[endSequenceId]
	
	if var1 ~= nil and var1.turnId ~= nil then
		return var1.turnId
	end
	for i, v in p2.sequenceIds do
		local var2 = if v == nil or p1.eventMetaBySequenceId == nil then nil else p1.eventMetaBySequenceId[v]
		
		if var2 ~= nil and var2.turnId ~= nil then
			return var2.turnId
		end
	end
	return nil
end

local function buildTurnFeedbackIds(p1, p2)
	-- upvalues: publishToolUtils (ref), resolveTurnId (ref)
	local latestSuccessfulResult = publishToolUtils.getLatestSuccessfulResult(p1.turnState)
	
	return {
		universeId = p2.universeId,
		placeId = p2.placeId,
		sessionId = p2.sessionId,
		sequenceId = p1.endSequenceId,
		turnId = resolveTurnId(p1.turnState, p1),
		publishedVersionNumber = if latestSuccessfulResult ~= nil then nil else latestSuccessfulResult.publishedVersionNumber,
		rollbackTargetVersionNumber = if latestSuccessfulResult ~= nil then nil else latestSuccessfulResult.rollbackTargetVersionNumber
	}
end

return function(p1, p2)
	-- upvalues: parseChatItems (ref), turnStateReducer (ref), publishToolUtils (ref), subagentTasks (ref), buildTurnFeedbackIds (ref), fFlagBuildExperienceSinglePlaytestCardModule (ref), fFlagBuildAgentRollbackModule (ref)
	local sequenceIds
	local sessionId = p2.sessionId
	local cloned = table.clone(p1)
	table.sort(cloned, function(p1, p2)
		local sequenceId = p1.sequenceId
		local sequenceId_1 = p2.sequenceId
		
		return ((if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil) or -1) < ((if typeof(sequenceId_1) == "number" and sequenceId_1 >= 0 then sequenceId_1 else nil) or -1)
	end)
	local var1 = parseChatItems(cloned, sessionId or "")
	local var2 = nil
	
	for i, v in p1 do
		sequenceIds = v.sequenceId
		local var3 = if typeof(sequenceIds) == "number" and sequenceIds >= 0 then sequenceIds else nil
		
		if var3 ~= nil and (var2 == nil or var2 < var3) then
			var2 = var3
		end
	end
	local v_1
	local t = {}
	local var4 = false
	local var5 = nil
	local tCount = nil
	local var6 = nil
	local startSequenceId = nil
	sequenceIds = nil
	local tCount_1 = nil
	
	for i_1, v_1 in var1 do
		if v_1.kind == "user_message" then
			table.insert(t, {
				kind = "user_message",
				id = if sessionId == nil or v_1.sequenceId == nil then v_1.messageId else `{sessionId}:{v_1.sequenceId}:user`,
				text = v_1.text
			})
		end
		local turnState = v_1.turnState
		
		if p2.optimisticCancelledStartSequenceId ~= nil and v_1.startSequenceId == p2.optimisticCancelledStartSequenceId and not turnState.isDone then
			turnState = turnStateReducer.applySessionUpdate(turnState, {
				sessionUpdate = "state_change",
				state = "idle",
				stop_reason = "cancelled"
			}, nil)
		end
		local var7 = publishToolUtils.includesPublishPlaceTool(turnState)
		
		if var7 then
			var4 = true
		end
		local var8 = subagentTasks.fromTurnState(turnState)
		
		if var8 ~= nil then
			var5 = var8
		end
		local var9 = if sessionId == nil or v_1.startSequenceId == nil then nil else `{sessionId}:{v_1.startSequenceId}`
		local var10 = not turnState.isDone
		table.insert(t, {
			kind = "assistant_turn",
			id = var9,
			isDone = turnState.isDone,
			turnState = turnState,
			turnKey = var9,
			startSequenceId = v_1.startSequenceId,
			endSequenceId = v_1.endSequenceId,
			optimisticLocalTools = if var10 then p2.optimisticLocalTools else nil,
			universeId = p2.universeId,
			sessionId = sessionId,
			turnFeedbackIds = buildTurnFeedbackIds(v_1, p2)
		})
		
		if var7 and turnState.isDone then
			tCount_1 = #t
		end
		if var10 then
			tCount = #t
			var6 = turnState
			startSequenceId = v_1.startSequenceId
			sequenceIds = v_1.sequenceIds
		end
	end
	if fFlagBuildExperienceSinglePlaytestCardModule and tCount_1 ~= nil then
		t[tCount_1].isLatestPublishTurn = true
	end
	local pendingUserMessage = p2.pendingUserMessage
	
	if pendingUserMessage ~= nil and pendingUserMessage ~= "" then
		local pendingUserMessageAfterSequenceId = p2.pendingUserMessageAfterSequenceId or -1
		local var11 = false
		
		for i_2, v_2 in var1 do
			if v_2.kind == "user_message" then
				local sequenceId = v_2.sequenceId
				
				if sequenceId ~= nil and pendingUserMessageAfterSequenceId < sequenceId then
					var11 = true
					break
				end
			end
		end
		if not var11 then
			table.insert(t, {
				kind = "user_message",
				id = if sessionId ~= nil then nil else `{sessionId}:pending`,
				text = pendingUserMessage
			})
		end
	end
	local liveAssistantMessage = p2.liveAssistantMessage
	local var12 = t[#t]
	local var13 = var12 ~= nil and var12.kind == "assistant_turn"
	
	if fFlagBuildAgentRollbackModule and var13 then
		v_1 = var12.startSequenceId
		var13 = if v_1 ~= nil then (p2.pendingUserMessageAfterSequenceId or -1) < v_1 else true
	end
	if liveAssistantMessage ~= nil and not var13 then
		v_1 = if sessionId ~= nil then nil else `{sessionId}:live`
		table.insert(t, {
			kind = "assistant_turn",
			isDone = false,
			id = v_1,
			turnKey = v_1,
			loading = liveAssistantMessage.setupErrorText == nil or nil,
			setupErrorText = liveAssistantMessage.setupErrorText,
			universeId = p2.universeId,
			turnFeedbackIds = {}
		})
	end
	return {
		messages = t,
		includesPublishTool = var4,
		activeTurnItemIndex = tCount,
		activeTurnState = var6,
		activeTurnStartSequenceId = startSequenceId,
		activeTurnSequenceIds = sequenceIds,
		subagentTaskState = var5,
		latestSequenceId = var2
	}
end