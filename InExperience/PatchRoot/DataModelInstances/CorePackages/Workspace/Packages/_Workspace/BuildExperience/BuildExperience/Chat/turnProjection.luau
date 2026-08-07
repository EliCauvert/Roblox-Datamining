local creatorAgentChatModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)
local _ = require(script.Parent.chatTypes)
local turnDisplayModule = require(script.Parent.turnDisplay)
local publishToolUtils = creatorAgentChatModule.PublishToolUtils
local studioAskUserTool = creatorAgentChatModule.StudioAskUserTool
local studioProposePlanTool = creatorAgentChatModule.StudioProposePlanTool
local ASSISTANT_STOPPED_TEXT = turnDisplayModule.ASSISTANT_STOPPED_TEXT
local countToolCalls = turnDisplayModule.countToolCalls
local formatStepCount = turnDisplayModule.formatStepCount
local getActiveActivityLabel = turnDisplayModule.getActiveActivityLabel
local getAskUserActivityLabel = turnDisplayModule.getAskUserActivityLabel
local getCompletedActivityLabel = turnDisplayModule.getCompletedActivityLabel
local getTurnWorkedDurationLabel = turnDisplayModule.getTurnWorkedDurationLabel
local t = {
	submittedToolCallIds = {},
	askUserByToolCallId = {},
	planByToolCallId = {}
}

local function contentBlocksToText(p0) --[[ line: 54 ]]
	local t = {}
	
	for i, v in p0 do
		if v.type == "text" and typeof(v.text) == "string" then
			table.insert(t, v.text)
		end
	end
	return table.concat(t)
end

local function getAssistantMessageTexts(p1) --[[ line: 64 ]]
	-- upvalues: contentBlocksToText (ref)
	local t = {}
	
	for i, v in p1.assistantMessageOrder do
		local var18 = p1.assistantMessages[v]
		
		if var18 ~= nil then
			local var19 = contentBlocksToText(var18)
			
			if var19 ~= "" then
				table.insert(t, var19)
			end
		end
	end
	return t
end

local function _(p2, p3) --[[ line: 78 | named "makeTurnKey" ]]
	if p3.turnKey ~= nil then
		return p3.turnKey
	end
	local sessionId = p3.sessionId or (if p2 ~= nil then "pending-session" else p2.sessionId)
	local var21 = if p3.turnFeedbackIds == nil or typeof(p3.turnFeedbackIds) == "function" then nil else p3.turnFeedbackIds.sequenceId
	
	return if var21 == nil then sessionId else `{sessionId}:{var21}`
end

local function makeSegmentKey(p4, ...) --[[ line: 90 ]]
	local list = { p4 }
	
	for i, v in { ... } do
		table.insert(list, tostring(v))
	end
	return table.concat(list, ":")
end

local _ = function(p5) --[[ line: 98 | named "getSortedActivitySlotIndexes" ]]
	local t = {}
	
	for i in p5.activitySlots do
		table.insert(t, i)
	end
	table.sort(t)
	
	return t
end

local _ = function(p6, p7) --[[ line: 107 | named "makeTurnActivityItem" ]]
	if p7.kind == "tool_call" then
		local toolCallId = p6.toolCalls[p7.toolCallId]
		
		return {
			kind = "tool_call",
			toolCallId = p7.toolCallId,
			title = if toolCallId then toolCallId.title else nil,
			status = if toolCallId then toolCallId.status else nil
		}
	end
	return nil
end

local _ = function(p8, p9, p10) --[[ line: 120 | named "makeAgentMessageSegment" ]]
	return if p9 == "" then nil else {
		kind = "agent_message",
		key = p8,
		text = p9,
		isError = p10
	}
end

local function makeCompletedActivitySummary(p11, p12) --[[ line: 132 ]]
	-- upvalues: getCompletedActivityLabel (ref), countToolCalls (ref)
	return if #p11 == 0 then nil else {
		kind = "activity_summary",
		summaryKind = "completed",
		isLoading = false,
		key = p12,
		label = getCompletedActivityLabel(p11),
		activityItems = p11,
		actionCount = countToolCalls(p11)
	}
end

local _ = function(p13, p14, p15, p16, p17) --[[ line: 148 | named "makeActiveActivitySummary" ]]
	-- upvalues: getActiveActivityLabel (ref)
	return if #p13 == 0 and not p14 then nil else {
		kind = "activity_summary",
		summaryKind = "active",
		key = p15,
		label = p16 or getActiveActivityLabel(p13, p14),
		activityItems = p13,
		isLoading = p14,
		isWaitingForLocalTool = p17
	}
end

local function countActionsInSegments(p18) --[[ line: 170 ]]
	-- upvalues: countToolCalls (ref)
	local var24 = 0
	
	for i, v in p18 do
		if v.kind == "activity_summary" then
			var24 += v.actionCount or countToolCalls(v.activityItems)
		end
	end
	return var24
end

local function getAnsweredPromptsByToolCallId(p19) --[[ line: 180 ]]
	-- upvalues: studioAskUserTool (ref)
	local t = {}
	
	for i, v in studioAskUserTool.getAnsweredPromptsFromTurnState(p19) do
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

local function getCompletedPlansByToolCallId(p20) --[[ line: 194 ]]
	-- upvalues: studioProposePlanTool (ref)
	local t = {}
	
	for i, v in studioProposePlanTool.getCompletedPlansFromTurnState(p20) do
		if v.toolCallId ~= nil then
			t[v.toolCallId] = v
		end
	end
	return t
end

local _ = function(p21, p22, p23, p24, p25, p26, p27) --[[ line: 204 | named "makeClientToolSegment" ]]
	-- upvalues: makeSegmentKey (ref)
	return {
		kind = "client_tool",
		key = makeSegmentKey(p21, "client-tool", p22, p24),
		toolCallId = p22,
		callOrder = p23,
		isActive = p25,
		answerStackPrompt = p26,
		planProposal = p27
	}
end

local function projectAskUserSegments(p28, p29, p30, p31, p32) --[[ line: 224 ]]
	-- upvalues: makeSegmentKey (ref), studioAskUserTool (ref)
	local var27 = p28.toolCalls[p30]
	
	if var27 == nil then
		return {}
	end
	local t = {}
	local var29 = p31[p30]
	
	if var29 == nil or #var29 <= 0 then
		local var30 = studioAskUserTool.extractQuestionsFromToolCall(var27)
		local var31 = p32.askUserByToolCallId[p30]
		
		if var30 == nil or var31 == nil then
			return t
		end
		for i, v in var30 do
			local var32 = var31.selections[i]
			
			if not (i == var31.currentIndex and not p32.submittedToolCallIds[p30]) then
				if var32 == nil then break end
				table.insert(t, {
					kind = "client_tool",
					isActive = false,
					planProposal = nil,
					key = makeSegmentKey(p29, "client-tool", p30, i),
					toolCallId = p30,
					callOrder = var31.callOrder,
					answerStackPrompt = {
						question = v,
						selectedOptionId = var32.selectedOptionId,
						customResponseText = var32.customResponseText,
						toolCallId = p30,
						callOrder = var31.callOrder,
						isLastQuestion = #var30 <= i
					}
				})
			end
			table.insert(t, {
				kind = "client_tool",
				isActive = true,
				planProposal = nil,
				key = makeSegmentKey(p29, "client-tool", p30, i),
				toolCallId = p30,
				callOrder = var31.callOrder,
				answerStackPrompt = {
					question = v,
					selectedOptionId = if var32 ~= nil then nil else var32.selectedOptionId,
					customResponseText = if var32 ~= nil then nil else var32.customResponseText,
					toolCallId = p30,
					callOrder = var31.callOrder,
					isLastQuestion = #var30 <= i
				}
			})
			
			return t
		end
		return t
	else
		for i, v in var29 do
			table.insert(t, {
				kind = "client_tool",
				isActive = false,
				planProposal = nil,
				key = makeSegmentKey(p29, "client-tool", p30, i),
				toolCallId = p30,
				callOrder = v.callOrder or i,
				answerStackPrompt = v
			})
		end
		return t
	end
end

local function projectPlanSegments(p33, p34, p35, p36, p37) --[[ line: 291 ]]
	-- upvalues: makeSegmentKey (ref), studioProposePlanTool (ref)
	local var33 = p33.toolCalls[p35]
	
	if var33 == nil then
		return {}
	end
	local var34 = p36[p35]
	
	if var34 ~= nil then
		return {
			{
				kind = "client_tool",
				isActive = false,
				answerStackPrompt = nil,
				key = makeSegmentKey(p34, "client-tool", p35, 1),
				toolCallId = p35,
				callOrder = var34.callOrder or 0,
				planProposal = var34
			}
		}
	end
	local var35 = p37.planByToolCallId[p35]
	local var36 = studioProposePlanTool.extractPlanFromToolCall(var33)
	
	return if var36 == nil or var35 == nil then {} else {
		{
			kind = "client_tool",
			answerStackPrompt = nil,
			key = makeSegmentKey(p34, "client-tool", p35, 1),
			toolCallId = p35,
			callOrder = var35.callOrder,
			isActive = var35.isAccepted ~= true and (var35.feedbackText == nil and not p37.submittedToolCallIds[p35]),
			planProposal = {
				title = var36.title,
				textContent = var36.textContent,
				summary = var36.summary,
				toolCallId = p35,
				callOrder = var35.callOrder,
				isAccepted = var35.isAccepted,
				feedbackText = var35.feedbackText
			}
		}
	}
end

local _ = function(p38, p39, p40, p41, p42, p43) --[[ line: 333 | named "projectLocalToolSegments" ]]
	-- upvalues: projectAskUserSegments (ref), projectPlanSegments (ref)
	local var37 = projectAskUserSegments(p38, p39, p40, p41, p43)
	
	return if #var37 > 0 then var37 else projectPlanSegments(p38, p39, p40, p42, p43)
end

local _ = function(p44, p45, p46) --[[ line: 349 | named "getActiveAskUserActivityLabel" ]]
	-- upvalues: studioAskUserTool (ref), getAskUserActivityLabel (ref)
	local var38 = p46.askUserByToolCallId[p45]
	local var39 = p44.toolCalls[p45]
	
	if var38 == nil or var39 == nil then
		return nil
	end
	local var40 = studioAskUserTool.extractQuestionsFromToolCall(var39)
	
	if var40 == nil then
		return nil
	end
	local currentIndex = var40[var38.currentIndex]
	
	return getAskUserActivityLabel(#var40, if currentIndex ~= nil then nil else #currentIndex.options)
end

local function projectWorkSegments(p47, p48, p49, p50) --[[ line: 370 ]]
	-- upvalues: getAnsweredPromptsByToolCallId (ref), getCompletedPlansByToolCallId (ref), makeSegmentKey (ref), getActiveActivityLabel (ref), makeCompletedActivitySummary (ref), projectAskUserSegments (ref), projectPlanSegments (ref), studioAskUserTool (ref), getAskUserActivityLabel (ref), contentBlocksToText (ref)
	local t = {}
	local t_1 = {}
	local var43 = nil
	local var44 = false
	local var45 = getAnsweredPromptsByToolCallId(p47)
	local var46 = getCompletedPlansByToolCallId(p47)
	
	local function flushActivity(p51, p52) --[[ line: 383 ]]
		-- upvalues: makeSegmentKey (copy), p48 (ref), t (ref), p50 (ref), t_1 (write), var43 (write), var44 (write), getActiveActivityLabel (copy), makeCompletedActivitySummary (copy)
		local var59
		local var58 = makeSegmentKey(p48, if p51 then "activity-trailing" else "activity", p52 or #t + 1)
		local _ = nil
		
		if p50 and p51 then
			local var60 = t_1
			local _ = #var60 == 0
			var59 = {
				kind = "activity_summary",
				summaryKind = "active",
				isLoading = true,
				key = var58,
				label = var43 or getActiveActivityLabel(var60, true),
				activityItems = var60,
				isWaitingForLocalTool = var44
			}
		else
			var59 = makeCompletedActivitySummary(t_1, var58)
		end
		if var59 ~= nil then
			table.insert(t, var59)
		end
		t_1 = {}
		var43 = nil
		var44 = false
	end
	
	local t_2 = {}
	
	for i in p47.activitySlots do
		table.insert(t_2, i)
	end
	table.sort(t_2)
	
	for i_1, v in t_2 do
		local var51 = p47.activitySlots[v]
		
		if var51.kind == "agent_message" then
			flushActivity(false, v)
			local text = var51.text
			local var52 = if text == "" then nil else {
				kind = "agent_message",
				isError = nil,
				key = makeSegmentKey(p48, "agent-message", v),
				text = text
			}
			
			if var52 ~= nil then
				table.insert(t, var52)
			end
		elseif var51.kind == "tool_call" then
			local t_4
			local toolCallId = var51.toolCallId
			local var53 = projectAskUserSegments(p47, p48, toolCallId, var45, p49)
			local var54 = if #var53 > 0 then var53 else projectPlanSegments(p47, p48, toolCallId, var46, p49)
			
			if #var54 > 0 then
				local v_1
				flushActivity(false, v)
				
				for i_2, v_1 in var54 do
					table.insert(t, v_1)
					
					if v_1.isActive then
						var44 = true
					end
				end
				if p50 then
					local t_3
					if var51.kind == "tool_call" then
						local toolCallId_1 = p47.toolCalls[var51.toolCallId]
						t_3 = {
							kind = "tool_call",
							toolCallId = var51.toolCallId,
							title = if toolCallId_1 then toolCallId_1.title else nil,
							status = if toolCallId_1 then toolCallId_1.status else nil
						}
					else
						t_3 = nil
					end
					if t_3 ~= nil then
						table.insert(t_1, t_3)
					end
					local toolCallId_1 = var51.toolCallId
					local var56 = p49.askUserByToolCallId[toolCallId_1]
					i_2 = p47.toolCalls[toolCallId_1]
					
					if var56 == nil or i_2 == nil then
						var43 = nil
					else
						v_1 = studioAskUserTool.extractQuestionsFromToolCall(i_2)
						
						if v_1 == nil then
							var43 = nil
						else
							local currentIndex = v_1[var56.currentIndex]
							var43 = getAskUserActivityLabel(#v_1, if currentIndex ~= nil then nil else #currentIndex.options)
						end
					end
				end
			elseif var51.kind == "tool_call" then
				local toolCallId_1 = p47.toolCalls[var51.toolCallId]
				t_4 = {
					kind = "tool_call",
					toolCallId = var51.toolCallId,
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
	local var49 = contentBlocksToText(p47.pendingAgentMessageContent)
	
	if var49 ~= "" then
		flushActivity(false, p47.pendingAgentMessageSequenceIndex)
		local var50 = if var49 == "" then nil else {
			kind = "agent_message",
			isError = nil,
			key = if p47.pendingAgentMessageSequenceIndex ~= nil then makeSegmentKey(p48, "pending-agent-message") else makeSegmentKey(p48, "agent-message", p47.pendingAgentMessageSequenceIndex),
			text = var49
		}
		
		if var50 ~= nil then
			table.insert(t, var50)
		end
	end
	flushActivity(true, nil)
	
	return t
end

local function makeTurnWorkSegment(p53, p54, p55, p56, p57) --[[ line: 463 ]]
	-- upvalues: countActionsInSegments (ref), makeSegmentKey (ref), getTurnWorkedDurationLabel (ref)
	if #p54 == 0 then
		return nil
	end
	local var61 = countActionsInSegments(p54)
	
	return {
		kind = "turn_work",
		key = makeSegmentKey(p53, "work"),
		label = getTurnWorkedDurationLabel(p55, p56, p57, var61),
		segments = p54,
		actionCount = var61
	}
end

local function addTerminalAssistantMessageSegments(a, b, p58) --[[ line: 483 ]]
	-- upvalues: getAssistantMessageTexts (ref), makeSegmentKey (ref)
	for i, v in getAssistantMessageTexts(b) do
		local var62 = if v == "" then nil else {
			kind = "agent_message",
			isError = nil,
			key = makeSegmentKey(p58, "terminal-agent-message", i),
			text = v
		}
		
		if var62 ~= nil then
			table.insert(a, var62)
		end
	end
end

local function projectTurnSegments(p59, p60, p61) --[[ line: 493 ]]
	-- upvalues: projectWorkSegments (ref), makeTurnWorkSegment (ref), addTerminalAssistantMessageSegments (ref), makeSegmentKey (ref), turnDisplayModule (ref), ASSISTANT_STOPPED_TEXT (ref), publishToolUtils (ref)
	local turnKey
	if p60.turnKey == nil then
		local sessionId = p60.sessionId or (if p59 ~= nil then "pending-session" else p59.sessionId)
		local var64 = if p60.turnFeedbackIds == nil or typeof(p60.turnFeedbackIds) == "function" then nil else p60.turnFeedbackIds.sequenceId
		turnKey = if var64 ~= nil then sessionId else `{sessionId}:{var64}`
	else
		turnKey = p60.turnKey
	end
	local t = {}
	local var66 = makeTurnWorkSegment(turnKey, projectWorkSegments(p59, turnKey, p61, not p59.isDone), p59.eventMetaBySequenceId, p60.startSequenceId, p60.endSequenceId)
	
	if var66 ~= nil then
		table.insert(t, var66)
	end
	addTerminalAssistantMessageSegments(t, p59, turnKey)
	
	if p59.status == "failed" or p59.stopReason == "error" then
		local var69 = turnDisplayModule.formatTurnFailureMessage(p59)
		local var70 = if var69 == "" then nil else {
			kind = "agent_message",
			isError = true,
			key = makeSegmentKey(turnKey, "failure"),
			text = var69
		}
		
		if var70 ~= nil then
			table.insert(t, var70)
		end
	elseif p59.status == "cancelled" or p59.stopReason == "cancelled" then
		local var67 = ASSISTANT_STOPPED_TEXT
		local var68 = if var67 == "" then nil else {
			kind = "agent_message",
			isError = nil,
			key = makeSegmentKey(turnKey, "cancelled"),
			text = var67
		}
		
		if var68 ~= nil then
			table.insert(t, var68)
		end
	end
	if p59.isDone and publishToolUtils.includesPublishPlaceTool(p59) then
		table.insert(t, {
			kind = "playtest_cta",
			key = makeSegmentKey(turnKey, "playtest-cta")
		})
	end
	return t
end

return {
	formatStepCount = formatStepCount,
	projectActiveTurnSegments = function(p62, p63) --[[ line: 564 ]]
		-- upvalues: projectTurnSegments (ref), t (ref)
		return projectTurnSegments(p62, p63 or {}, if p63 and p63.optimisticLocalTools then p63.optimisticLocalTools else t)
	end,
	projectLoadingTurnSegments = function(p64) --[[ line: 542 ]]
		-- upvalues: makeSegmentKey (ref), getActiveActivityLabel (ref), makeTurnWorkSegment (ref)
		local turnKey
		if p64 == nil then
			turnKey = "loading"
		elseif p64.turnKey == nil then
			local sessionId = p64.sessionId or "pending-session"
			local var72 = if p64.turnFeedbackIds == nil or typeof(p64.turnFeedbackIds) == "function" then nil else p64.turnFeedbackIds.sequenceId
			turnKey = if var72 ~= nil then sessionId else `{sessionId}:{var72}`
		else
			turnKey = p64.turnKey
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
		local var76 = makeTurnWorkSegment(turnKey, t_2)
		
		return if var76 == nil then {} else { var76 }
	end,
	projectSetupErrorSegments = function(value, p65) --[[ line: 553 ]]
		-- upvalues: makeSegmentKey (ref)
		local turnKey
		if p65 == nil then
			turnKey = "setup-error"
		elseif p65.turnKey == nil then
			local sessionId = p65.sessionId or "pending-session"
			local var78 = if p65.turnFeedbackIds == nil or typeof(p65.turnFeedbackIds) == "function" then nil else p65.turnFeedbackIds.sequenceId
			turnKey = if var78 ~= nil then sessionId else `{sessionId}:{var78}`
		else
			turnKey = p65.turnKey
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