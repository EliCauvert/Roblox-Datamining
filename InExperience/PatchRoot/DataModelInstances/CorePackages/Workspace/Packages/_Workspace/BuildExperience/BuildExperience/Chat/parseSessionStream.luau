local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local chatTypesModule = require(script.Parent.chatTypes)
local fFlagBuildAdUpsellModule = require(buildExperience.Flags.FFlagBuildAdUpsell)
local fFlagBuildAgentRollbackModule = require(buildExperience.Flags.FFlagBuildAgentRollback)
local fFlagBuildExperienceChatImageAttachmentsModule = require(buildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local fFlagBuildExperienceChatResourceAttachments = require(parent.SharedFlags).FFlagBuildExperienceChatResourceAttachments
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

local function contentBlockToResourceAttachment(p1)
	return if not (p1 ~= nil and p1.type == "resource_link" and (typeof(p1.name) == "string" and p1.name ~= "") and (typeof(p1.uri) == "string" and p1.uri ~= "")) then if p1 == nil or p1.type ~= "resource" or (typeof(p1.resource) ~= "table" or typeof(p1.resource.uri) ~= "string") or (p1.resource.uri == "" or typeof(p1.resource.text) ~= "string") then nil else { type = "resource", resource = p1.resource } else {
		type = "resource_link",
		name = p1.name,
		uri = p1.uri,
		mimeType = if typeof(p1.mimeType) == "string" then p1.mimeType else nil
	}
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

local function contentBlocksToResourceAttachments(p3)
	-- upvalues: contentBlockToResourceAttachment (ref)
	local t = {}
	
	if typeof(p3) ~= "table" then
		return t
	end
	for i, v in p3 do
		local var3 = contentBlockToResourceAttachment(v)
		
		if var3 ~= nil then
			table.insert(t, var3)
		end
	end
	return t
end

local _ = function(p4)
	local sequenceId = p4.sequenceId
	
	return if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil
end

local _ = function(p4)
	-- upvalues: turnStateReducer (ref)
	return turnStateReducer.applySessionUpdate(p4, {
		sessionUpdate = "state_change",
		state = "idle",
		stop_reason = "cancelled"
	}, nil)
end

local _ = function(p4)
	local messageId = p4.messageId
	
	return if typeof(messageId) == "string" and messageId ~= "" then messageId else nil
end

local _ = function(p4)
	return if p4 ~= "agent_message" then if p4 ~= "agent_message_chunk" then if p4 ~= "tool_call_update" then if p4 ~= "tool_call_content_chunk" then p4 == "state_change" else true else true else true else true
end

local _ = function(p4)
	return if p4.assistantText == "" then if #p4.activityItems <= 0 then p4.toolCallCount > 0 else true else true
end

local _ = function(p4)
	local var4 = if p4.assistantText == "" then if #p4.activityItems <= 0 then p4.toolCallCount > 0 else true else true
	
	if not var4 then
		var4 = if #p4.pendingAgentMessageContent <= 0 then if p4.status ~= "cancelled" then if p4.stopReason ~= "cancelled" then p4.stopReason == "error" else true else true else true
	end
	return var4
end

local _ = function(p4)
	local cloned = table.clone(p4)
	table.sort(cloned, function(p5, p6)
		local sequenceId = p5.sequenceId
		local var4 = (if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil) or -1
		local sequenceId_1 = p6.sequenceId
		sequenceId = if typeof(sequenceId_1) == "number" and sequenceId_1 >= 0 then sequenceId_1 else nil
		
		return var4 < (sequenceId or -1)
	end)
	
	return cloned
end

local function parseChatItems(p4, p5)
	-- upvalues: contentBlocksToText (ref), contentBlocksToImages (ref), fFlagBuildExperienceChatImageAttachmentsModule (ref), fFlagBuildExperienceChatResourceAttachments (ref), contentBlocksToResourceAttachments (ref), contentBlockToResourceAttachment (ref), turnStateReducer (ref)
	local t = {}
	local var4 = nil
	local var5 = nil
	local var6 = nil
	local t_1 = {}
	local var7 = false
	
	local function flushActiveTurn()
		-- upvalues: var4 (write), var7 (write), t (ref), var5 (write), var6 (write), t_1 (write)
		if var4 ~= nil and var7 then
			local var8 = var4
			local var9 = if var8.assistantText == "" then if #var8.activityItems <= 0 then var8.toolCallCount > 0 else true else true
			
			if not var9 then
				var9 = if #var8.pendingAgentMessageContent <= 0 then if var8.status ~= "cancelled" then if var8.stopReason ~= "cancelled" then var8.stopReason == "error" else true else true else true
			end
			if var9 then
				table.insert(t, {
					kind = "assistant_turn",
					startSequenceId = var5,
					endSequenceId = var6,
					sequenceIds = t_1,
					turnState = var4
				})
			end
		end
		var4 = nil
		var5 = nil
		var6 = nil
		t_1 = {}
		var7 = false
	end
	
	local function appendUserMessage(p6, p7, p8, p9, p10)
		-- upvalues: t (ref)
		if p8 == "" and #p9 == 0 and #p10 == 0 then return end
		local var8 = t[#t]
		
		if var8 == nil or var8.kind ~= "user_message" or var8.messageId ~= p6 then
			table.insert(t, {
				kind = "user_message",
				messageId = p6,
				sequenceId = p7,
				text = p8,
				images = p9,
				resourceAttachments = p10
			})
			
			return
		end
		var8.text ..= p8
		
		for i, v in p9 do
			table.insert(var8.images, v)
		end
		for i, v_1 in p10 do
			table.insert(var8.resourceAttachments, v_1)
		end
	end
	
	for i, v in p4 do
		local var9
		local sessionUpdate = v.sessionUpdate
		local sequenceId = v.sequenceId
		local var10 = if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil
		
		if sessionUpdate ~= "user_message" and sessionUpdate ~= "user_message_chunk" then
			sequenceId = if sessionUpdate ~= "agent_message" then if sessionUpdate ~= "agent_message_chunk" then if sessionUpdate ~= "tool_call_update" then if sessionUpdate ~= "tool_call_content_chunk" then sessionUpdate == "state_change" else true else true else true else true
			
			if sequenceId then
				if var4 == nil then
					var4 = turnStateReducer.createEmptyTurnState(p5)
				end
				if sessionUpdate == "state_change" and v.state == "running" then
					var7 = true
				end
				if var10 ~= nil then
					table.insert(t_1, var10)
					
					if var5 == nil or var10 < var5 then
						var5 = var10
					end
					if var6 == nil or var6 < var10 then
						var6 = var10
					end
				end
				var4 = turnStateReducer.applySessionUpdate(var4, v, { sequenceNumber = var10 })
				
				if var4.isDone then
					flushActiveTurn()
				end
			end
		end
		if var4 ~= nil then
			var9 = var4
			sequenceId = if var9.assistantText == "" then if #var9.activityItems <= 0 then var9.toolCallCount > 0 else true else true
			
			if sequenceId then
				flushActiveTurn()
			end
		end
		if sessionUpdate == "user_message" then
			sequenceId = contentBlocksToText(v.content)
		else
			var9 = v.content
			sequenceId = if var9 == nil or var9.type ~= "text" or typeof(var9.text) ~= "string" then "" else var9.text
		end
		local content
		var9 = nil
		
		if sessionUpdate == "user_message" then
			var9 = contentBlocksToImages(v.content)
		else
			var9 = {}
			content = v.content
			local var11 = if fFlagBuildExperienceChatImageAttachmentsModule and content ~= nil and (content.type == "image" and typeof(content.uri) == "string") and content.uri ~= "" then { uri = content.uri } else nil
			
			if var11 ~= nil then
				table.insert(var9, var11)
			end
		end
		local var12
		local _ = nil
		
		if not fFlagBuildExperienceChatResourceAttachments then
			var12 = {}
		elseif sessionUpdate == "user_message" then
			var12 = contentBlocksToResourceAttachments(v.content)
		else
			var12 = {}
			content = contentBlockToResourceAttachment(v.content)
			
			if content ~= nil then
				table.insert(var12, content)
			end
		end
		content = appendUserMessage
		local messageId = v.messageId
		content(if typeof(messageId) == "string" and messageId ~= "" then messageId else nil, var10, sequenceId, var9, var12)
	end
	flushActiveTurn()
	
	return t
end

local function buildUserMessageItem(p11, p12)
	-- upvalues: fFlagBuildExperienceChatImageAttachmentsModule (ref), fFlagBuildExperienceChatResourceAttachments (ref)
	return {
		kind = "user_message",
		id = if p12 == nil or p11.sequenceId == nil then p11.messageId else `{p12}:{p11.sequenceId}:user`,
		text = p11.text,
		images = if fFlagBuildExperienceChatImageAttachmentsModule then p11.images else nil,
		resourceAttachments = if fFlagBuildExperienceChatResourceAttachments and #p11.resourceAttachments > 0 then p11.resourceAttachments else nil
	}
end

local _ = function(p11, p12)
	return if p12 == nil or p11.eventMetaBySequenceId == nil then nil else p11.eventMetaBySequenceId[p12]
end

local function resolveTurnId(p11, p12)
	local endSequenceId = p12.endSequenceId
	local var13 = if endSequenceId == nil or p11.eventMetaBySequenceId == nil then nil else p11.eventMetaBySequenceId[endSequenceId]
	
	if var13 ~= nil and var13.turnId ~= nil then
		return var13.turnId
	end
	for i, v in p12.sequenceIds do
		local var14 = if v == nil or p11.eventMetaBySequenceId == nil then nil else p11.eventMetaBySequenceId[v]
		
		if var14 ~= nil and var14.turnId ~= nil then
			return var14.turnId
		end
	end
	return nil
end

local function buildTurnFeedbackIds(p13, p14)
	-- upvalues: publishToolUtils (ref), resolveTurnId (ref)
	local latestSuccessfulResult = publishToolUtils.getLatestSuccessfulResult(p13.turnState)
	
	return {
		universeId = p14.universeId,
		placeId = p14.placeId,
		sessionId = p14.sessionId,
		sequenceId = p13.endSequenceId,
		turnId = resolveTurnId(p13.turnState, p13),
		publishedVersionNumber = if latestSuccessfulResult ~= nil then nil else latestSuccessfulResult.publishedVersionNumber,
		rollbackTargetVersionNumber = if latestSuccessfulResult ~= nil then nil else latestSuccessfulResult.rollbackTargetVersionNumber
	}
end

return function(p13, p14)
	-- upvalues: parseChatItems (ref), buildUserMessageItem (ref), turnStateReducer (ref), publishToolUtils (ref), subagentTasks (ref), fFlagBuildAdUpsellModule (ref), buildTurnFeedbackIds (ref), fFlagBuildExperienceSinglePlaytestCardModule (ref), fFlagBuildExperienceChatResourceAttachments (ref), chatTypesModule (ref), fFlagBuildExperienceChatImageAttachmentsModule (ref), fFlagBuildAgentRollbackModule (ref)
	local sequenceIds
	local sessionId = p14.sessionId
	local cloned = table.clone(p13)
	table.sort(cloned, function(p15, p16)
		local sequenceId = p15.sequenceId
		local sequenceId_1 = p16.sequenceId
		
		return ((if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil) or -1) < ((if typeof(sequenceId_1) == "number" and sequenceId_1 >= 0 then sequenceId_1 else nil) or -1)
	end)
	local var15 = parseChatItems(cloned, sessionId or "")
	local var16 = nil
	
	for i, v in p13 do
		sequenceIds = v.sequenceId
		local var17 = if typeof(sequenceIds) == "number" and sequenceIds >= 0 then sequenceIds else nil
		
		if var17 ~= nil and (var16 == nil or var16 < var17) then
			var16 = var17
		end
	end
	local v_1
	local t = {}
	local var18 = false
	local var19 = nil
	local tCount = nil
	local var20 = nil
	local startSequenceId = nil
	sequenceIds = nil
	local tCount_1 = nil
	
	for i_1, v_1 in var15 do
		if v_1.kind == "user_message" then
			table.insert(t, buildUserMessageItem(v_1, sessionId))
			continue
		end
		local turnState = v_1.turnState
		local var21 = p14.optimisticCancelledStartSequenceId ~= nil and (v_1.startSequenceId == p14.optimisticCancelledStartSequenceId and not turnState.isDone)
		
		if var21 then
			turnState = turnStateReducer.applySessionUpdate(turnState, {
				sessionUpdate = "state_change",
				state = "idle",
				stop_reason = "cancelled"
			}, nil)
		end
		local var22 = publishToolUtils.includesPublishPlaceTool(turnState)
		
		if var22 then
			var18 = true
		end
		local var23 = subagentTasks.fromTurnState(turnState)
		
		if var23 ~= nil then
			var19 = var23
		end
		local var24 = if sessionId == nil or v_1.startSequenceId == nil then nil else `{sessionId}:{v_1.startSequenceId}`
		local var25 = not turnState.isDone
		table.insert(t, {
			kind = "assistant_turn",
			id = var24,
			isDone = turnState.isDone,
			turnState = turnState,
			turnKey = var24,
			startSequenceId = v_1.startSequenceId,
			endSequenceId = v_1.endSequenceId,
			isOptimisticallyCancelled = if fFlagBuildAdUpsellModule and var21 then true else nil,
			optimisticLocalTools = if var25 then p14.optimisticLocalTools else nil,
			universeId = p14.universeId,
			sessionId = sessionId,
			turnFeedbackIds = buildTurnFeedbackIds(v_1, p14)
		})
		
		if var22 and turnState.isDone then
			tCount_1 = #t
		end
		if var25 then
			tCount = #t
			var20 = turnState
			startSequenceId = v_1.startSequenceId
			sequenceIds = v_1.sequenceIds
		end
	end
	if fFlagBuildExperienceSinglePlaytestCardModule and tCount_1 ~= nil then
		t[tCount_1].isLatestPublishTurn = true
	end
	local pendingUserMessage = p14.pendingUserMessage
	local pendingUserImages = p14.pendingUserImages or {}
	local var26 = if fFlagBuildExperienceChatResourceAttachments then p14.pendingUserResourceAttachments or {} else {}
	
	if pendingUserMessage ~= nil and pendingUserMessage ~= "" or (#pendingUserImages > 0 or #var26 > 0) then
		local pendingUserMessageAfterSequenceId = p14.pendingUserMessageAfterSequenceId or -1
		v_1 = false
		
		for i_2, v_2 in var15 do
			if v_2.kind == "user_message" then
				local sequenceId = v_2.sequenceId
				
				if sequenceId ~= nil and pendingUserMessageAfterSequenceId < sequenceId then
					v_1 = true
					break
				end
			end
		end
		if not v_1 then
			table.insert(t, {
				kind = "user_message",
				id = if sessionId ~= nil then nil else `{sessionId}{chatTypesModule.PENDING_USER_MESSAGE_ID_SUFFIX}`,
				text = pendingUserMessage or "",
				images = if fFlagBuildExperienceChatImageAttachmentsModule then pendingUserImages else nil,
				resourceAttachments = if fFlagBuildExperienceChatResourceAttachments then var26 else nil
			})
		end
	end
	local liveAssistantMessage = p14.liveAssistantMessage
	v_1 = t[#t]
	local var27 = v_1 ~= nil and v_1.kind == "assistant_turn"
	
	if fFlagBuildAgentRollbackModule and var27 then
		local startSequenceId_1 = v_1.startSequenceId
		var27 = if startSequenceId_1 ~= nil then (p14.pendingUserMessageAfterSequenceId or -1) < startSequenceId_1 else true
	end
	if liveAssistantMessage ~= nil and not var27 then
		local var28 = if sessionId ~= nil then nil else `{sessionId}:live`
		table.insert(t, {
			kind = "assistant_turn",
			isDone = false,
			id = var28,
			turnKey = var28,
			loading = liveAssistantMessage.setupErrorText == nil or nil,
			setupErrorText = liveAssistantMessage.setupErrorText,
			universeId = p14.universeId,
			turnFeedbackIds = {}
		})
	end
	return {
		messages = t,
		includesPublishTool = var18,
		activeTurnItemIndex = tCount,
		activeTurnState = var20,
		activeTurnStartSequenceId = startSequenceId,
		activeTurnSequenceIds = sequenceIds,
		subagentTaskState = var19,
		latestSequenceId = var16
	}
end