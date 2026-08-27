local buildExperience = script:FindFirstAncestor("BuildExperience")
local creatorAgentChatModule = require(buildExperience.Parent.DataHydration.CreatorAgentChat)
local _ = require(script.Parent.chatTypes)
local fFlagBuildExperienceChatImageAttachmentsModule = require(buildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local fFlagBuildAgentRollbackModule = require(buildExperience.Flags.FFlagBuildAgentRollback)
local fFlagBuildExperienceSinglePlaytestCardModule = require(buildExperience.Flags.FFlagBuildExperienceSinglePlaytestCard)
local publishToolUtils = creatorAgentChatModule.PublishToolUtils
local turnStateReducer = creatorAgentChatModule.TurnStateReducer
local subagentTasks = creatorAgentChatModule.SubagentTasks

local function _(p1)
	return if p1 == nil or p1.type ~= "text" or typeof(p1.text) ~= "string" then "" else p1.text
end

local _ = function(p1)
	-- upvalues: fFlagBuildExperienceChatImageAttachmentsModule (ref)
	return if fFlagBuildExperienceChatImageAttachmentsModule and p1 ~= nil and (p1.type == "image" and typeof(p1.uri) == "string") and p1.uri ~= "" then { uri = p1.uri } else nil
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

local function contentBlocksToImages(p2)
	-- upvalues: fFlagBuildExperienceChatImageAttachmentsModule (ref)
	local t = {}
	
	if typeof(p2) ~= "table" then
		return t
	end
	for i, v in p2 do
		local var2 = if fFlagBuildExperienceChatImageAttachmentsModule and v ~= nil and (v.type == "image" and typeof(v.uri) == "string") and v.uri ~= "" then { uri = v.uri } else nil
		
		if var2 ~= nil then
			table.insert(t, var2)
		end
	end
	return t
end

local _ = function(p3)
	local sequenceId = p3.sequenceId
	
	return if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil
end

local _ = function(p3)
	-- upvalues: turnStateReducer (ref)
	return turnStateReducer.applySessionUpdate(p3, {
		sessionUpdate = "state_change",
		state = "idle",
		stop_reason = "cancelled"
	}, nil)
end

local _ = function(p3)
	local messageId = p3.messageId
	
	return if typeof(messageId) == "string" and messageId ~= "" then messageId else nil
end

local _ = function(p3)
	return if p3 ~= "agent_message" then if p3 ~= "agent_message_chunk" then if p3 ~= "tool_call_update" then if p3 ~= "tool_call_content_chunk" then p3 == "state_change" else true else true else true else true
end

local _ = function(p3)
	return if p3.assistantText == "" then if #p3.activityItems <= 0 then p3.toolCallCount > 0 else true else true
end

local _ = function(p3)
	local var3 = if p3.assistantText == "" then if #p3.activityItems <= 0 then p3.toolCallCount > 0 else true else true
	
	if not var3 then
		var3 = if #p3.pendingAgentMessageContent <= 0 then if p3.status ~= "cancelled" then if p3.stopReason ~= "cancelled" then p3.stopReason == "error" else true else true else true
	end
	return var3
end

local _ = function(p3)
	local cloned = table.clone(p3)
	table.sort(cloned, function(p4, p5)
		local sequenceId = p4.sequenceId
		local var3 = (if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil) or -1
		local sequenceId_1 = p5.sequenceId
		sequenceId = if typeof(sequenceId_1) == "number" and sequenceId_1 >= 0 then sequenceId_1 else nil
		
		return var3 < (sequenceId or -1)
	end)
	
	return cloned
end

local function parseChatItems(p3, p4)
	-- upvalues: contentBlocksToText (ref), contentBlocksToImages (ref), fFlagBuildExperienceChatImageAttachmentsModule (ref), turnStateReducer (ref)
	local t = {}
	local var3 = nil
	local var4 = nil
	local var5 = nil
	local t_1 = {}
	local var6 = false
	
	local function flushActiveTurn()
		-- upvalues: var3 (write), var6 (write), t (ref), var4 (write), var5 (write), t_1 (write)
		if var3 ~= nil and var6 then
			local var7 = var3
			local var8 = if var7.assistantText == "" then if #var7.activityItems <= 0 then var7.toolCallCount > 0 else true else true
			
			if not var8 then
				var8 = if #var7.pendingAgentMessageContent <= 0 then if var7.status ~= "cancelled" then if var7.stopReason ~= "cancelled" then var7.stopReason == "error" else true else true else true
			end
			if var8 then
				table.insert(t, {
					kind = "assistant_turn",
					startSequenceId = var4,
					endSequenceId = var5,
					sequenceIds = t_1,
					turnState = var3
				})
			end
		end
		var3 = nil
		var4 = nil
		var5 = nil
		t_1 = {}
		var6 = false
	end
	
	local function appendUserMessage(p5, p6, p7, p8)
		-- upvalues: t (ref)
		if p7 == "" and #p8 == 0 then return end
		local var7 = t[#t]
		
		if var7 == nil or var7.kind ~= "user_message" or var7.messageId ~= p5 then
			table.insert(t, {
				kind = "user_message",
				messageId = p5,
				sequenceId = p6,
				text = p7,
				images = p8
			})
			
			return
		end
		var7.text ..= p7
		
		for i, v in p8 do
			table.insert(var7.images, v)
		end
	end
	
	for i, v in p3 do
		local var8
		local sessionUpdate = v.sessionUpdate
		local sequenceId = v.sequenceId
		local var9 = if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil
		
		if sessionUpdate ~= "user_message" and sessionUpdate ~= "user_message_chunk" then
			sequenceId = if sessionUpdate ~= "agent_message" then if sessionUpdate ~= "agent_message_chunk" then if sessionUpdate ~= "tool_call_update" then if sessionUpdate ~= "tool_call_content_chunk" then sessionUpdate == "state_change" else true else true else true else true
			
			if sequenceId then
				if var3 == nil then
					var3 = turnStateReducer.createEmptyTurnState(p4)
				end
				if sessionUpdate == "state_change" and v.state == "running" then
					var6 = true
				end
				if var9 ~= nil then
					table.insert(t_1, var9)
					
					if var4 == nil or var9 < var4 then
						var4 = var9
					end
					if var5 == nil or var5 < var9 then
						var5 = var9
					end
				end
				var3 = turnStateReducer.applySessionUpdate(var3, v, { sequenceNumber = var9 })
				
				if var3.isDone then
					flushActiveTurn()
				end
			end
		end
		if var3 ~= nil then
			var8 = var3
			sequenceId = if var8.assistantText == "" then if #var8.activityItems <= 0 then var8.toolCallCount > 0 else true else true
			
			if sequenceId then
				flushActiveTurn()
			end
		end
		if sessionUpdate == "user_message" then
			sequenceId = contentBlocksToText(v.content)
		else
			var8 = v.content
			sequenceId = if var8 == nil or var8.type ~= "text" or typeof(var8.text) ~= "string" then "" else var8.text
		end
		local content
		var8 = nil
		
		if sessionUpdate == "user_message" then
			var8 = contentBlocksToImages(v.content)
		else
			var8 = {}
			content = v.content
			local var10 = if fFlagBuildExperienceChatImageAttachmentsModule and content ~= nil and (content.type == "image" and typeof(content.uri) == "string") and content.uri ~= "" then { uri = content.uri } else nil
			
			if var10 ~= nil then
				table.insert(var8, var10)
			end
		end
		local var11 = appendUserMessage
		local messageId = v.messageId
		content = if typeof(messageId) == "string" and messageId ~= "" then messageId else nil
		var11(content, var9, sequenceId, var8)
	end
	flushActiveTurn()
	
	return t
end

local function buildUserMessageItem(p9, p10)
	-- upvalues: fFlagBuildExperienceChatImageAttachmentsModule (ref)
	return {
		kind = "user_message",
		id = if p10 == nil or p9.sequenceId == nil then p9.messageId else `{p10}:{p9.sequenceId}:user`,
		text = p9.text,
		images = if fFlagBuildExperienceChatImageAttachmentsModule then p9.images else nil
	}
end

local _ = function(p9, p10)
	return if p10 == nil or p9.eventMetaBySequenceId == nil then nil else p9.eventMetaBySequenceId[p10]
end

local function resolveTurnId(p9, p10)
	local endSequenceId = p10.endSequenceId
	local var12 = if endSequenceId == nil or p9.eventMetaBySequenceId == nil then nil else p9.eventMetaBySequenceId[endSequenceId]
	
	if var12 ~= nil and var12.turnId ~= nil then
		return var12.turnId
	end
	for i, v in p10.sequenceIds do
		local var13 = if v == nil or p9.eventMetaBySequenceId == nil then nil else p9.eventMetaBySequenceId[v]
		
		if var13 ~= nil and var13.turnId ~= nil then
			return var13.turnId
		end
	end
	return nil
end

local function buildTurnFeedbackIds(p11, p12)
	-- upvalues: publishToolUtils (ref), resolveTurnId (ref)
	local latestSuccessfulResult = publishToolUtils.getLatestSuccessfulResult(p11.turnState)
	
	return {
		universeId = p12.universeId,
		placeId = p12.placeId,
		sessionId = p12.sessionId,
		sequenceId = p11.endSequenceId,
		turnId = resolveTurnId(p11.turnState, p11),
		publishedVersionNumber = if latestSuccessfulResult ~= nil then nil else latestSuccessfulResult.publishedVersionNumber,
		rollbackTargetVersionNumber = if latestSuccessfulResult ~= nil then nil else latestSuccessfulResult.rollbackTargetVersionNumber
	}
end

return function(p11, p12)
	-- upvalues: parseChatItems (ref), buildUserMessageItem (ref), turnStateReducer (ref), publishToolUtils (ref), subagentTasks (ref), buildTurnFeedbackIds (ref), fFlagBuildExperienceSinglePlaytestCardModule (ref), fFlagBuildExperienceChatImageAttachmentsModule (ref), fFlagBuildAgentRollbackModule (ref)
	local sequenceIds
	local sessionId = p12.sessionId
	local cloned = table.clone(p11)
	table.sort(cloned, function(p13, p14)
		local sequenceId = p13.sequenceId
		local sequenceId_1 = p14.sequenceId
		
		return ((if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil) or -1) < ((if typeof(sequenceId_1) == "number" and sequenceId_1 >= 0 then sequenceId_1 else nil) or -1)
	end)
	local var14 = parseChatItems(cloned, sessionId or "")
	local var15 = nil
	
	for i, v in p11 do
		sequenceIds = v.sequenceId
		local var16 = if typeof(sequenceIds) == "number" and sequenceIds >= 0 then sequenceIds else nil
		
		if var16 ~= nil and (var15 == nil or var15 < var16) then
			var15 = var16
		end
	end
	local v_1
	local t = {}
	local var17 = false
	local var18 = nil
	local tCount = nil
	local var19 = nil
	local startSequenceId = nil
	sequenceIds = nil
	local tCount_1 = nil
	
	for i_1, v_1 in var14 do
		if v_1.kind == "user_message" then
			table.insert(t, buildUserMessageItem(v_1, sessionId))
			continue
		end
		local turnState = v_1.turnState
		
		if p12.optimisticCancelledStartSequenceId ~= nil and v_1.startSequenceId == p12.optimisticCancelledStartSequenceId and not turnState.isDone then
			turnState = turnStateReducer.applySessionUpdate(turnState, {
				sessionUpdate = "state_change",
				state = "idle",
				stop_reason = "cancelled"
			}, nil)
		end
		local var20 = publishToolUtils.includesPublishPlaceTool(turnState)
		
		if var20 then
			var17 = true
		end
		local var21 = subagentTasks.fromTurnState(turnState)
		
		if var21 ~= nil then
			var18 = var21
		end
		local var22 = if sessionId == nil or v_1.startSequenceId == nil then nil else `{sessionId}:{v_1.startSequenceId}`
		local var23 = not turnState.isDone
		table.insert(t, {
			kind = "assistant_turn",
			id = var22,
			isDone = turnState.isDone,
			turnState = turnState,
			turnKey = var22,
			startSequenceId = v_1.startSequenceId,
			endSequenceId = v_1.endSequenceId,
			optimisticLocalTools = if var23 then p12.optimisticLocalTools else nil,
			universeId = p12.universeId,
			sessionId = sessionId,
			turnFeedbackIds = buildTurnFeedbackIds(v_1, p12)
		})
		
		if var20 and turnState.isDone then
			tCount_1 = #t
		end
		if var23 then
			tCount = #t
			var19 = turnState
			startSequenceId = v_1.startSequenceId
			sequenceIds = v_1.sequenceIds
		end
	end
	if fFlagBuildExperienceSinglePlaytestCardModule and tCount_1 ~= nil then
		t[tCount_1].isLatestPublishTurn = true
	end
	local pendingUserMessage = p12.pendingUserMessage
	local pendingUserImages = p12.pendingUserImages or {}
	
	if pendingUserMessage ~= nil and pendingUserMessage ~= "" or #pendingUserImages > 0 then
		local pendingUserMessageAfterSequenceId = p12.pendingUserMessageAfterSequenceId or -1
		local var24 = false
		
		for i_2, v_2 in var14 do
			if v_2.kind == "user_message" then
				local sequenceId = v_2.sequenceId
				
				if sequenceId ~= nil and pendingUserMessageAfterSequenceId < sequenceId then
					var24 = true
					break
				end
			end
		end
		if not var24 then
			table.insert(t, {
				kind = "user_message",
				id = if sessionId ~= nil then nil else `{sessionId}:pending`,
				text = pendingUserMessage or "",
				images = if fFlagBuildExperienceChatImageAttachmentsModule then pendingUserImages else nil
			})
		end
	end
	local liveAssistantMessage = p12.liveAssistantMessage
	local var25 = t[#t]
	v_1 = var25 ~= nil and var25.kind == "assistant_turn"
	
	if fFlagBuildAgentRollbackModule and v_1 then
		local startSequenceId_1 = var25.startSequenceId
		v_1 = if startSequenceId_1 ~= nil then (p12.pendingUserMessageAfterSequenceId or -1) < startSequenceId_1 else true
	end
	if liveAssistantMessage ~= nil and not v_1 then
		local var26 = if sessionId ~= nil then nil else `{sessionId}:live`
		table.insert(t, {
			kind = "assistant_turn",
			isDone = false,
			id = var26,
			turnKey = var26,
			loading = liveAssistantMessage.setupErrorText == nil or nil,
			setupErrorText = liveAssistantMessage.setupErrorText,
			universeId = p12.universeId,
			turnFeedbackIds = {}
		})
	end
	return {
		messages = t,
		includesPublishTool = var17,
		activeTurnItemIndex = tCount,
		activeTurnState = var19,
		activeTurnStartSequenceId = startSequenceId,
		activeTurnSequenceIds = sequenceIds,
		subagentTaskState = var18,
		latestSequenceId = var15
	}
end