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

local function contentBlocksToText(p0) --[[ line: 64 ]]
	local t = {}
	
	for i, v in p0 do
		if v.type == "text" and typeof(v.text) == "string" then
			table.insert(t, v.text)
		end
	end
	return table.concat(t)
end

local function getAssistantMessageTexts(p1) --[[ line: 74 ]]
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

local function getFinalAssistantMessageText(p2) --[[ line: 88 ]]
	-- upvalues: getAssistantMessageTexts (ref)
	local var27 = getAssistantMessageTexts(p2)
	
	return var27[#var27]
end

local function _(p3, p4) --[[ line: 93 | named "makeTurnKey" ]]
	if p4.turnKey ~= nil then
		return p4.turnKey
	end
	local sessionId = p4.sessionId or (if p3 ~= nil then "pending-session" else p3.sessionId)
	local var29 = if p4.turnFeedbackIds == nil or typeof(p4.turnFeedbackIds) == "function" then nil else p4.turnFeedbackIds.sequenceId
	
	return if var29 == nil then sessionId else `{sessionId}:{var29}`
end

local function makeSegmentKey(p5, ...) --[[ line: 105 ]]
	local list = { p5 }
	
	for i, v in { ... } do
		table.insert(list, tostring(v))
	end
	return table.concat(list, ":")
end

local _ = function(p6) --[[ line: 113 | named "getSortedActivitySlotIndexes" ]]
	local t = {}
	
	for i in p6.activitySlots do
		table.insert(t, i)
	end
	table.sort(t)
	
	return t
end

local _ = function(p7, p8) --[[ line: 122 | named "makeTurnActivityItem" ]]
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

local _ = function(p9, p10, p11, p12) --[[ line: 135 | named "makeAgentMessageSegment" ]]
	return if p10 == "" then nil else {
		kind = "agent_message",
		key = p9,
		text = p10,
		isError = p11,
		errorCode = p12
	}
end

local function makeCompletedActivitySummary(p13, p14) --[[ line: 153 ]]
	-- upvalues: fFlagBuildLocalization (ref), getSummaryToolActivity (ref), turnDisplayModule (ref), getCompletedActivityLabel (ref), countToolCalls (ref)
	if #p13 == 0 then
		return nil
	end
	local var32 = if fFlagBuildLocalization then getSummaryToolActivity(p13, "completed") else nil
	
	return {
		kind = "activity_summary",
		summaryKind = "completed",
		isLoading = false,
		key = p14,
		label = if var32 ~= nil then getCompletedActivityLabel(p13) else turnDisplayModule.getToolActivityLabel(var32),
		summaryToolActivity = var32,
		activityItems = p13,
		actionCount = countToolCalls(p13)
	}
end

local function makeActiveActivitySummary(p15, p16, p17, p18, p19) --[[ line: 175 ]]
	-- upvalues: fFlagBuildLocalization (ref), getSummaryToolActivity (ref), turnDisplayModule (ref), getActiveActivityLabel (ref)
	if #p15 == 0 and not p16 then
		return nil
	end
	local var33 = if fFlagBuildLocalization and p18 == nil then getSummaryToolActivity(p15, "active") else nil
	
	return {
		kind = "activity_summary",
		summaryKind = "active",
		key = p17,
		label = p18 or (if var33 ~= nil then getActiveActivityLabel(p15, p16) else turnDisplayModule.getToolActivityLabel(var33)),
		summaryToolActivity = var33,
		activityItems = p15,
		isLoading = p16,
		isWaitingForLocalTool = p19
	}
end

local function countActionsInSegments(p20) --[[ line: 203 ]]
	-- upvalues: countToolCalls (ref)
	local var34 = 0
	
	for i, v in p20 do
		if v.kind == "activity_summary" then
			var34 += v.actionCount or countToolCalls(v.activityItems)
		end
	end
	return var34
end

local function getAnsweredPromptsByToolCallId(p21) --[[ line: 213 ]]
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

local function getCompletedPlansByToolCallId(p22) --[[ line: 227 ]]
	-- upvalues: studioProposePlanTool (ref)
	local t = {}
	
	for i, v in studioProposePlanTool.getCompletedPlansFromTurnState(p22) do
		if v.toolCallId ~= nil then
			t[v.toolCallId] = v
		end
	end
	return t
end

local _ = function(p23, p24, p25, p26, p27, p28, p29) --[[ line: 237 | named "makeClientToolSegment" ]]
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

local function projectAskUserSegments(p30, p31, p32, p33, p34) --[[ line: 257 ]]
	-- upvalues: makeSegmentKey (ref), studioAskUserTool (ref)
	local var37 = p30.toolCalls[p32]
	
	if var37 == nil then
		return {}
	end
	local t = {}
	local var39 = p33[p32]
	
	if var39 == nil or #var39 <= 0 then
		local var40 = studioAskUserTool.extractQuestionsFromToolCall(var37)
		local var41 = p34.askUserByToolCallId[p32]
		
		if var40 == nil or var41 == nil then
			return t
		end
		for i, v in var40 do
			local var42 = var41.selections[i]
			
			if not (i == var41.currentIndex and not p34.submittedToolCallIds[p32]) then
				if var42 == nil then break end
				table.insert(t, {
					kind = "client_tool",
					isActive = false,
					planProposal = nil,
					key = makeSegmentKey(p31, "client-tool", p32, i),
					toolCallId = p32,
					callOrder = var41.callOrder,
					answerStackPrompt = {
						question = v,
						selectedOptionId = var42.selectedOptionId,
						customResponseText = var42.customResponseText,
						toolCallId = p32,
						callOrder = var41.callOrder,
						isLastQuestion = #var40 <= i
					}
				})
			end
			table.insert(t, {
				kind = "client_tool",
				isActive = true,
				planProposal = nil,
				key = makeSegmentKey(p31, "client-tool", p32, i),
				toolCallId = p32,
				callOrder = var41.callOrder,
				answerStackPrompt = {
					question = v,
					selectedOptionId = if var42 ~= nil then nil else var42.selectedOptionId,
					customResponseText = if var42 ~= nil then nil else var42.customResponseText,
					toolCallId = p32,
					callOrder = var41.callOrder,
					isLastQuestion = #var40 <= i
				}
			})
			
			return t
		end
		return t
	else
		for i, v in var39 do
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

local function projectPlanSegments(p35, p36, p37, p38, p39) --[[ line: 324 ]]
	-- upvalues: makeSegmentKey (ref), studioProposePlanTool (ref)
	local var43 = p35.toolCalls[p37]
	
	if var43 == nil then
		return {}
	end
	local var44 = p38[p37]
	
	if var44 ~= nil then
		return {
			{
				kind = "client_tool",
				isActive = false,
				answerStackPrompt = nil,
				key = makeSegmentKey(p36, "client-tool", p37, 1),
				toolCallId = p37,
				callOrder = var44.callOrder or 0,
				planProposal = var44
			}
		}
	end
	local var45 = p39.planByToolCallId[p37]
	local var46 = studioProposePlanTool.extractPlanFromToolCall(var43)
	
	return if var46 == nil or var45 == nil then {} else {
		{
			kind = "client_tool",
			answerStackPrompt = nil,
			key = makeSegmentKey(p36, "client-tool", p37, 1),
			toolCallId = p37,
			callOrder = var45.callOrder,
			isActive = var45.isAccepted ~= true and (var45.feedbackText == nil and not p39.submittedToolCallIds[p37]),
			planProposal = {
				title = var46.title,
				textContent = var46.textContent,
				summary = var46.summary,
				toolCallId = p37,
				callOrder = var45.callOrder,
				isAccepted = var45.isAccepted,
				feedbackText = var45.feedbackText
			}
		}
	}
end

local _ = function(p40, p41, p42, p43, p44, p45) --[[ line: 366 | named "projectLocalToolSegments" ]]
	-- upvalues: projectAskUserSegments (ref), projectPlanSegments (ref)
	local var47 = projectAskUserSegments(p40, p41, p42, p43, p45)
	
	return if #var47 > 0 then var47 else projectPlanSegments(p40, p41, p42, p44, p45)
end

local _ = function(p46, p47, p48) --[[ line: 382 | named "getActiveAskUserActivityLabel" ]]
	-- upvalues: studioAskUserTool (ref), getAskUserActivityLabel (ref)
	local var48 = p48.askUserByToolCallId[p47]
	local var49 = p46.toolCalls[p47]
	
	if var48 == nil or var49 == nil then
		return nil
	end
	local var50 = studioAskUserTool.extractQuestionsFromToolCall(var49)
	
	if var50 == nil then
		return nil
	end
	local currentIndex = var50[var48.currentIndex]
	
	return getAskUserActivityLabel(#var50, if currentIndex ~= nil then nil else #currentIndex.options)
end

local function projectWorkSegments(p49, p50, p51, p52) --[[ line: 403 ]]
	-- upvalues: getAnsweredPromptsByToolCallId (ref), getCompletedPlansByToolCallId (ref), makeSegmentKey (ref), makeActiveActivitySummary (ref), makeCompletedActivitySummary (ref), projectAskUserSegments (ref), projectPlanSegments (ref), studioAskUserTool (ref), getAskUserActivityLabel (ref), contentBlocksToText (ref)
	local t = {}
	local t_1 = {}
	local var53 = nil
	local var54 = false
	local var55 = getAnsweredPromptsByToolCallId(p49)
	local var56 = getCompletedPlansByToolCallId(p49)
	
	local function flushActivity(p53, p54) --[[ line: 416 ]]
		-- upvalues: makeSegmentKey (copy), p50 (ref), t (ref), p52 (ref), makeActiveActivitySummary (copy), t_1 (write), var53 (write), var54 (write), makeCompletedActivitySummary (copy)
		local var68 = makeSegmentKey(p50, if p53 then "activity-trailing" else "activity", p54 or #t + 1)
		local _ = nil
		local var69 = if p52 and p53 then makeActiveActivitySummary(t_1, true, var68, var53, var54) else makeCompletedActivitySummary(t_1, var68)
		
		if var69 ~= nil then
			table.insert(t, var69)
		end
		t_1 = {}
		var53 = nil
		var54 = false
	end
	
	local t_2 = {}
	
	for i in p49.activitySlots do
		table.insert(t_2, i)
	end
	table.sort(t_2)
	
	for i_1, v in t_2 do
		local var61 = p49.activitySlots[v]
		
		if var61.kind == "agent_message" then
			flushActivity(false, v)
			local text = var61.text
			local var62 = if text == "" then nil else {
				kind = "agent_message",
				isError = nil,
				errorCode = nil,
				key = makeSegmentKey(p50, "agent-message", v),
				text = text
			}
			
			if var62 ~= nil then
				table.insert(t, var62)
			end
		elseif var61.kind == "tool_call" then
			local t_4
			local toolCallId = var61.toolCallId
			local var63 = projectAskUserSegments(p49, p50, toolCallId, var55, p51)
			local var64 = if #var63 > 0 then var63 else projectPlanSegments(p49, p50, toolCallId, var56, p51)
			
			if #var64 > 0 then
				local v_1
				flushActivity(false, v)
				
				for i_2, v_1 in var64 do
					table.insert(t, v_1)
					
					if v_1.isActive then
						var54 = true
					end
				end
				if p52 then
					local t_3
					if var61.kind == "tool_call" then
						local toolCallId_1 = p49.toolCalls[var61.toolCallId]
						t_3 = {
							kind = "tool_call",
							toolCallId = var61.toolCallId,
							title = if toolCallId_1 then toolCallId_1.title else nil,
							status = if toolCallId_1 then toolCallId_1.status else nil
						}
					else
						t_3 = nil
					end
					if t_3 ~= nil then
						table.insert(t_1, t_3)
					end
					local toolCallId_1 = var61.toolCallId
					local var66 = p51.askUserByToolCallId[toolCallId_1]
					i_2 = p49.toolCalls[toolCallId_1]
					
					if var66 == nil or i_2 == nil then
						var53 = nil
					else
						v_1 = studioAskUserTool.extractQuestionsFromToolCall(i_2)
						
						if v_1 == nil then
							var53 = nil
						else
							local currentIndex = v_1[var66.currentIndex]
							var53 = getAskUserActivityLabel(#v_1, if currentIndex ~= nil then nil else #currentIndex.options)
						end
					end
				end
			elseif var61.kind == "tool_call" then
				local toolCallId_1 = p49.toolCalls[var61.toolCallId]
				t_4 = {
					kind = "tool_call",
					toolCallId = var61.toolCallId,
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
	local var59 = contentBlocksToText(p49.pendingAgentMessageContent)
	
	if var59 ~= "" then
		flushActivity(false, p49.pendingAgentMessageSequenceIndex)
		local var60 = if var59 == "" then nil else {
			kind = "agent_message",
			isError = nil,
			errorCode = nil,
			key = if p49.pendingAgentMessageSequenceIndex ~= nil then makeSegmentKey(p50, "pending-agent-message") else makeSegmentKey(p50, "agent-message", p49.pendingAgentMessageSequenceIndex),
			text = var59
		}
		
		if var60 ~= nil then
			table.insert(t, var60)
		end
	end
	flushActivity(true, nil)
	
	return t
end

local function makeTurnWorkSegment(p55, p56, p57, p58, p59, p60) --[[ line: 496 ]]
	-- upvalues: countActionsInSegments (ref), makeSegmentKey (ref), getTurnWorkedDurationLabel (ref)
	if #p56 == 0 then
		return nil
	end
	local var70 = countActionsInSegments(p56)
	
	return {
		kind = "turn_work",
		key = makeSegmentKey(p55, "work"),
		label = getTurnWorkedDurationLabel(p57, p58, p59, var70, p60),
		segments = p56,
		actionCount = var70
	}
end

local function addTerminalAssistantMessageSegments(a, b, p61) --[[ line: 523 ]]
	-- upvalues: getAssistantMessageTexts (ref), makeSegmentKey (ref)
	for i, v in getAssistantMessageTexts(b) do
		local var71 = if v == "" then nil else {
			kind = "agent_message",
			isError = nil,
			errorCode = nil,
			key = makeSegmentKey(p61, "terminal-agent-message", i),
			text = v
		}
		
		if var71 ~= nil then
			table.insert(a, var71)
		end
	end
end

local function projectTurnSegments(p62, p63, p64) --[[ line: 533 ]]
	-- upvalues: projectWorkSegments (ref), fFlagBuildExperienceExcludeUserWaitFromTurnDurationModule (ref), getLocalToolWaitSeconds (ref), makeTurnWorkSegment (ref), addTerminalAssistantMessageSegments (ref), fFlagBuildLocalization (ref), localizationStringsModule (ref), turnDisplayModule (ref), makeSegmentKey (ref), ASSISTANT_STOPPED_TEXT (ref), publishToolUtils (ref), fFlagBuildExperienceSinglePlaytestCardModule (ref)
	local turnKey
	if p63.turnKey == nil then
		local sessionId = p63.sessionId or (if p62 ~= nil then "pending-session" else p62.sessionId)
		local var73 = if p63.turnFeedbackIds == nil or typeof(p63.turnFeedbackIds) == "function" then nil else p63.turnFeedbackIds.sequenceId
		turnKey = if var73 ~= nil then sessionId else `{sessionId}:{var73}`
	else
		turnKey = p63.turnKey
	end
	local t = {}
	local var75 = makeTurnWorkSegment(turnKey, projectWorkSegments(p62, turnKey, p64, not p62.isDone), p62.eventMetaBySequenceId, p63.startSequenceId, p63.endSequenceId, if fFlagBuildExperienceExcludeUserWaitFromTurnDurationModule then getLocalToolWaitSeconds(p62) else nil)
	
	if var75 ~= nil then
		table.insert(t, var75)
	end
	addTerminalAssistantMessageSegments(t, p62, turnKey)
	
	if p62.status == "failed" or p62.stopReason == "error" then
		local var78, errorCode
		local _ = nil
		local _ = nil
		
		if fFlagBuildLocalization and p62.error == nil then
			var78 = localizationStringsModule.CHAT_ASSISTANT_RESPONSE_FAILED
			errorCode = p62.errorCode
		else
			var78 = turnDisplayModule.formatTurnFailureMessage(p62)
			errorCode = nil
		end
		local var79 = var78
		local var80 = if var79 == "" then nil else {
			kind = "agent_message",
			isError = true,
			key = makeSegmentKey(turnKey, "failure"),
			text = var79,
			errorCode = errorCode
		}
		
		if var80 ~= nil then
			table.insert(t, var80)
		end
	elseif p62.status == "cancelled" or p62.stopReason == "cancelled" then
		local var76 = ASSISTANT_STOPPED_TEXT
		local var77 = if var76 == "" then nil else {
			kind = "agent_message",
			isError = nil,
			errorCode = nil,
			key = makeSegmentKey(turnKey, "cancelled"),
			text = var76
		}
		
		if var77 ~= nil then
			table.insert(t, var77)
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
	projectActiveTurnSegments = function(p65, p66) --[[ line: 616 ]]
		-- upvalues: projectTurnSegments (ref), t (ref)
		return projectTurnSegments(p65, p66 or {}, if p66 and p66.optimisticLocalTools then p66.optimisticLocalTools else t)
	end,
	projectLoadingTurnSegments = function(p67) --[[ line: 594 ]]
		-- upvalues: makeActiveActivitySummary (ref), makeSegmentKey (ref), makeTurnWorkSegment (ref)
		local turnKey
		if p67 == nil then
			turnKey = "loading"
		elseif p67.turnKey == nil then
			local sessionId = p67.sessionId or "pending-session"
			local var82 = if p67.turnFeedbackIds == nil or typeof(p67.turnFeedbackIds) == "function" then nil else p67.turnFeedbackIds.sequenceId
			turnKey = if var82 ~= nil then sessionId else `{sessionId}:{var82}`
		else
			turnKey = p67.turnKey
		end
		local var83 = makeActiveActivitySummary({}, true, makeSegmentKey(turnKey, "activity-trailing"), nil)
		local t = {}
		
		if var83 ~= nil then
			table.insert(t, var83)
		end
		local var85 = makeTurnWorkSegment(turnKey, t)
		
		return if var85 == nil then {} else { var85 }
	end,
	projectSetupErrorSegments = function(value, p68) --[[ line: 605 ]]
		-- upvalues: makeSegmentKey (ref)
		local turnKey
		if p68 == nil then
			turnKey = "setup-error"
		elseif p68.turnKey == nil then
			local sessionId = p68.sessionId or "pending-session"
			local var87 = if p68.turnFeedbackIds == nil or typeof(p68.turnFeedbackIds) == "function" then nil else p68.turnFeedbackIds.sequenceId
			turnKey = if var87 ~= nil then sessionId else `{sessionId}:{var87}`
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