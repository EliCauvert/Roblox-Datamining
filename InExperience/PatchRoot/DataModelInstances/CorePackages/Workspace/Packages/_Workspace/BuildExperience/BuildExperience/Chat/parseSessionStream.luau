local buildExperience = script:FindFirstAncestor("BuildExperience")
local creatorAgentChatModule = require(buildExperience.Parent.DataHydration.CreatorAgentChat)
local _ = require(script.Parent.chatTypes)
local fFlagBuildExperienceSinglePlaytestCardModule = require(buildExperience.Flags.FFlagBuildExperienceSinglePlaytestCard)
local publishToolUtils = creatorAgentChatModule.PublishToolUtils
local turnStateReducer = creatorAgentChatModule.TurnStateReducer
local subagentTasks = creatorAgentChatModule.SubagentTasks

local function _(p0) --[[ line: 77 | named "contentBlockToText" ]]
	return if p0 == nil or p0.type ~= "text" or typeof(p0.text) ~= "string" then "" else p0.text
end

local function contentBlocksToText(p1) --[[ line: 84 ]]
	if typeof(p1) ~= "table" then
		return ""
	end
	local t = {}
	
	for i, v in p1 do
		local var8 = if v == nil or v.type ~= "text" or typeof(v.text) ~= "string" then "" else v.text
		
		if var8 ~= "" then
			table.insert(t, var8)
		end
	end
	return table.concat(t)
end

local _ = function(p2) --[[ line: 98 | named "getSequenceId" ]]
	local sequenceId = p2.sequenceId
	
	return if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil
end

local _ = function(p3) --[[ line: 106 | named "asOptimisticallyCancelled" ]]
	-- upvalues: turnStateReducer (ref)
	return turnStateReducer.applySessionUpdate(p3, {
		sessionUpdate = "state_change",
		state = "idle",
		stop_reason = "cancelled"
	}, nil)
end

local _ = function(p4) --[[ line: 114 | named "getMessageId" ]]
	local messageId = p4.messageId
	
	return if typeof(messageId) == "string" and messageId ~= "" then messageId else nil
end

local _ = function(p5) --[[ line: 119 | named "isAssistantTurnUpdate" ]]
	return if p5 ~= "agent_message" then if p5 ~= "agent_message_chunk" then if p5 ~= "tool_call_update" then if p5 ~= "tool_call_content_chunk" then p5 == "state_change" else true else true else true else true
end

local _ = function(p6) --[[ line: 127 | named "hasAssistantTurnContent" ]]
	return if p6.assistantText == "" then if #p6.activityItems <= 0 then p6.toolCallCount > 0 else true else true
end

local _ = function(p7) --[[ line: 135 | named "shouldEmitAssistantTurn" ]]
	local var9 = if p7.assistantText == "" then if #p7.activityItems <= 0 then p7.toolCallCount > 0 else true else true
	
	if not var9 then
		var9 = if #p7.pendingAgentMessageContent <= 0 then if p7.status ~= "cancelled" then if p7.stopReason ~= "cancelled" then p7.stopReason == "error" else true else true else true
	end
	return var9
end

local _ = function(p8) --[[ line: 143 | named "orderedBySequenceId" ]]
	local cloned = table.clone(p8)
	table.sort(cloned, function(p9, p10) --[[ line: 145 ]]
		local sequenceId = p9.sequenceId
		local var11 = (if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil) or -1
		local sequenceId_1 = p10.sequenceId
		sequenceId = if typeof(sequenceId_1) == "number" and sequenceId_1 >= 0 then sequenceId_1 else nil
		
		return var11 < (sequenceId or -1)
	end)
	
	return cloned
end

local function parseChatItems(p11, p12) --[[ line: 155 ]]
	-- upvalues: contentBlocksToText (ref), turnStateReducer (ref)
	local t = {}
	local var13 = nil
	local var14 = nil
	local var15 = nil
	local t_1 = {}
	local var17 = false
	
	local function flushActiveTurn() --[[ line: 163 ]]
		-- upvalues: var13 (write), var17 (write), t (ref), var14 (write), var15 (write), t_1 (write)
		if var13 ~= nil and var17 then
			local var22 = var13
			local var23 = if var22.assistantText == "" then if #var22.activityItems <= 0 then var22.toolCallCount > 0 else true else true
			
			if not var23 then
				var23 = if #var22.pendingAgentMessageContent <= 0 then if var22.status ~= "cancelled" then if var22.stopReason ~= "cancelled" then var22.stopReason == "error" else true else true else true
			end
			if var23 then
				table.insert(t, {
					kind = "assistant_turn",
					startSequenceId = var14,
					endSequenceId = var15,
					sequenceIds = t_1,
					turnState = var13
				})
			end
		end
		var13 = nil
		var14 = nil
		var15 = nil
		t_1 = {}
		var17 = false
	end
	
	local function appendUserMessage(p13, p14, p15) --[[ line: 180 ]]
		-- upvalues: t (ref)
		if p15 == "" then return end
		local var24 = t[#t]
		
		if var24 == nil or var24.kind ~= "user_message" or var24.messageId ~= p13 then
			table.insert(t, {
				kind = "user_message",
				messageId = p13,
				sequenceId = p14,
				text = p15
			})
			
			return
		end
		var24.text ..= p15
	end
	
	for i, v in p11 do
		local var21
		local sessionUpdate = v.sessionUpdate
		local sequenceId = v.sequenceId
		local var20 = if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil
		
		if sessionUpdate ~= "user_message" and sessionUpdate ~= "user_message_chunk" then
			sequenceId = if sessionUpdate ~= "agent_message" then if sessionUpdate ~= "agent_message_chunk" then if sessionUpdate ~= "tool_call_update" then if sessionUpdate ~= "tool_call_content_chunk" then sessionUpdate == "state_change" else true else true else true else true
			
			if sequenceId then
				if var13 == nil then
					var13 = turnStateReducer.createEmptyTurnState(p12)
				end
				if sessionUpdate == "state_change" and v.state == "running" then
					var17 = true
				end
				if var20 ~= nil then
					table.insert(t_1, var20)
					
					if var14 == nil or var20 < var14 then
						var14 = var20
					end
					if var15 == nil or var15 < var20 then
						var15 = var20
					end
				end
				var13 = turnStateReducer.applySessionUpdate(var13, v, { sequenceNumber = var20 })
				
				if var13.isDone then
					flushActiveTurn()
				end
			end
		end
		if var13 ~= nil then
			var21 = var13
			sequenceId = if var21.assistantText == "" then if #var21.activityItems <= 0 then var21.toolCallCount > 0 else true else true
			
			if sequenceId then
				flushActiveTurn()
			end
		end
		if sessionUpdate == "user_message" then
			sequenceId = contentBlocksToText(v.content)
		else
			var21 = v.content
			sequenceId = if var21 == nil or var21.type ~= "text" or typeof(var21.text) ~= "string" then "" else var21.text
		end
		var21 = appendUserMessage
		local messageId = v.messageId
		var21(if typeof(messageId) == "string" and messageId ~= "" then messageId else nil, var20, sequenceId)
	end
	flushActiveTurn()
	
	return t
end

local _ = function(p16, p17) --[[ line: 237 | named "buildUserMessageItem" ]]
	return {
		kind = "user_message",
		id = if p17 == nil or p16.sequenceId == nil then p16.messageId else `{p17}:{p16.sequenceId}:user`,
		text = p16.text
	}
end

local _ = function(p18, p19) --[[ line: 248 | named "getEventMeta" ]]
	return if p19 == nil or p18.eventMetaBySequenceId == nil then nil else p18.eventMetaBySequenceId[p19]
end

local function resolveTurnId(p20, p21) --[[ line: 255 ]]
	local endSequenceId = p21.endSequenceId
	local var25 = if endSequenceId == nil or p20.eventMetaBySequenceId == nil then nil else p20.eventMetaBySequenceId[endSequenceId]
	
	if var25 ~= nil and var25.turnId ~= nil then
		return var25.turnId
	end
	for i, v in p21.sequenceIds do
		local var26 = if v == nil or p20.eventMetaBySequenceId == nil then nil else p20.eventMetaBySequenceId[v]
		
		if var26 ~= nil and var26.turnId ~= nil then
			return var26.turnId
		end
	end
	return nil
end

local function buildTurnFeedbackIds(p22, p23) --[[ line: 269 ]]
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

return function(p24, p25) --[[ line: 282 | named "parseSessionStream" ]]
	-- upvalues: parseChatItems (ref), turnStateReducer (ref), publishToolUtils (ref), subagentTasks (ref), buildTurnFeedbackIds (ref), fFlagBuildExperienceSinglePlaytestCardModule (ref)
	local sequenceIds
	local sessionId = p25.sessionId
	local cloned = table.clone(p24)
	table.sort(cloned, function(p26, p27) --[[ line: 145 ]]
		local sequenceId = p26.sequenceId
		local sequenceId_1 = p27.sequenceId
		
		return ((if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil) or -1) < ((if typeof(sequenceId_1) == "number" and sequenceId_1 >= 0 then sequenceId_1 else nil) or -1)
	end)
	local var29 = parseChatItems(cloned, sessionId or "")
	local var30 = nil
	
	for i, v in p24 do
		sequenceIds = v.sequenceId
		local var44 = if typeof(sequenceIds) == "number" and sequenceIds >= 0 then sequenceIds else nil
		
		if var44 ~= nil and (var30 == nil or var30 < var44) then
			var30 = var44
		end
	end
	local v_1
	local t = {}
	local var32 = false
	local var33 = nil
	local tCount = nil
	local var35 = nil
	local startSequenceId = nil
	sequenceIds = nil
	local tCount_1 = nil
	
	for i_1, v_1 in var29 do
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
		local var40 = publishToolUtils.includesPublishPlaceTool(turnState)
		
		if var40 then
			var32 = true
		end
		local var41 = subagentTasks.fromTurnState(turnState)
		
		if var41 ~= nil then
			var33 = var41
		end
		local var42 = if sessionId == nil or v_1.startSequenceId == nil then nil else `{sessionId}:{v_1.startSequenceId}`
		local var43 = not turnState.isDone
		table.insert(t, {
			kind = "assistant_turn",
			id = var42,
			isDone = turnState.isDone,
			turnState = turnState,
			turnKey = var42,
			startSequenceId = v_1.startSequenceId,
			endSequenceId = v_1.endSequenceId,
			optimisticLocalTools = if var43 then p25.optimisticLocalTools else nil,
			universeId = p25.universeId,
			sessionId = sessionId,
			turnFeedbackIds = buildTurnFeedbackIds(v_1, p25)
		})
		
		if var40 and turnState.isDone then
			tCount_1 = #t
		end
		if var43 then
			tCount = #t
			var35 = turnState
			startSequenceId = v_1.startSequenceId
			sequenceIds = v_1.sequenceIds
		end
	end
	if fFlagBuildExperienceSinglePlaytestCardModule and tCount_1 ~= nil then
		t[tCount_1].isLatestPublishTurn = true
	end
	local pendingUserMessage = p25.pendingUserMessage
	
	if pendingUserMessage ~= nil and pendingUserMessage ~= "" then
		local pendingUserMessageAfterSequenceId = p25.pendingUserMessageAfterSequenceId or -1
		local var38 = false
		
		for i_2, v_2 in var29 do
			if v_2.kind == "user_message" then
				local sequenceId = v_2.sequenceId
				
				if sequenceId ~= nil and pendingUserMessageAfterSequenceId < sequenceId then
					var38 = true
					break
				end
			end
		end
		if not var38 then
			table.insert(t, {
				kind = "user_message",
				id = if sessionId ~= nil then nil else `{sessionId}:pending`,
				text = pendingUserMessage
			})
		end
	end
	local liveAssistantMessage = p25.liveAssistantMessage
	local var39 = t[#t]
	
	if liveAssistantMessage ~= nil and not (var39 ~= nil and var39.kind == "assistant_turn") then
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
		includesPublishTool = var32,
		activeTurnItemIndex = tCount,
		activeTurnState = var35,
		activeTurnStartSequenceId = startSequenceId,
		activeTurnSequenceIds = sequenceIds,
		subagentTaskState = var33,
		latestSequenceId = var30
	}
end