local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local sharedFlagsModule = require(parent.SharedFlags)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local _ = require(script.Parent.chatTypes)
local turnDisplayModule = require(script.Parent.turnDisplay)
local fFlagBuildExperienceSinglePlaytestCardModule = require(buildExperience.Flags.FFlagBuildExperienceSinglePlaytestCard)
local fFlagBuildExperienceExcludeUserWaitFromTurnDurationModule = require(buildExperience.Flags.FFlagBuildExperienceExcludeUserWaitFromTurnDuration)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local publishToolUtils = creatorAgentChatModule.PublishToolUtils
local studioAskUserTool = creatorAgentChatModule.StudioAskUserTool
local studioProposePlanTool = creatorAgentChatModule.StudioProposePlanTool
local ASSISTANT_STOPPED_TEXT = turnDisplayModule.ASSISTANT_STOPPED_TEXT
local countToolCalls = turnDisplayModule.countToolCalls
local formatStepCount = turnDisplayModule.formatStepCount
local getActiveActivityLabel = turnDisplayModule.getActiveActivityLabel
local getAskUserActivityLabel = turnDisplayModule.getAskUserActivityLabel
local getCompletedActivityLabel = turnDisplayModule.getCompletedActivityLabel
local getLocalToolWaitSeconds = turnDisplayModule.getLocalToolWaitSeconds
local getSummaryToolActivity = turnDisplayModule.getSummaryToolActivity
local getTurnWorkedDurationLabel = turnDisplayModule.getTurnWorkedDurationLabel
local t = {
	submittedToolCallIds = {},
	askUserByToolCallId = {},
	planByToolCallId = {}
}

local function contentBlocksToText(p1)
	local t = {}
	
	for i, v in p1 do
		if v.type == "text" and typeof(v.text) == "string" then
			table.insert(t, v.text)
		end
	end
	return table.concat(t)
end

local function getAssistantMessageTexts(p2)
	-- upvalues: contentBlocksToText (ref)
	local t = {}
	
	for i, v in p2.assistantMessageOrder do
		local var1 = p2.assistantMessages[v]
		
		if var1 ~= nil then
			local var2 = contentBlocksToText(var1)
			
			if var2 ~= "" then
				table.insert(t, var2)
			end
		end
	end
	return t
end

local function getFinalAssistantMessageText(p3)
	-- upvalues: getAssistantMessageTexts (ref)
	local var3 = getAssistantMessageTexts(p3)
	
	return var3[#var3]
end

local function _(p3, p4)
	if p4.turnKey ~= nil then
		return p4.turnKey
	end
	local sessionId = p4.sessionId or (if p3 ~= nil then "pending-session" else p3.sessionId)
	local var3 = if p4.turnFeedbackIds == nil or typeof(p4.turnFeedbackIds) == "function" then nil else p4.turnFeedbackIds.sequenceId
	
	return if var3 == nil then sessionId else `{sessionId}:{var3}`
end

local function makeSegmentKey(p3, ...)
	local list = { p3 }
	
	for i, v in { ... } do
		table.insert(list, tostring(v))
	end
	return table.concat(list, ":")
end

local _ = function(p4)
	local t = {}
	
	for i in p4.activitySlots do
		table.insert(t, i)
	end
	table.sort(t)
	
	return t
end

local _ = function(p5, p6)
	if p6.kind == "tool_call" then
		local toolCallId = p5.toolCalls[p6.toolCallId]
		
		return {
			kind = "tool_call",
			toolCallId = p6.toolCallId,
			title = if toolCallId then toolCallId.title else nil,
			status = if toolCallId then toolCallId.status else nil
		}
	end
	return nil
end

local _ = function(p5, p6, p7, p8)
	return if p6 == "" then nil else {
		kind = "agent_message",
		key = p5,
		text = p6,
		isError = p7,
		errorCode = p8
	}
end

local function makeCompletedActivitySummary(p5, p6)
	-- upvalues: fFlagBuildLocalization (ref), getSummaryToolActivity (ref), getCompletedActivityLabel (ref), countToolCalls (ref)
	if #p5 == 0 then
		return nil
	end
	local var3 = nil
	local var4 = nil
	
	if fFlagBuildLocalization then
		var4 = getSummaryToolActivity(p5, "completed")
	else
		var3 = getCompletedActivityLabel(p5)
	end
	return {
		kind = "activity_summary",
		summaryKind = "completed",
		isLoading = false,
		key = p6,
		label = var3,
		summaryToolActivity = var4,
		activityItems = p5,
		actionCount = countToolCalls(p5)
	}
end

local function makeActiveActivitySummary(p5, p6, p7, p8, p9)
	-- upvalues: fFlagBuildLocalization (ref), getSummaryToolActivity (ref), localizationStringsModule (ref), getActiveActivityLabel (ref)
	if #p5 == 0 and not p6 then
		return nil
	end
	local var3
	local _ = nil
	local var4 = nil
	
	if fFlagBuildLocalization then
		if p8 == nil then
			var4 = getSummaryToolActivity(p5, "active")
		end
		var3 = p8
		
		if var3 == nil and var4 == nil then
			var3 = localizationStringsModule.CHAT_ASSISTANT_LOADING
		end
	else
		var3 = p8 or getActiveActivityLabel(p5, p6)
	end
	return {
		kind = "activity_summary",
		summaryKind = "active",
		key = p7,
		label = var3,
		summaryToolActivity = var4,
		activityItems = p5,
		isLoading = p6,
		isWaitingForLocalTool = p9
	}
end

local function countActionsInSegments(p5)
	-- upvalues: countToolCalls (ref)
	local var3 = 0
	
	for i, v in p5 do
		if v.kind == "activity_summary" then
			var3 += v.actionCount or countToolCalls(v.activityItems)
		end
	end
	return var3
end

local function getAnsweredPromptsByToolCallId(p6)
	-- upvalues: studioAskUserTool (ref)
	local t = {}
	
	for i, v in studioAskUserTool.getAnsweredPromptsFromTurnState(p6) do
		if v.toolCallId ~= nil then
			local toolCallId = v.toolCallId
			
			if t[toolCallId] == nil then
				t[toolCallId] = {}
			end
			table.insert(t[toolCallId], v)
		end
	end
	return t
end

local function getCompletedPlansByToolCallId(p7)
	-- upvalues: studioProposePlanTool (ref)
	local t = {}
	
	for i, v in studioProposePlanTool.getCompletedPlansFromTurnState(p7) do
		if v.toolCallId ~= nil then
			t[v.toolCallId] = v
		end
	end
	return t
end

local _ = function(p8, p9, p10, p11, p12, p13, p14)
	-- upvalues: makeSegmentKey (ref)
	return {
		kind = "client_tool",
		key = makeSegmentKey(p8, "client-tool", p9, p11),
		toolCallId = p9,
		callOrder = p10,
		isActive = p12,
		answerStackPrompt = p13,
		planProposal = p14
	}
end

local function projectAskUserSegments(p8, p9, p10, p11, p12)
	-- upvalues: makeSegmentKey (ref), studioAskUserTool (ref)
	local var4 = p8.toolCalls[p10]
	
	if var4 == nil then
		return {}
	end
	local t = {}
	local var5 = p11[p10]
	
	if var5 == nil or #var5 <= 0 then
		local var6 = studioAskUserTool.extractQuestionsFromToolCall(var4)
		local var7 = p12.askUserByToolCallId[p10]
		
		if var6 == nil or var7 == nil then
			return t
		end
		for i, v in var6 do
			local var8 = var7.selections[i]
			
			if not (i == var7.currentIndex and not p12.submittedToolCallIds[p10]) then
				if var8 == nil then break end
				table.insert(t, {
					kind = "client_tool",
					isActive = false,
					planProposal = nil,
					key = makeSegmentKey(p9, "client-tool", p10, i),
					toolCallId = p10,
					callOrder = var7.callOrder,
					answerStackPrompt = {
						question = v,
						selectedOptionId = var8.selectedOptionId,
						customResponseText = var8.customResponseText,
						toolCallId = p10,
						callOrder = var7.callOrder,
						isLastQuestion = #var6 <= i
					}
				})
			end
			table.insert(t, {
				kind = "client_tool",
				isActive = true,
				planProposal = nil,
				key = makeSegmentKey(p9, "client-tool", p10, i),
				toolCallId = p10,
				callOrder = var7.callOrder,
				answerStackPrompt = {
					question = v,
					selectedOptionId = if var8 ~= nil then nil else var8.selectedOptionId,
					customResponseText = if var8 ~= nil then nil else var8.customResponseText,
					toolCallId = p10,
					callOrder = var7.callOrder,
					isLastQuestion = #var6 <= i
				}
			})
			
			return t
		end
		return t
	else
		for i, v in var5 do
			table.insert(t, {
				kind = "client_tool",
				isActive = false,
				planProposal = nil,
				key = makeSegmentKey(p9, "client-tool", p10, i),
				toolCallId = p10,
				callOrder = v.callOrder or i,
				answerStackPrompt = v
			})
		end
		return t
	end
end

local function projectPlanSegments(p13, p14, p15, p16, p17)
	-- upvalues: makeSegmentKey (ref), studioProposePlanTool (ref)
	local var9 = p13.toolCalls[p15]
	
	if var9 == nil then
		return {}
	end
	local var10 = p16[p15]
	
	if var10 ~= nil then
		return {
			{
				kind = "client_tool",
				isActive = false,
				answerStackPrompt = nil,
				key = makeSegmentKey(p14, "client-tool", p15, 1),
				toolCallId = p15,
				callOrder = var10.callOrder or 0,
				planProposal = var10
			}
		}
	end
	local var11 = p17.planByToolCallId[p15]
	local var12 = studioProposePlanTool.extractPlanFromToolCall(var9)
	
	return if var12 == nil or var11 == nil then {} else {
		{
			kind = "client_tool",
			answerStackPrompt = nil,
			key = makeSegmentKey(p14, "client-tool", p15, 1),
			toolCallId = p15,
			callOrder = var11.callOrder,
			isActive = var11.isAccepted ~= true and (var11.feedbackText == nil and not p17.submittedToolCallIds[p15]),
			planProposal = {
				title = var12.title,
				textContent = var12.textContent,
				summary = var12.summary,
				toolCallId = p15,
				callOrder = var11.callOrder,
				isAccepted = var11.isAccepted,
				feedbackText = var11.feedbackText
			}
		}
	}
end

local _ = function(p13, p14, p15, p16, p17, p18)
	-- upvalues: projectAskUserSegments (ref), projectPlanSegments (ref)
	local var9 = projectAskUserSegments(p13, p14, p15, p16, p18)
	
	return if #var9 > 0 then var9 else projectPlanSegments(p13, p14, p15, p17, p18)
end

local _ = function(p13, p14, p15)
	-- upvalues: studioAskUserTool (ref), getAskUserActivityLabel (ref)
	local var9 = p15.askUserByToolCallId[p14]
	local var10 = p13.toolCalls[p14]
	
	if var9 == nil or var10 == nil then
		return nil
	end
	local var11 = studioAskUserTool.extractQuestionsFromToolCall(var10)
	
	if var11 == nil then
		return nil
	end
	local currentIndex = var11[var9.currentIndex]
	
	return getAskUserActivityLabel(#var11, if currentIndex ~= nil then nil else #currentIndex.options)
end

local function projectWorkSegments(p13, p14, p15, p16)
	-- upvalues: getAnsweredPromptsByToolCallId (ref), getCompletedPlansByToolCallId (ref), makeSegmentKey (ref), makeActiveActivitySummary (ref), makeCompletedActivitySummary (ref), projectAskUserSegments (ref), projectPlanSegments (ref), studioAskUserTool (ref), getAskUserActivityLabel (ref), contentBlocksToText (ref)
	local t = {}
	local t_1 = {}
	local var9 = nil
	local var10 = false
	local var11 = getAnsweredPromptsByToolCallId(p13)
	local var12 = getCompletedPlansByToolCallId(p13)
	
	local function flushActivity(p17, p18)
		-- upvalues: makeSegmentKey (copy), p14 (ref), t (ref), p16 (ref), makeActiveActivitySummary (copy), t_1 (write), var9 (write), var10 (write), makeCompletedActivitySummary (copy)
		local var13 = makeSegmentKey(p14, if p17 then "activity-trailing" else "activity", p18 or #t + 1)
		local _ = nil
		local var14 = if p16 and p17 then makeActiveActivitySummary(t_1, true, var13, var9, var10) else makeCompletedActivitySummary(t_1, var13)
		
		if var14 ~= nil then
			table.insert(t, var14)
		end
		t_1 = {}
		var9 = nil
		var10 = false
	end
	
	local t_2 = {}
	
	for i in p13.activitySlots do
		table.insert(t_2, i)
	end
	table.sort(t_2)
	
	for i_1, v in t_2 do
		local var13 = p13.activitySlots[v]
		
		if var13.kind == "agent_message" then
			flushActivity(false, v)
			local text = var13.text
			local var14 = if text == "" then nil else {
				kind = "agent_message",
				isError = nil,
				errorCode = nil,
				key = makeSegmentKey(p14, "agent-message", v),
				text = text
			}
			
			if var14 ~= nil then
				table.insert(t, var14)
			end
		elseif var13.kind == "tool_call" then
			local t_4
			local toolCallId = var13.toolCallId
			local var15 = projectAskUserSegments(p13, p14, toolCallId, var11, p15)
			local var16 = if #var15 > 0 then var15 else projectPlanSegments(p13, p14, toolCallId, var12, p15)
			
			if #var16 > 0 then
				local v_1
				flushActivity(false, v)
				
				for i_2, v_1 in var16 do
					table.insert(t, v_1)
					
					if v_1.isActive then
						var10 = true
					end
				end
				if p16 then
					local t_3
					if var13.kind == "tool_call" then
						local toolCallId_1 = p13.toolCalls[var13.toolCallId]
						t_3 = {
							kind = "tool_call",
							toolCallId = var13.toolCallId,
							title = if toolCallId_1 then toolCallId_1.title else nil,
							status = if toolCallId_1 then toolCallId_1.status else nil
						}
					else
						t_3 = nil
					end
					if t_3 ~= nil then
						table.insert(t_1, t_3)
					end
					local toolCallId_1 = var13.toolCallId
					local var17 = p15.askUserByToolCallId[toolCallId_1]
					i_2 = p13.toolCalls[toolCallId_1]
					
					if var17 == nil or i_2 == nil then
						var9 = nil
					else
						v_1 = studioAskUserTool.extractQuestionsFromToolCall(i_2)
						
						if v_1 == nil then
							var9 = nil
						else
							local currentIndex = v_1[var17.currentIndex]
							var9 = getAskUserActivityLabel(#v_1, if currentIndex ~= nil then nil else #currentIndex.options)
						end
					end
				end
			elseif var13.kind == "tool_call" then
				local toolCallId_1 = p13.toolCalls[var13.toolCallId]
				t_4 = {
					kind = "tool_call",
					toolCallId = var13.toolCallId,
					title = if toolCallId_1 then toolCallId_1.title else nil,
					status = if toolCallId_1 then toolCallId_1.status else nil
				}
			else
				t_4 = nil
			end
			if t_4 ~= nil then
				table.insert(t_1, t_4)
			end
		end
	end
	local var18 = contentBlocksToText(p13.pendingAgentMessageContent)
	
	if var18 ~= "" then
		flushActivity(false, p13.pendingAgentMessageSequenceIndex)
		local var19 = if var18 == "" then nil else {
			kind = "agent_message",
			isError = nil,
			errorCode = nil,
			key = if p13.pendingAgentMessageSequenceIndex ~= nil then makeSegmentKey(p14, "pending-agent-message") else makeSegmentKey(p14, "agent-message", p13.pendingAgentMessageSequenceIndex),
			text = var18
		}
		
		if var19 ~= nil then
			table.insert(t, var19)
		end
	end
	flushActivity(true, nil)
	
	return t
end

local function makeTurnWorkSegment(p17, p18, p19, p20, p21, p22)
	-- upvalues: countActionsInSegments (ref), fFlagBuildLocalization (ref), localizationStringsModule (ref), getTurnWorkedDurationLabel (ref), makeSegmentKey (ref)
	if #p18 == 0 then
		return nil
	end
	local var20 = countActionsInSegments(p18)
	local CHAT_TURN_ACTIVITY = nil
	local var21 = nil
	
	if fFlagBuildLocalization then
		if p19 ~= nil and p20 ~= nil and p21 ~= nil then
			local var22 = p19[p20]
			local var23 = p19[p21]
			local var24 = if var22 ~= nil then nil else var22.emittedTime
			local var25 = if var23 ~= nil then nil else var23.emittedTime
			local var26 = if var24 == nil or var24 == "" then nil else DateTime.fromIsoDate(var24)
			local var27 = if var25 == nil or var25 == "" then nil else DateTime.fromIsoDate(var25)
			
			if var26 ~= nil and var27 ~= nil then
				local var28 = (var27.UnixTimestampMillis - var26.UnixTimestampMillis) / 1000
				var21 = if p22 ~= nil then var28 else math.max(0, var28 - p22)
			end
		end
		if var21 == nil and var20 == 0 then
			CHAT_TURN_ACTIVITY = localizationStringsModule.CHAT_TURN_ACTIVITY
		end
	else
		CHAT_TURN_ACTIVITY = getTurnWorkedDurationLabel(p19, p20, p21, var20, p22)
	end
	return {
		kind = "turn_work",
		key = makeSegmentKey(p17, "work"),
		label = CHAT_TURN_ACTIVITY,
		segments = p18,
		actionCount = var20,
		workedDurationSeconds = var21
	}
end

local function addTerminalAssistantMessageSegments(a, b, p17)
	-- upvalues: getAssistantMessageTexts (ref), makeSegmentKey (ref)
	for i, v in getAssistantMessageTexts(b) do
		local var20 = if v == "" then nil else {
			kind = "agent_message",
			isError = nil,
			errorCode = nil,
			key = makeSegmentKey(p17, "terminal-agent-message", i),
			text = v
		}
		
		if var20 ~= nil then
			table.insert(a, var20)
		end
	end
end

local function projectTurnSegments(p18, p19, p20)
	-- upvalues: projectWorkSegments (ref), fFlagBuildExperienceExcludeUserWaitFromTurnDurationModule (ref), getLocalToolWaitSeconds (ref), makeTurnWorkSegment (ref), addTerminalAssistantMessageSegments (ref), fFlagBuildLocalization (ref), localizationStringsModule (ref), turnDisplayModule (ref), makeSegmentKey (ref), ASSISTANT_STOPPED_TEXT (ref), publishToolUtils (ref), fFlagBuildExperienceSinglePlaytestCardModule (ref)
	local turnKey
	if p19.turnKey == nil then
		local sessionId = p19.sessionId or (if p18 ~= nil then "pending-session" else p18.sessionId)
		local var21 = if p19.turnFeedbackIds == nil or typeof(p19.turnFeedbackIds) == "function" then nil else p19.turnFeedbackIds.sequenceId
		turnKey = if var21 ~= nil then sessionId else `{sessionId}:{var21}`
	else
		turnKey = p19.turnKey
	end
	local t = {}
	local var22 = makeTurnWorkSegment(turnKey, projectWorkSegments(p18, turnKey, p20, not p18.isDone), p18.eventMetaBySequenceId, p19.startSequenceId, p19.endSequenceId, if fFlagBuildExperienceExcludeUserWaitFromTurnDurationModule then getLocalToolWaitSeconds(p18) else nil)
	
	if var22 ~= nil then
		table.insert(t, var22)
	end
	addTerminalAssistantMessageSegments(t, p18, turnKey)
	
	if p18.status == "failed" or p18.stopReason == "error" then
		local CHAT_ASSISTANT_RESPONSE_FAILED, errorCode
		local _ = nil
		local _ = nil
		
		if fFlagBuildLocalization then
			CHAT_ASSISTANT_RESPONSE_FAILED = localizationStringsModule.CHAT_ASSISTANT_RESPONSE_FAILED
			errorCode = p18.errorCode
		else
			CHAT_ASSISTANT_RESPONSE_FAILED = turnDisplayModule.formatTurnFailureMessage(p18)
			errorCode = nil
		end
		local var23 = CHAT_ASSISTANT_RESPONSE_FAILED
		local var24 = if var23 == "" then nil else {
			kind = "agent_message",
			isError = true,
			key = makeSegmentKey(turnKey, "failure"),
			text = var23,
			errorCode = errorCode
		}
		
		if var24 ~= nil then
			table.insert(t, var24)
		end
	elseif p18.status == "cancelled" or p18.stopReason == "cancelled" then
		local var25 = ASSISTANT_STOPPED_TEXT
		local var26 = if var25 == "" then nil else {
			kind = "agent_message",
			isError = nil,
			errorCode = nil,
			key = makeSegmentKey(turnKey, "cancelled"),
			text = var25
		}
		
		if var26 ~= nil then
			table.insert(t, var26)
		end
	end
	if p18.isDone and publishToolUtils.includesPublishPlaceTool(p18) and (not fFlagBuildExperienceSinglePlaytestCardModule or p19.showPlaytestCta == true) then
		table.insert(t, {
			kind = "playtest_cta",
			key = makeSegmentKey(turnKey, "playtest-cta")
		})
	end
	return t
end

return {
	formatStepCount = formatStepCount,
	getFinalAssistantMessageText = getFinalAssistantMessageText,
	projectActiveTurnSegments = function(p18, p19)
		-- upvalues: projectTurnSegments (ref), t (ref)
		return projectTurnSegments(p18, p19 or {}, if p19 and p19.optimisticLocalTools then p19.optimisticLocalTools else t)
	end,
	projectLoadingTurnSegments = function(p18)
		-- upvalues: makeActiveActivitySummary (ref), makeSegmentKey (ref), countActionsInSegments (ref), fFlagBuildLocalization (ref), localizationStringsModule (ref), getTurnWorkedDurationLabel (ref)
		local turnKey
		if p18 == nil then
			turnKey = "loading"
		elseif p18.turnKey == nil then
			local sessionId = p18.sessionId or "pending-session"
			local var21 = if p18.turnFeedbackIds == nil or typeof(p18.turnFeedbackIds) == "function" then nil else p18.turnFeedbackIds.sequenceId
			turnKey = if var21 ~= nil then sessionId else `{sessionId}:{var21}`
		else
			turnKey = p18.turnKey
		end
		local t_1
		local var22 = makeActiveActivitySummary({}, true, makeSegmentKey(turnKey, "activity-trailing"), nil)
		local t = {}
		
		if var22 ~= nil then
			table.insert(t, var22)
		end
		if #t == 0 then
			t_1 = nil
		else
			local var23 = countActionsInSegments(t)
			local CHAT_TURN_ACTIVITY = nil
			local var24 = nil
			
			if not fFlagBuildLocalization then
				CHAT_TURN_ACTIVITY = getTurnWorkedDurationLabel(nil, nil, nil, var23, nil)
			elseif var24 == nil and var23 == 0 then
				CHAT_TURN_ACTIVITY = localizationStringsModule.CHAT_TURN_ACTIVITY
			end
			t_1 = {
				kind = "turn_work",
				key = makeSegmentKey(turnKey, "work"),
				label = CHAT_TURN_ACTIVITY,
				segments = t,
				actionCount = var23,
				workedDurationSeconds = var24
			}
		end
		return if t_1 == nil then {} else { t_1 }
	end,
	projectSetupErrorSegments = function(value, p18)
		-- upvalues: makeSegmentKey (ref)
		local turnKey
		if p18 == nil then
			turnKey = "setup-error"
		elseif p18.turnKey == nil then
			local sessionId = p18.sessionId or "pending-session"
			local var21 = if p18.turnFeedbackIds == nil or typeof(p18.turnFeedbackIds) == "function" then nil else p18.turnFeedbackIds.sequenceId
			turnKey = if var21 ~= nil then sessionId else `{sessionId}:{var21}`
		else
			turnKey = p18.turnKey
		end
		return {
			{
				kind = "agent_message",
				key = makeSegmentKey(turnKey, "setup-error"),
				text = value
			}
		}
	end
}