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

local function contentBlocksToText(p0)
	local t = {}
	
	for i, v in p0 do
		if v.type == "text" and typeof(v.text) == "string" then
			table.insert(t, v.text)
		end
	end
	return table.concat(t)
end

local function getAssistantMessageTexts(p1)
	-- upvalues: contentBlocksToText (ref)
	local t = {}
	
	for i, v in p1.assistantMessageOrder do
		local var25 = p1.assistantMessages[v]
		
		if var25 ~= nil then
			local var26 = contentBlocksToText(var25)
			
			if var26 ~= "" then
				table.insert(t, var26)
			end
		end
	end
	return t
end

local function getFinalAssistantMessageText(p2)
	-- upvalues: getAssistantMessageTexts (ref)
	local var27 = getAssistantMessageTexts(p2)
	
	return var27[#var27]
end

local function _(p3, p4)
	if p4.turnKey ~= nil then
		return p4.turnKey
	end
	local sessionId = p4.sessionId or (if p3 ~= nil then "pending-session" else p3.sessionId)
	local var29 = if p4.turnFeedbackIds == nil or typeof(p4.turnFeedbackIds) == "function" then nil else p4.turnFeedbackIds.sequenceId
	
	return if var29 == nil then sessionId else `{sessionId}:{var29}`
end

local function makeSegmentKey(p5, ...)
	local list = { p5 }
	
	for i, v in { ... } do
		table.insert(list, tostring(v))
	end
	return table.concat(list, ":")
end

local _ = function(p6)
	local t = {}
	
	for i in p6.activitySlots do
		table.insert(t, i)
	end
	table.sort(t)
	
	return t
end

local _ = function(p7, p8)
	if p8.kind == "tool_call" then
		local toolCallId = p7.toolCalls[p8.toolCallId]
		
		return {
			kind = "tool_call",
			toolCallId = p8.toolCallId,
			title = if toolCallId then toolCallId.title else nil,
			status = if toolCallId then toolCallId.status else nil
		}
	end
	return nil
end

local _ = function(p9, p10, p11, p12)
	return if p10 == "" then nil else {
		kind = "agent_message",
		key = p9,
		text = p10,
		isError = p11,
		errorCode = p12
	}
end

local function makeCompletedActivitySummary(p13, p14)
	-- upvalues: fFlagBuildLocalization (ref), getSummaryToolActivity (ref), getCompletedActivityLabel (ref), countToolCalls (ref)
	if #p13 == 0 then
		return nil
	end
	local var32 = nil
	local var33 = nil
	
	if fFlagBuildLocalization then
		var33 = getSummaryToolActivity(p13, "completed")
	else
		var32 = getCompletedActivityLabel(p13)
	end
	return {
		kind = "activity_summary",
		summaryKind = "completed",
		isLoading = false,
		key = p14,
		label = var32,
		summaryToolActivity = var33,
		activityItems = p13,
		actionCount = countToolCalls(p13)
	}
end

local function makeActiveActivitySummary(p15, p16, p17, p18, p19)
	-- upvalues: fFlagBuildLocalization (ref), getSummaryToolActivity (ref), localizationStringsModule (ref), getActiveActivityLabel (ref)
	if #p15 == 0 and not p16 then
		return nil
	end
	local var35
	local _ = nil
	local var34 = nil
	
	if fFlagBuildLocalization then
		if p18 == nil then
			var34 = getSummaryToolActivity(p15, "active")
		end
		var35 = p18
		
		if var35 == nil and var34 == nil then
			var35 = localizationStringsModule.CHAT_ASSISTANT_LOADING
		end
	else
		var35 = p18 or getActiveActivityLabel(p15, p16)
	end
	return {
		kind = "activity_summary",
		summaryKind = "active",
		key = p17,
		label = var35,
		summaryToolActivity = var34,
		activityItems = p15,
		isLoading = p16,
		isWaitingForLocalTool = p19
	}
end

local function countActionsInSegments(p20)
	-- upvalues: countToolCalls (ref)
	local var36 = 0
	
	for i, v in p20 do
		if v.kind == "activity_summary" then
			var36 += v.actionCount or countToolCalls(v.activityItems)
		end
	end
	return var36
end

local function getAnsweredPromptsByToolCallId(p21)
	-- upvalues: studioAskUserTool (ref)
	local t = {}
	
	for i, v in studioAskUserTool.getAnsweredPromptsFromTurnState(p21) do
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

local function getCompletedPlansByToolCallId(p22)
	-- upvalues: studioProposePlanTool (ref)
	local t = {}
	
	for i, v in studioProposePlanTool.getCompletedPlansFromTurnState(p22) do
		if v.toolCallId ~= nil then
			t[v.toolCallId] = v
		end
	end
	return t
end

local _ = function(p23, p24, p25, p26, p27, p28, p29)
	-- upvalues: makeSegmentKey (ref)
	return {
		kind = "client_tool",
		key = makeSegmentKey(p23, "client-tool", p24, p26),
		toolCallId = p24,
		callOrder = p25,
		isActive = p27,
		answerStackPrompt = p28,
		planProposal = p29
	}
end

local function projectAskUserSegments(p30, p31, p32, p33, p34)
	-- upvalues: makeSegmentKey (ref), studioAskUserTool (ref)
	local var39 = p30.toolCalls[p32]
	
	if var39 == nil then
		return {}
	end
	local t = {}
	local var41 = p33[p32]
	
	if var41 == nil or #var41 <= 0 then
		local var42 = studioAskUserTool.extractQuestionsFromToolCall(var39)
		local var43 = p34.askUserByToolCallId[p32]
		
		if var42 == nil or var43 == nil then
			return t
		end
		for i, v in var42 do
			local var44 = var43.selections[i]
			
			if not (i == var43.currentIndex and not p34.submittedToolCallIds[p32]) then
				if var44 == nil then break end
				table.insert(t, {
					kind = "client_tool",
					isActive = false,
					planProposal = nil,
					key = makeSegmentKey(p31, "client-tool", p32, i),
					toolCallId = p32,
					callOrder = var43.callOrder,
					answerStackPrompt = {
						question = v,
						selectedOptionId = var44.selectedOptionId,
						customResponseText = var44.customResponseText,
						toolCallId = p32,
						callOrder = var43.callOrder,
						isLastQuestion = #var42 <= i
					}
				})
			end
			table.insert(t, {
				kind = "client_tool",
				isActive = true,
				planProposal = nil,
				key = makeSegmentKey(p31, "client-tool", p32, i),
				toolCallId = p32,
				callOrder = var43.callOrder,
				answerStackPrompt = {
					question = v,
					selectedOptionId = if var44 ~= nil then nil else var44.selectedOptionId,
					customResponseText = if var44 ~= nil then nil else var44.customResponseText,
					toolCallId = p32,
					callOrder = var43.callOrder,
					isLastQuestion = #var42 <= i
				}
			})
			
			return t
		end
		return t
	else
		for i, v in var41 do
			table.insert(t, {
				kind = "client_tool",
				isActive = false,
				planProposal = nil,
				key = makeSegmentKey(p31, "client-tool", p32, i),
				toolCallId = p32,
				callOrder = v.callOrder or i,
				answerStackPrompt = v
			})
		end
		return t
	end
end

local function projectPlanSegments(p35, p36, p37, p38, p39)
	-- upvalues: makeSegmentKey (ref), studioProposePlanTool (ref)
	local var45 = p35.toolCalls[p37]
	
	if var45 == nil then
		return {}
	end
	local var46 = p38[p37]
	
	if var46 ~= nil then
		return {
			{
				kind = "client_tool",
				isActive = false,
				answerStackPrompt = nil,
				key = makeSegmentKey(p36, "client-tool", p37, 1),
				toolCallId = p37,
				callOrder = var46.callOrder or 0,
				planProposal = var46
			}
		}
	end
	local var47 = p39.planByToolCallId[p37]
	local var48 = studioProposePlanTool.extractPlanFromToolCall(var45)
	
	return if var48 == nil or var47 == nil then {} else {
		{
			kind = "client_tool",
			answerStackPrompt = nil,
			key = makeSegmentKey(p36, "client-tool", p37, 1),
			toolCallId = p37,
			callOrder = var47.callOrder,
			isActive = var47.isAccepted ~= true and (var47.feedbackText == nil and not p39.submittedToolCallIds[p37]),
			planProposal = {
				title = var48.title,
				textContent = var48.textContent,
				summary = var48.summary,
				toolCallId = p37,
				callOrder = var47.callOrder,
				isAccepted = var47.isAccepted,
				feedbackText = var47.feedbackText
			}
		}
	}
end

local _ = function(p40, p41, p42, p43, p44, p45)
	-- upvalues: projectAskUserSegments (ref), projectPlanSegments (ref)
	local var49 = projectAskUserSegments(p40, p41, p42, p43, p45)
	
	return if #var49 > 0 then var49 else projectPlanSegments(p40, p41, p42, p44, p45)
end

local _ = function(p46, p47, p48)
	-- upvalues: studioAskUserTool (ref), getAskUserActivityLabel (ref)
	local var50 = p48.askUserByToolCallId[p47]
	local var51 = p46.toolCalls[p47]
	
	if var50 == nil or var51 == nil then
		return nil
	end
	local var52 = studioAskUserTool.extractQuestionsFromToolCall(var51)
	
	if var52 == nil then
		return nil
	end
	local currentIndex = var52[var50.currentIndex]
	
	return getAskUserActivityLabel(#var52, if currentIndex ~= nil then nil else #currentIndex.options)
end

local function projectWorkSegments(p49, p50, p51, p52)
	-- upvalues: getAnsweredPromptsByToolCallId (ref), getCompletedPlansByToolCallId (ref), makeSegmentKey (ref), makeActiveActivitySummary (ref), makeCompletedActivitySummary (ref), projectAskUserSegments (ref), projectPlanSegments (ref), studioAskUserTool (ref), getAskUserActivityLabel (ref), contentBlocksToText (ref)
	local t = {}
	local t_1 = {}
	local var55 = nil
	local var56 = false
	local var57 = getAnsweredPromptsByToolCallId(p49)
	local var58 = getCompletedPlansByToolCallId(p49)
	
	local function flushActivity(p53, p54)
		-- upvalues: makeSegmentKey (copy), p50 (ref), t (ref), p52 (ref), makeActiveActivitySummary (copy), t_1 (write), var55 (write), var56 (write), makeCompletedActivitySummary (copy)
		local var70 = makeSegmentKey(p50, if p53 then "activity-trailing" else "activity", p54 or #t + 1)
		local _ = nil
		local var71 = if p52 and p53 then makeActiveActivitySummary(t_1, true, var70, var55, var56) else makeCompletedActivitySummary(t_1, var70)
		
		if var71 ~= nil then
			table.insert(t, var71)
		end
		t_1 = {}
		var55 = nil
		var56 = false
	end
	
	local t_2 = {}
	
	for i in p49.activitySlots do
		table.insert(t_2, i)
	end
	table.sort(t_2)
	
	for i_1, v in t_2 do
		local var63 = p49.activitySlots[v]
		
		if var63.kind == "agent_message" then
			flushActivity(false, v)
			local text = var63.text
			local var64 = if text == "" then nil else {
				kind = "agent_message",
				isError = nil,
				errorCode = nil,
				key = makeSegmentKey(p50, "agent-message", v),
				text = text
			}
			
			if var64 ~= nil then
				table.insert(t, var64)
			end
		elseif var63.kind == "tool_call" then
			local t_4
			local toolCallId = var63.toolCallId
			local var65 = projectAskUserSegments(p49, p50, toolCallId, var57, p51)
			local var66 = if #var65 > 0 then var65 else projectPlanSegments(p49, p50, toolCallId, var58, p51)
			
			if #var66 > 0 then
				local v_1
				flushActivity(false, v)
				
				for i_2, v_1 in var66 do
					table.insert(t, v_1)
					
					if v_1.isActive then
						var56 = true
					end
				end
				if p52 then
					local t_3
					if var63.kind == "tool_call" then
						local toolCallId_1 = p49.toolCalls[var63.toolCallId]
						t_3 = {
							kind = "tool_call",
							toolCallId = var63.toolCallId,
							title = if toolCallId_1 then toolCallId_1.title else nil,
							status = if toolCallId_1 then toolCallId_1.status else nil
						}
					else
						t_3 = nil
					end
					if t_3 ~= nil then
						table.insert(t_1, t_3)
					end
					local toolCallId_1 = var63.toolCallId
					local var68 = p51.askUserByToolCallId[toolCallId_1]
					i_2 = p49.toolCalls[toolCallId_1]
					
					if var68 == nil or i_2 == nil then
						var55 = nil
					else
						v_1 = studioAskUserTool.extractQuestionsFromToolCall(i_2)
						
						if v_1 == nil then
							var55 = nil
						else
							local currentIndex = v_1[var68.currentIndex]
							var55 = getAskUserActivityLabel(#v_1, if currentIndex ~= nil then nil else #currentIndex.options)
						end
					end
				end
			elseif var63.kind == "tool_call" then
				local toolCallId_1 = p49.toolCalls[var63.toolCallId]
				t_4 = {
					kind = "tool_call",
					toolCallId = var63.toolCallId,
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
	local var61 = contentBlocksToText(p49.pendingAgentMessageContent)
	
	if var61 ~= "" then
		flushActivity(false, p49.pendingAgentMessageSequenceIndex)
		local var62 = if var61 == "" then nil else {
			kind = "agent_message",
			isError = nil,
			errorCode = nil,
			key = if p49.pendingAgentMessageSequenceIndex ~= nil then makeSegmentKey(p50, "pending-agent-message") else makeSegmentKey(p50, "agent-message", p49.pendingAgentMessageSequenceIndex),
			text = var61
		}
		
		if var62 ~= nil then
			table.insert(t, var62)
		end
	end
	flushActivity(true, nil)
	
	return t
end

local function makeTurnWorkSegment(p55, p56, p57, p58, p59, p60)
	-- upvalues: countActionsInSegments (ref), fFlagBuildLocalization (ref), localizationStringsModule (ref), getTurnWorkedDurationLabel (ref), makeSegmentKey (ref)
	if #p56 == 0 then
		return nil
	end
	local var72 = countActionsInSegments(p56)
	local CHAT_TURN_ACTIVITY = nil
	local var73 = nil
	
	if fFlagBuildLocalization then
		if p57 ~= nil and p58 ~= nil and p59 ~= nil then
			local var74 = p57[p58]
			local var75 = p57[p59]
			local var76 = if var74 ~= nil then nil else var74.emittedTime
			local var77 = if var75 ~= nil then nil else var75.emittedTime
			local var78 = if var76 == nil or var76 == "" then nil else DateTime.fromIsoDate(var76)
			local var79 = if var77 == nil or var77 == "" then nil else DateTime.fromIsoDate(var77)
			
			if var78 ~= nil and var79 ~= nil then
				local var80 = (var79.UnixTimestampMillis - var78.UnixTimestampMillis) / 1000
				var73 = if p60 ~= nil then var80 else math.max(0, var80 - p60)
			end
		end
		if var73 == nil and var72 == 0 then
			CHAT_TURN_ACTIVITY = localizationStringsModule.CHAT_TURN_ACTIVITY
		end
	else
		CHAT_TURN_ACTIVITY = getTurnWorkedDurationLabel(p57, p58, p59, var72, p60)
	end
	return {
		kind = "turn_work",
		key = makeSegmentKey(p55, "work"),
		label = CHAT_TURN_ACTIVITY,
		segments = p56,
		actionCount = var72,
		workedDurationSeconds = var73
	}
end

local function addTerminalAssistantMessageSegments(a, b, p61)
	-- upvalues: getAssistantMessageTexts (ref), makeSegmentKey (ref)
	for i, v in getAssistantMessageTexts(b) do
		local var81 = if v == "" then nil else {
			kind = "agent_message",
			isError = nil,
			errorCode = nil,
			key = makeSegmentKey(p61, "terminal-agent-message", i),
			text = v
		}
		
		if var81 ~= nil then
			table.insert(a, var81)
		end
	end
end

local function projectTurnSegments(p62, p63, p64)
	-- upvalues: projectWorkSegments (ref), fFlagBuildExperienceExcludeUserWaitFromTurnDurationModule (ref), getLocalToolWaitSeconds (ref), makeTurnWorkSegment (ref), addTerminalAssistantMessageSegments (ref), fFlagBuildLocalization (ref), localizationStringsModule (ref), turnDisplayModule (ref), makeSegmentKey (ref), ASSISTANT_STOPPED_TEXT (ref), publishToolUtils (ref), fFlagBuildExperienceSinglePlaytestCardModule (ref)
	local turnKey
	if p63.turnKey == nil then
		local sessionId = p63.sessionId or (if p62 ~= nil then "pending-session" else p62.sessionId)
		local var83 = if p63.turnFeedbackIds == nil or typeof(p63.turnFeedbackIds) == "function" then nil else p63.turnFeedbackIds.sequenceId
		turnKey = if var83 ~= nil then sessionId else `{sessionId}:{var83}`
	else
		turnKey = p63.turnKey
	end
	local t = {}
	local var85 = makeTurnWorkSegment(turnKey, projectWorkSegments(p62, turnKey, p64, not p62.isDone), p62.eventMetaBySequenceId, p63.startSequenceId, p63.endSequenceId, if fFlagBuildExperienceExcludeUserWaitFromTurnDurationModule then getLocalToolWaitSeconds(p62) else nil)
	
	if var85 ~= nil then
		table.insert(t, var85)
	end
	addTerminalAssistantMessageSegments(t, p62, turnKey)
	
	if p62.status == "failed" or p62.stopReason == "error" then
		local CHAT_ASSISTANT_RESPONSE_FAILED, errorCode
		local _ = nil
		local _ = nil
		
		if fFlagBuildLocalization then
			CHAT_ASSISTANT_RESPONSE_FAILED = localizationStringsModule.CHAT_ASSISTANT_RESPONSE_FAILED
			errorCode = p62.errorCode
		else
			CHAT_ASSISTANT_RESPONSE_FAILED = turnDisplayModule.formatTurnFailureMessage(p62)
			errorCode = nil
		end
		local var88 = CHAT_ASSISTANT_RESPONSE_FAILED
		local var89 = if var88 == "" then nil else {
			kind = "agent_message",
			isError = true,
			key = makeSegmentKey(turnKey, "failure"),
			text = var88,
			errorCode = errorCode
		}
		
		if var89 ~= nil then
			table.insert(t, var89)
		end
	elseif p62.status == "cancelled" or p62.stopReason == "cancelled" then
		local var86 = ASSISTANT_STOPPED_TEXT
		local var87 = if var86 == "" then nil else {
			kind = "agent_message",
			isError = nil,
			errorCode = nil,
			key = makeSegmentKey(turnKey, "cancelled"),
			text = var86
		}
		
		if var87 ~= nil then
			table.insert(t, var87)
		end
	end
	if p62.isDone and publishToolUtils.includesPublishPlaceTool(p62) and (not fFlagBuildExperienceSinglePlaytestCardModule or p63.showPlaytestCta == true) then
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
	projectActiveTurnSegments = function(p65, p66)
		-- upvalues: projectTurnSegments (ref), t (ref)
		return projectTurnSegments(p65, p66 or {}, if p66 and p66.optimisticLocalTools then p66.optimisticLocalTools else t)
	end,
	projectLoadingTurnSegments = function(p67)
		-- upvalues: makeActiveActivitySummary (ref), makeSegmentKey (ref), countActionsInSegments (ref), fFlagBuildLocalization (ref), localizationStringsModule (ref), getTurnWorkedDurationLabel (ref)
		local turnKey
		if p67 == nil then
			turnKey = "loading"
		elseif p67.turnKey == nil then
			local sessionId = p67.sessionId or "pending-session"
			local var91 = if p67.turnFeedbackIds == nil or typeof(p67.turnFeedbackIds) == "function" then nil else p67.turnFeedbackIds.sequenceId
			turnKey = if var91 ~= nil then sessionId else `{sessionId}:{var91}`
		else
			turnKey = p67.turnKey
		end
		local t_1
		local var92 = makeActiveActivitySummary({}, true, makeSegmentKey(turnKey, "activity-trailing"), nil)
		local t = {}
		
		if var92 ~= nil then
			table.insert(t, var92)
		end
		if #t == 0 then
			t_1 = nil
		else
			local var95 = countActionsInSegments(t)
			local CHAT_TURN_ACTIVITY = nil
			local var96 = nil
			
			if not fFlagBuildLocalization then
				CHAT_TURN_ACTIVITY = getTurnWorkedDurationLabel(nil, nil, nil, var95, nil)
			elseif var96 == nil and var95 == 0 then
				CHAT_TURN_ACTIVITY = localizationStringsModule.CHAT_TURN_ACTIVITY
			end
			t_1 = {
				kind = "turn_work",
				key = makeSegmentKey(turnKey, "work"),
				label = CHAT_TURN_ACTIVITY,
				segments = t,
				actionCount = var95,
				workedDurationSeconds = var96
			}
		end
		return if t_1 == nil then {} else { t_1 }
	end,
	projectSetupErrorSegments = function(value, p68)
		-- upvalues: makeSegmentKey (ref)
		local turnKey
		if p68 == nil then
			turnKey = "setup-error"
		elseif p68.turnKey == nil then
			local sessionId = p68.sessionId or "pending-session"
			local var98 = if p68.turnFeedbackIds == nil or typeof(p68.turnFeedbackIds) == "function" then nil else p68.turnFeedbackIds.sequenceId
			turnKey = if var98 ~= nil then sessionId else `{sessionId}:{var98}`
		else
			turnKey = p68.turnKey
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