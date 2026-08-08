local buildExperience = script:FindFirstAncestor("BuildExperience")
local creatorAgentChatModule = require(buildExperience.Parent.DataHydration.CreatorAgentChat)
local _ = require(script.Parent.chatTypes)
local turnDisplayModule = require(script.Parent.turnDisplay)
local fFlagBuildExperienceExcludeUserWaitFromTurnDurationModule = require(buildExperience.Flags.FFlagBuildExperienceExcludeUserWaitFromTurnDuration)
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
local getTurnWorkedDurationLabel = turnDisplayModule.getTurnWorkedDurationLabel
local t = {
	submittedToolCallIds = {},
	askUserByToolCallId = {},
	planByToolCallId = {}
}

local function contentBlocksToText(p0) --[[ line: 58 ]]
	local t = {}
	
	for i, v in p0 do
		if v.type == "text" and typeof(v.text) == "string" then
			table.insert(t, v.text)
		end
	end
	return table.concat(t)
end

local function getAssistantMessageTexts(p1) --[[ line: 68 ]]
	-- upvalues: contentBlocksToText (ref)
	local t = {}
	
	for i, v in p1.assistantMessageOrder do
		local var21 = p1.assistantMessages[v]
		
		if var21 ~= nil then
			local var22 = contentBlocksToText(var21)
			
			if var22 ~= "" then
				table.insert(t, var22)
			end
		end
	end
	return t
end

local function getFinalAssistantMessageText(p2) --[[ line: 82 ]]
	-- upvalues: getAssistantMessageTexts (ref)
	local var23 = getAssistantMessageTexts(p2)
	
	return var23[#var23]
end

local function _(p3, p4) --[[ line: 87 | named "makeTurnKey" ]]
	if p4.turnKey ~= nil then
		return p4.turnKey
	end
	local sessionId = p4.sessionId or (if p3 ~= nil then "pending-session" else p3.sessionId)
	local var25 = if p4.turnFeedbackIds == nil or typeof(p4.turnFeedbackIds) == "function" then nil else p4.turnFeedbackIds.sequenceId
	
	return if var25 == nil then sessionId else `{sessionId}:{var25}`
end

local function makeSegmentKey(p5, ...) --[[ line: 99 ]]
	local list = { p5 }
	
	for i, v in { ... } do
		table.insert(list, tostring(v))
	end
	return table.concat(list, ":")
end

local _ = function(p6) --[[ line: 107 | named "getSortedActivitySlotIndexes" ]]
	local t = {}
	
	for i in p6.activitySlots do
		table.insert(t, i)
	end
	table.sort(t)
	
	return t
end

local _ = function(p7, p8) --[[ line: 116 | named "makeTurnActivityItem" ]]
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

local _ = function(p9, p10, p11) --[[ line: 129 | named "makeAgentMessageSegment" ]]
	return if p10 == "" then nil else {
		kind = "agent_message",
		key = p9,
		text = p10,
		isError = p11
	}
end

local function makeCompletedActivitySummary(p12, p13) --[[ line: 141 ]]
	-- upvalues: getCompletedActivityLabel (ref), countToolCalls (ref)
	return if #p12 == 0 then nil else {
		kind = "activity_summary",
		summaryKind = "completed",
		isLoading = false,
		key = p13,
		label = getCompletedActivityLabel(p12),
		activityItems = p12,
		actionCount = countToolCalls(p12)
	}
end

local _ = function(p14, p15, p16, p17, p18) --[[ line: 157 | named "makeActiveActivitySummary" ]]
	-- upvalues: getActiveActivityLabel (ref)
	return if #p14 == 0 and not p15 then nil else {
		kind = "activity_summary",
		summaryKind = "active",
		key = p16,
		label = p17 or getActiveActivityLabel(p14, p15),
		activityItems = p14,
		isLoading = p15,
		isWaitingForLocalTool = p18
	}
end

local function countActionsInSegments(p19) --[[ line: 179 ]]
	-- upvalues: countToolCalls (ref)
	local var28 = 0
	
	for i, v in p19 do
		if v.kind == "activity_summary" then
			var28 += v.actionCount or countToolCalls(v.activityItems)
		end
	end
	return var28
end

local function getAnsweredPromptsByToolCallId(p20) --[[ line: 189 ]]
	-- upvalues: studioAskUserTool (ref)
	local t = {}
	
	for i, v in studioAskUserTool.getAnsweredPromptsFromTurnState(p20) do
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

local function getCompletedPlansByToolCallId(p21) --[[ line: 203 ]]
	-- upvalues: studioProposePlanTool (ref)
	local t = {}
	
	for i, v in studioProposePlanTool.getCompletedPlansFromTurnState(p21) do
		if v.toolCallId ~= nil then
			t[v.toolCallId] = v
		end
	end
	return t
end

local _ = function(p22, p23, p24, p25, p26, p27, p28) --[[ line: 213 | named "makeClientToolSegment" ]]
	-- upvalues: makeSegmentKey (ref)
	return {
		kind = "client_tool",
		key = makeSegmentKey(p22, "client-tool", p23, p25),
		toolCallId = p23,
		callOrder = p24,
		isActive = p26,
		answerStackPrompt = p27,
		planProposal = p28
	}
end

local function projectAskUserSegments(p29, p30, p31, p32, p33) --[[ line: 233 ]]
	-- upvalues: makeSegmentKey (ref), studioAskUserTool (ref)
	local var31 = p29.toolCalls[p31]
	
	if var31 == nil then
		return {}
	end
	local t = {}
	local var33 = p32[p31]
	
	if var33 == nil or #var33 <= 0 then
		local var34 = studioAskUserTool.extractQuestionsFromToolCall(var31)
		local var35 = p33.askUserByToolCallId[p31]
		
		if var34 == nil or var35 == nil then
			return t
		end
		for i, v in var34 do
			local var36 = var35.selections[i]
			
			if not (i == var35.currentIndex and not p33.submittedToolCallIds[p31]) then
				if var36 == nil then break end
				table.insert(t, {
					kind = "client_tool",
					isActive = false,
					planProposal = nil,
					key = makeSegmentKey(p30, "client-tool", p31, i),
					toolCallId = p31,
					callOrder = var35.callOrder,
					answerStackPrompt = {
						question = v,
						selectedOptionId = var36.selectedOptionId,
						customResponseText = var36.customResponseText,
						toolCallId = p31,
						callOrder = var35.callOrder,
						isLastQuestion = #var34 <= i
					}
				})
			end
			table.insert(t, {
				kind = "client_tool",
				isActive = true,
				planProposal = nil,
				key = makeSegmentKey(p30, "client-tool", p31, i),
				toolCallId = p31,
				callOrder = var35.callOrder,
				answerStackPrompt = {
					question = v,
					selectedOptionId = if var36 ~= nil then nil else var36.selectedOptionId,
					customResponseText = if var36 ~= nil then nil else var36.customResponseText,
					toolCallId = p31,
					callOrder = var35.callOrder,
					isLastQuestion = #var34 <= i
				}
			})
			
			return t
		end
		return t
	else
		for i, v in var33 do
			table.insert(t, {
				kind = "client_tool",
				isActive = false,
				planProposal = nil,
				key = makeSegmentKey(p30, "client-tool", p31, i),
				toolCallId = p31,
				callOrder = v.callOrder or i,
				answerStackPrompt = v
			})
		end
		return t
	end
end

local function projectPlanSegments(p34, p35, p36, p37, p38) --[[ line: 300 ]]
	-- upvalues: makeSegmentKey (ref), studioProposePlanTool (ref)
	local var37 = p34.toolCalls[p36]
	
	if var37 == nil then
		return {}
	end
	local var38 = p37[p36]
	
	if var38 ~= nil then
		return {
			{
				kind = "client_tool",
				isActive = false,
				answerStackPrompt = nil,
				key = makeSegmentKey(p35, "client-tool", p36, 1),
				toolCallId = p36,
				callOrder = var38.callOrder or 0,
				planProposal = var38
			}
		}
	end
	local var39 = p38.planByToolCallId[p36]
	local var40 = studioProposePlanTool.extractPlanFromToolCall(var37)
	
	return if var40 == nil or var39 == nil then {} else {
		{
			kind = "client_tool",
			answerStackPrompt = nil,
			key = makeSegmentKey(p35, "client-tool", p36, 1),
			toolCallId = p36,
			callOrder = var39.callOrder,
			isActive = var39.isAccepted ~= true and (var39.feedbackText == nil and not p38.submittedToolCallIds[p36]),
			planProposal = {
				title = var40.title,
				textContent = var40.textContent,
				summary = var40.summary,
				toolCallId = p36,
				callOrder = var39.callOrder,
				isAccepted = var39.isAccepted,
				feedbackText = var39.feedbackText
			}
		}
	}
end

local _ = function(p39, p40, p41, p42, p43, p44) --[[ line: 342 | named "projectLocalToolSegments" ]]
	-- upvalues: projectAskUserSegments (ref), projectPlanSegments (ref)
	local var41 = projectAskUserSegments(p39, p40, p41, p42, p44)
	
	return if #var41 > 0 then var41 else projectPlanSegments(p39, p40, p41, p43, p44)
end

local _ = function(p45, p46, p47) --[[ line: 358 | named "getActiveAskUserActivityLabel" ]]
	-- upvalues: studioAskUserTool (ref), getAskUserActivityLabel (ref)
	local var42 = p47.askUserByToolCallId[p46]
	local var43 = p45.toolCalls[p46]
	
	if var42 == nil or var43 == nil then
		return nil
	end
	local var44 = studioAskUserTool.extractQuestionsFromToolCall(var43)
	
	if var44 == nil then
		return nil
	end
	local currentIndex = var44[var42.currentIndex]
	
	return getAskUserActivityLabel(#var44, if currentIndex ~= nil then nil else #currentIndex.options)
end

local function projectWorkSegments(p48, p49, p50, p51) --[[ line: 379 ]]
	-- upvalues: getAnsweredPromptsByToolCallId (ref), getCompletedPlansByToolCallId (ref), makeSegmentKey (ref), getActiveActivityLabel (ref), makeCompletedActivitySummary (ref), projectAskUserSegments (ref), projectPlanSegments (ref), studioAskUserTool (ref), getAskUserActivityLabel (ref), contentBlocksToText (ref)
	local t = {}
	local t_1 = {}
	local var47 = nil
	local var48 = false
	local var49 = getAnsweredPromptsByToolCallId(p48)
	local var50 = getCompletedPlansByToolCallId(p48)
	
	local function flushActivity(p52, p53) --[[ line: 392 ]]
		-- upvalues: makeSegmentKey (copy), p49 (ref), t (ref), p51 (ref), t_1 (write), var47 (write), var48 (write), getActiveActivityLabel (copy), makeCompletedActivitySummary (copy)
		local var63
		local var62 = makeSegmentKey(p49, if p52 then "activity-trailing" else "activity", p53 or #t + 1)
		local _ = nil
		
		if p51 and p52 then
			local var64 = t_1
			local _ = #var64 == 0
			var63 = {
				kind = "activity_summary",
				summaryKind = "active",
				isLoading = true,
				key = var62,
				label = var47 or getActiveActivityLabel(var64, true),
				activityItems = var64,
				isWaitingForLocalTool = var48
			}
		else
			var63 = makeCompletedActivitySummary(t_1, var62)
		end
		if var63 ~= nil then
			table.insert(t, var63)
		end
		t_1 = {}
		var47 = nil
		var48 = false
	end
	
	local t_2 = {}
	
	for i in p48.activitySlots do
		table.insert(t_2, i)
	end
	table.sort(t_2)
	
	for i_1, v in t_2 do
		local var55 = p48.activitySlots[v]
		
		if var55.kind == "agent_message" then
			flushActivity(false, v)
			local text = var55.text
			local var56 = if text == "" then nil else {
				kind = "agent_message",
				isError = nil,
				key = makeSegmentKey(p49, "agent-message", v),
				text = text
			}
			
			if var56 ~= nil then
				table.insert(t, var56)
			end
		elseif var55.kind == "tool_call" then
			local t_4
			local toolCallId = var55.toolCallId
			local var57 = projectAskUserSegments(p48, p49, toolCallId, var49, p50)
			local var58 = if #var57 > 0 then var57 else projectPlanSegments(p48, p49, toolCallId, var50, p50)
			
			if #var58 > 0 then
				local v_1
				flushActivity(false, v)
				
				for i_2, v_1 in var58 do
					table.insert(t, v_1)
					
					if v_1.isActive then
						var48 = true
					end
				end
				if p51 then
					local t_3
					if var55.kind == "tool_call" then
						local toolCallId_1 = p48.toolCalls[var55.toolCallId]
						t_3 = {
							kind = "tool_call",
							toolCallId = var55.toolCallId,
							title = if toolCallId_1 then toolCallId_1.title else nil,
							status = if toolCallId_1 then toolCallId_1.status else nil
						}
					else
						t_3 = nil
					end
					if t_3 ~= nil then
						table.insert(t_1, t_3)
					end
					local toolCallId_1 = var55.toolCallId
					local var60 = p50.askUserByToolCallId[toolCallId_1]
					i_2 = p48.toolCalls[toolCallId_1]
					
					if var60 == nil or i_2 == nil then
						var47 = nil
					else
						v_1 = studioAskUserTool.extractQuestionsFromToolCall(i_2)
						
						if v_1 == nil then
							var47 = nil
						else
							local currentIndex = v_1[var60.currentIndex]
							var47 = getAskUserActivityLabel(#v_1, if currentIndex ~= nil then nil else #currentIndex.options)
						end
					end
				end
			elseif var55.kind == "tool_call" then
				local toolCallId_1 = p48.toolCalls[var55.toolCallId]
				t_4 = {
					kind = "tool_call",
					toolCallId = var55.toolCallId,
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
	local var53 = contentBlocksToText(p48.pendingAgentMessageContent)
	
	if var53 ~= "" then
		flushActivity(false, p48.pendingAgentMessageSequenceIndex)
		local var54 = if var53 == "" then nil else {
			kind = "agent_message",
			isError = nil,
			key = if p48.pendingAgentMessageSequenceIndex ~= nil then makeSegmentKey(p49, "pending-agent-message") else makeSegmentKey(p49, "agent-message", p48.pendingAgentMessageSequenceIndex),
			text = var53
		}
		
		if var54 ~= nil then
			table.insert(t, var54)
		end
	end
	flushActivity(true, nil)
	
	return t
end

local function makeTurnWorkSegment(p54, p55, p56, p57, p58, p59) --[[ line: 472 ]]
	-- upvalues: countActionsInSegments (ref), makeSegmentKey (ref), getTurnWorkedDurationLabel (ref)
	if #p55 == 0 then
		return nil
	end
	local var65 = countActionsInSegments(p55)
	
	return {
		kind = "turn_work",
		key = makeSegmentKey(p54, "work"),
		label = getTurnWorkedDurationLabel(p56, p57, p58, var65, p59),
		segments = p55,
		actionCount = var65
	}
end

local function addTerminalAssistantMessageSegments(a, b, p60) --[[ line: 499 ]]
	-- upvalues: getAssistantMessageTexts (ref), makeSegmentKey (ref)
	for i, v in getAssistantMessageTexts(b) do
		local var66 = if v == "" then nil else {
			kind = "agent_message",
			isError = nil,
			key = makeSegmentKey(p60, "terminal-agent-message", i),
			text = v
		}
		
		if var66 ~= nil then
			table.insert(a, var66)
		end
	end
end

local function projectTurnSegments(p61, p62, p63) --[[ line: 509 ]]
	-- upvalues: projectWorkSegments (ref), fFlagBuildExperienceExcludeUserWaitFromTurnDurationModule (ref), getLocalToolWaitSeconds (ref), makeTurnWorkSegment (ref), addTerminalAssistantMessageSegments (ref), makeSegmentKey (ref), turnDisplayModule (ref), ASSISTANT_STOPPED_TEXT (ref), publishToolUtils (ref)
	local turnKey
	if p62.turnKey == nil then
		local sessionId = p62.sessionId or (if p61 ~= nil then "pending-session" else p61.sessionId)
		local var68 = if p62.turnFeedbackIds == nil or typeof(p62.turnFeedbackIds) == "function" then nil else p62.turnFeedbackIds.sequenceId
		turnKey = if var68 ~= nil then sessionId else `{sessionId}:{var68}`
	else
		turnKey = p62.turnKey
	end
	local t = {}
	local var70 = makeTurnWorkSegment(turnKey, projectWorkSegments(p61, turnKey, p63, not p61.isDone), p61.eventMetaBySequenceId, p62.startSequenceId, p62.endSequenceId, if fFlagBuildExperienceExcludeUserWaitFromTurnDurationModule then getLocalToolWaitSeconds(p61) else nil)
	
	if var70 ~= nil then
		table.insert(t, var70)
	end
	addTerminalAssistantMessageSegments(t, p61, turnKey)
	
	if p61.status == "failed" or p61.stopReason == "error" then
		local var73 = turnDisplayModule.formatTurnFailureMessage(p61)
		local var74 = if var73 == "" then nil else {
			kind = "agent_message",
			isError = true,
			key = makeSegmentKey(turnKey, "failure"),
			text = var73
		}
		
		if var74 ~= nil then
			table.insert(t, var74)
		end
	elseif p61.status == "cancelled" or p61.stopReason == "cancelled" then
		local var71 = ASSISTANT_STOPPED_TEXT
		local var72 = if var71 == "" then nil else {
			kind = "agent_message",
			isError = nil,
			key = makeSegmentKey(turnKey, "cancelled"),
			text = var71
		}
		
		if var72 ~= nil then
			table.insert(t, var72)
		end
	end
	if p61.isDone and publishToolUtils.includesPublishPlaceTool(p61) then
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
	projectActiveTurnSegments = function(p64, p65) --[[ line: 584 ]]
		-- upvalues: projectTurnSegments (ref), t (ref)
		return projectTurnSegments(p64, p65 or {}, if p65 and p65.optimisticLocalTools then p65.optimisticLocalTools else t)
	end,
	projectLoadingTurnSegments = function(p66) --[[ line: 562 ]]
		-- upvalues: makeSegmentKey (ref), getActiveActivityLabel (ref), makeTurnWorkSegment (ref)
		local turnKey
		if p66 == nil then
			turnKey = "loading"
		elseif p66.turnKey == nil then
			local sessionId = p66.sessionId or "pending-session"
			local var76 = if p66.turnFeedbackIds == nil or typeof(p66.turnFeedbackIds) == "function" then nil else p66.turnFeedbackIds.sequenceId
			turnKey = if var76 ~= nil then sessionId else `{sessionId}:{var76}`
		else
			turnKey = p66.turnKey
		end
		local t = {}
		local _ = #t == 0
		local t_1 = {
			kind = "activity_summary",
			summaryKind = "active",
			isLoading = true,
			isWaitingForLocalTool = nil,
			key = makeSegmentKey(turnKey, "activity-trailing"),
			label = getActiveActivityLabel(t, true),
			activityItems = t
		}
		local t_2 = {}
		
		if t_1 ~= nil then
			table.insert(t_2, t_1)
		end
		local var80 = makeTurnWorkSegment(turnKey, t_2)
		
		return if var80 == nil then {} else { var80 }
	end,
	projectSetupErrorSegments = function(value, p67) --[[ line: 573 ]]
		-- upvalues: makeSegmentKey (ref)
		local turnKey
		if p67 == nil then
			turnKey = "setup-error"
		elseif p67.turnKey == nil then
			local sessionId = p67.sessionId or "pending-session"
			local var82 = if p67.turnFeedbackIds == nil or typeof(p67.turnFeedbackIds) == "function" then nil else p67.turnFeedbackIds.sequenceId
			turnKey = if var82 ~= nil then sessionId else `{sessionId}:{var82}`
		else
			turnKey = p67.turnKey
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