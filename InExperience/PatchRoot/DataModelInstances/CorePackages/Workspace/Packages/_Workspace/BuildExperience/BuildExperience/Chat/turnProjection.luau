local buildExperience = script:FindFirstAncestor("BuildExperience")
local creatorAgentChatModule = require(buildExperience.Parent.DataHydration.CreatorAgentChat)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local _ = require(script.Parent.chatTypes)
local turnDisplayModule = require(script.Parent.turnDisplay)
local fFlagBuildExperienceSinglePlaytestCardModule = require(buildExperience.Flags.FFlagBuildExperienceSinglePlaytestCard)
local fFlagBuildExperienceManageDevProductModule = require(buildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local fFlagBuildAgentAdCampaignCardModule = require(buildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local fFlagBuildExperienceShowThinkingAfterAskUserSubmitModule = require(buildExperience.Flags.FFlagBuildExperienceShowThinkingAfterAskUserSubmit)
local fFlagBuildExperienceExcludeUserWaitFromTurnDurationModule = require(buildExperience.Flags.FFlagBuildExperienceExcludeUserWaitFromTurnDuration)
local publishToolUtils = creatorAgentChatModule.PublishToolUtils
local var1 = if fFlagBuildAgentAdCampaignCardModule then require(buildExperience.Chat.adCampaignEligibilityTool) else nil
local studioAskUserTool = creatorAgentChatModule.StudioAskUserTool
local studioProposePlanTool = creatorAgentChatModule.StudioProposePlanTool
local ASSISTANT_STOPPED_TEXT = turnDisplayModule.ASSISTANT_STOPPED_TEXT
local countToolCalls = turnDisplayModule.countToolCalls
local getAskUserActivityLabel = turnDisplayModule.getAskUserActivityLabel
local getLocalToolWaitSeconds = turnDisplayModule.getLocalToolWaitSeconds
local getSummaryToolActivity = turnDisplayModule.getSummaryToolActivity
local t = {
	submittedToolCallIds = {},
	askUserByToolCallId = {},
	planByToolCallId = {},
	devProductByToolCallId = {}
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
		local var2 = p2.assistantMessages[v]
		
		if var2 ~= nil then
			local var3 = contentBlocksToText(var2)
			
			if var3 ~= "" then
				table.insert(t, var3)
			end
		end
	end
	return t
end

local function getFinalAssistantMessageText(p3)
	-- upvalues: getAssistantMessageTexts (ref)
	local var4 = getAssistantMessageTexts(p3)
	
	return var4[#var4]
end

local function _(p3, p4)
	if p4.turnKey ~= nil then
		return p4.turnKey
	end
	local sessionId = p4.sessionId or (if p3 ~= nil then "pending-session" else p3.sessionId)
	local var4 = if p4.turnFeedbackIds == nil or typeof(p4.turnFeedbackIds) == "function" then nil else p4.turnFeedbackIds.sequenceId
	
	return if var4 == nil then sessionId else `{sessionId}:{var4}`
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
	-- upvalues: getSummaryToolActivity (ref), countToolCalls (ref)
	return if #p5 == 0 then nil else {
		kind = "activity_summary",
		summaryKind = "completed",
		isLoading = false,
		key = p6,
		summaryToolActivity = getSummaryToolActivity(p5, "completed"),
		activityItems = p5,
		actionCount = countToolCalls(p5)
	}
end

local function makeActiveActivitySummary(p5, p6, p7, p8, p9)
	-- upvalues: getSummaryToolActivity (ref), localizationStringsModule (ref)
	if #p5 == 0 and not p6 then
		return nil
	end
	local _ = nil
	local var4 = if p8 == nil then getSummaryToolActivity(p5, "active") else nil
	local var5 = p8
	
	if var5 == nil and var4 == nil then
		var5 = localizationStringsModule.CHAT_ASSISTANT_LOADING
	end
	return {
		kind = "activity_summary",
		summaryKind = "active",
		key = p7,
		label = var5,
		summaryToolActivity = var4,
		activityItems = p5,
		isLoading = p6,
		isWaitingForLocalTool = p9
	}
end

local function countActionsInSegments(p5)
	-- upvalues: countToolCalls (ref)
	local var4 = 0
	
	for i, v in p5 do
		if v.kind == "activity_summary" then
			var4 += v.actionCount or countToolCalls(v.activityItems)
		end
	end
	return var4
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

local _ = function(p8, p9, p10, p11, p12, p13, p14, p15)
	-- upvalues: makeSegmentKey (ref)
	return {
		kind = "client_tool",
		key = makeSegmentKey(p8, "client-tool", p9, p11),
		toolCallId = p9,
		callOrder = p10,
		isActive = p12,
		answerStackPrompt = p13,
		planProposal = p14,
		devProductProposal = p15
	}
end

local function projectAskUserSegments(p8, p9, p10, p11, p12)
	-- upvalues: makeSegmentKey (ref), studioAskUserTool (ref)
	local var5 = p8.toolCalls[p10]
	
	if var5 == nil then
		return {}
	end
	local t = {}
	local var6 = p11[p10]
	
	if var6 == nil or #var6 <= 0 then
		local var7 = studioAskUserTool.extractQuestionsFromToolCall(var5)
		local var8 = p12.askUserByToolCallId[p10]
		
		if var7 == nil or var8 == nil then
			return t
		end
		for i, v in var7 do
			local var9 = var8.selections[i]
			
			if not (i == var8.currentIndex and not p12.submittedToolCallIds[p10]) then
				if var9 == nil then break end
				table.insert(t, {
					kind = "client_tool",
					isActive = false,
					planProposal = nil,
					devProductProposal = nil,
					key = makeSegmentKey(p9, "client-tool", p10, i),
					toolCallId = p10,
					callOrder = var8.callOrder,
					answerStackPrompt = {
						question = v,
						selectedOptionId = var9.selectedOptionId,
						customResponseText = var9.customResponseText,
						toolCallId = p10,
						callOrder = var8.callOrder,
						isLastQuestion = #var7 <= i
					}
				})
			end
			table.insert(t, {
				kind = "client_tool",
				isActive = true,
				planProposal = nil,
				devProductProposal = nil,
				key = makeSegmentKey(p9, "client-tool", p10, i),
				toolCallId = p10,
				callOrder = var8.callOrder,
				answerStackPrompt = {
					question = v,
					selectedOptionId = if var9 ~= nil then nil else var9.selectedOptionId,
					customResponseText = if var9 ~= nil then nil else var9.customResponseText,
					toolCallId = p10,
					callOrder = var8.callOrder,
					isLastQuestion = #var7 <= i
				}
			})
			
			return t
		end
		return t
	else
		for i, v in var6 do
			table.insert(t, {
				kind = "client_tool",
				isActive = false,
				planProposal = nil,
				devProductProposal = nil,
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
	local var10 = p13.toolCalls[p15]
	
	if var10 == nil then
		return {}
	end
	local var11 = p16[p15]
	
	if var11 ~= nil then
		return {
			{
				kind = "client_tool",
				isActive = false,
				answerStackPrompt = nil,
				devProductProposal = nil,
				key = makeSegmentKey(p14, "client-tool", p15, 1),
				toolCallId = p15,
				callOrder = var11.callOrder or 0,
				planProposal = var11
			}
		}
	end
	local var12 = p17.planByToolCallId[p15]
	local var13 = studioProposePlanTool.extractPlanFromToolCall(var10)
	
	return if var13 == nil or var12 == nil then {} else {
		{
			kind = "client_tool",
			answerStackPrompt = nil,
			devProductProposal = nil,
			key = makeSegmentKey(p14, "client-tool", p15, 1),
			toolCallId = p15,
			callOrder = var12.callOrder,
			isActive = var12.isAccepted ~= true and (var12.feedbackText == nil and not p17.submittedToolCallIds[p15]),
			planProposal = {
				title = var13.title,
				textContent = var13.textContent,
				summary = var13.summary,
				toolCallId = p15,
				callOrder = var12.callOrder,
				isAccepted = var12.isAccepted,
				feedbackText = var12.feedbackText
			}
		}
	}
end

local function projectDevProductSegments(p13, p14, p15, p16)
	-- upvalues: makeSegmentKey (ref)
	if p13.toolCalls[p15] == nil then
		return {}
	end
	local var10 = p16.devProductByToolCallId[p15]
	
	return if var10 == nil then {} else {
		{
			kind = "client_tool",
			answerStackPrompt = nil,
			planProposal = nil,
			key = makeSegmentKey(p14, "client-tool", p15, 1),
			toolCallId = p15,
			callOrder = var10.callOrder,
			isActive = var10.isApproved ~= true and (var10.isRejected ~= true and not p16.submittedToolCallIds[p15]),
			devProductProposal = var10
		}
	}
end

local function projectLocalToolSegments(p13, p14, p15, p16, p17, p18)
	-- upvalues: projectAskUserSegments (ref), projectPlanSegments (ref), fFlagBuildExperienceManageDevProductModule (ref), projectDevProductSegments (ref)
	local var10 = projectAskUserSegments(p13, p14, p15, p16, p18)
	
	if #var10 > 0 then
		return var10
	end
	local var11 = projectPlanSegments(p13, p14, p15, p17, p18)
	
	return if #var11 > 0 then var11 elseif fFlagBuildExperienceManageDevProductModule then projectDevProductSegments(p13, p14, p15, p18) else {}
end

local function getActiveAskUserActivityLabel(p13, p14, p15)
	-- upvalues: fFlagBuildExperienceShowThinkingAfterAskUserSubmitModule (ref), localizationStringsModule (ref), studioAskUserTool (ref), getAskUserActivityLabel (ref)
	local var10 = p15.askUserByToolCallId[p14]
	local var11 = p13.toolCalls[p14]
	
	if var10 == nil or var11 == nil then
		return nil
	elseif fFlagBuildExperienceShowThinkingAfterAskUserSubmitModule and p15.submittedToolCallIds[p14] then
		return localizationStringsModule.CHAT_ASSISTANT_LOADING
	end
	local var12 = studioAskUserTool.extractQuestionsFromToolCall(var11)
	
	if var12 == nil then
		return nil
	end
	local currentIndex = var12[var10.currentIndex]
	
	return getAskUserActivityLabel(#var12, if currentIndex ~= nil then nil else #currentIndex.options)
end

local function projectWorkSegments(p13, p14, p15, p16)
	-- upvalues: getAnsweredPromptsByToolCallId (ref), getCompletedPlansByToolCallId (ref), makeSegmentKey (ref), makeActiveActivitySummary (ref), makeCompletedActivitySummary (ref), projectLocalToolSegments (ref), getActiveAskUserActivityLabel (ref), contentBlocksToText (ref)
	local t = {}
	local t_1 = {}
	local var10 = nil
	local var11 = false
	local var12 = getAnsweredPromptsByToolCallId(p13)
	local var13 = getCompletedPlansByToolCallId(p13)
	
	local function flushActivity(p17, p18)
		-- upvalues: makeSegmentKey (copy), p14 (ref), t (ref), p16 (ref), makeActiveActivitySummary (copy), t_1 (write), var10 (write), var11 (write), makeCompletedActivitySummary (copy)
		local var14 = makeSegmentKey(p14, if p17 then "activity-trailing" else "activity", p18 or #t + 1)
		local _ = nil
		local var15 = if p16 and p17 then makeActiveActivitySummary(t_1, true, var14, var10, var11) else makeCompletedActivitySummary(t_1, var14)
		
		if var15 ~= nil then
			table.insert(t, var15)
		end
		t_1 = {}
		var10 = nil
		var11 = false
	end
	
	local t_2 = {}
	
	for i in p13.activitySlots do
		table.insert(t_2, i)
	end
	table.sort(t_2)
	
	for i_1, v in t_2 do
		local var14 = p13.activitySlots[v]
		
		if var14.kind == "agent_message" then
			flushActivity(false, v)
			local text = var14.text
			local var15 = if text == "" then nil else {
				kind = "agent_message",
				isError = nil,
				errorCode = nil,
				key = makeSegmentKey(p14, "agent-message", v),
				text = text
			}
			
			if var15 ~= nil then
				table.insert(t, var15)
			end
		elseif var14.kind == "tool_call" then
			local t_4
			local var16 = projectLocalToolSegments(p13, p14, var14.toolCallId, var12, var13, p15)
			
			if #var16 > 0 then
				flushActivity(false, v)
				
				for i_2, v_1 in var16 do
					table.insert(t, v_1)
					
					if v_1.isActive then
						var11 = true
					end
				end
				if p16 then
					local t_3
					if var14.kind == "tool_call" then
						local toolCallId = p13.toolCalls[var14.toolCallId]
						t_3 = {
							kind = "tool_call",
							toolCallId = var14.toolCallId,
							title = if toolCallId then toolCallId.title else nil,
							status = if toolCallId then toolCallId.status else nil
						}
					else
						t_3 = nil
					end
					if t_3 ~= nil then
						table.insert(t_1, t_3)
					end
					var10 = getActiveAskUserActivityLabel(p13, var14.toolCallId, p15)
				end
			elseif var14.kind == "tool_call" then
				local toolCallId = p13.toolCalls[var14.toolCallId]
				t_4 = {
					kind = "tool_call",
					toolCallId = var14.toolCallId,
					title = if toolCallId then toolCallId.title else nil,
					status = if toolCallId then toolCallId.status else nil
				}
			else
				t_4 = nil
			end
			if t_4 ~= nil then
				table.insert(t_1, t_4)
			end
		end
	end
	local var17 = contentBlocksToText(p13.pendingAgentMessageContent)
	
	if var17 ~= "" then
		flushActivity(false, p13.pendingAgentMessageSequenceIndex)
		local var18 = if var17 == "" then nil else {
			kind = "agent_message",
			isError = nil,
			errorCode = nil,
			key = if p13.pendingAgentMessageSequenceIndex ~= nil then makeSegmentKey(p14, "pending-agent-message") else makeSegmentKey(p14, "agent-message", p13.pendingAgentMessageSequenceIndex),
			text = var17
		}
		
		if var18 ~= nil then
			table.insert(t, var18)
		end
	end
	flushActivity(true, nil)
	
	return t
end

local function makeTurnWorkSegment(p17, p18, p19, p20, p21, p22)
	-- upvalues: countActionsInSegments (ref), localizationStringsModule (ref), makeSegmentKey (ref)
	if #p18 == 0 then
		return nil
	end
	local var19 = countActionsInSegments(p18)
	local CHAT_TURN_ACTIVITY = nil
	local var20 = nil
	
	if p19 ~= nil and p20 ~= nil and p21 ~= nil then
		local var21 = p19[p20]
		local var22 = p19[p21]
		local var23 = if var21 ~= nil then nil else var21.emittedTime
		local var24 = if var22 ~= nil then nil else var22.emittedTime
		local var25 = if var23 == nil or var23 == "" then nil else DateTime.fromIsoDate(var23)
		local var26 = if var24 == nil or var24 == "" then nil else DateTime.fromIsoDate(var24)
		
		if var25 ~= nil and var26 ~= nil then
			local var27 = (var26.UnixTimestampMillis - var25.UnixTimestampMillis) / 1000
			var20 = if p22 ~= nil then var27 else math.max(0, var27 - p22)
		end
	end
	if var20 == nil and var19 == 0 then
		CHAT_TURN_ACTIVITY = localizationStringsModule.CHAT_TURN_ACTIVITY
	end
	return {
		kind = "turn_work",
		key = makeSegmentKey(p17, "work"),
		label = CHAT_TURN_ACTIVITY,
		segments = p18,
		actionCount = var19,
		workedDurationSeconds = var20
	}
end

local function addTerminalAssistantMessageSegments(a, b, p17)
	-- upvalues: getAssistantMessageTexts (ref), makeSegmentKey (ref)
	for i, v in getAssistantMessageTexts(b) do
		local var19 = if v == "" then nil else {
			kind = "agent_message",
			isError = nil,
			errorCode = nil,
			key = makeSegmentKey(p17, "terminal-agent-message", i),
			text = v
		}
		
		if var19 ~= nil then
			table.insert(a, var19)
		end
	end
end

local function addAgentAdCampaignCardSegments(p18, p19, p20)
	-- upvalues: var1 (ref), makeSegmentKey (ref)
	local t = {}
	local t_1 = {}
	
	for i in p19.activitySlots do
		table.insert(t_1, i)
	end
	table.sort(t_1)
	
	for i_1, v in t_1 do
		local var20 = p19.activitySlots[v]
		
		if var20.kind == "tool_call" then
			local toolCallId = p19.toolCalls[var20.toolCallId]
			
			if var1.isCompletedEligibilityToolCall(toolCallId) and not t[toolCallId.toolCallId] then
				t[toolCallId.toolCallId] = true
				local var21 = var1.decodeCompletedEligibility(toolCallId)
				local cardOffers = var1.getCardOffers(var21)
				table.insert(p18, {
					kind = "agent_ad_campaign_card",
					key = makeSegmentKey(p20, "ad-campaign", toolCallId.toolCallId),
					toolCallId = toolCallId.toolCallId,
					availableCreditsSnapshot = if var21 ~= nil then 0 else var21.freeCreditsRemaining,
					offers = cardOffers,
					shouldCheckCampaignStatus = if var21 ~= nil then cardOffers ~= nil else true
				})
			end
		end
	end
end

local function projectTurnSegments(p21, p22, p23)
	-- upvalues: projectWorkSegments (ref), fFlagBuildExperienceExcludeUserWaitFromTurnDurationModule (ref), getLocalToolWaitSeconds (ref), makeTurnWorkSegment (ref), addTerminalAssistantMessageSegments (ref), fFlagBuildAgentAdCampaignCardModule (ref), addAgentAdCampaignCardSegments (ref), localizationStringsModule (ref), makeSegmentKey (ref), ASSISTANT_STOPPED_TEXT (ref), publishToolUtils (ref), fFlagBuildExperienceSinglePlaytestCardModule (ref)
	local turnKey
	if p22.turnKey == nil then
		local sessionId = p22.sessionId or (if p21 ~= nil then "pending-session" else p21.sessionId)
		local var22 = if p22.turnFeedbackIds == nil or typeof(p22.turnFeedbackIds) == "function" then nil else p22.turnFeedbackIds.sequenceId
		turnKey = if var22 ~= nil then sessionId else `{sessionId}:{var22}`
	else
		turnKey = p22.turnKey
	end
	local t = {}
	local var23 = makeTurnWorkSegment(turnKey, projectWorkSegments(p21, turnKey, p23, not p21.isDone), p21.eventMetaBySequenceId, p22.startSequenceId, p22.endSequenceId, if fFlagBuildExperienceExcludeUserWaitFromTurnDurationModule then getLocalToolWaitSeconds(p21) else nil)
	
	if var23 ~= nil then
		table.insert(t, var23)
	end
	addTerminalAssistantMessageSegments(t, p21, turnKey)
	
	if fFlagBuildAgentAdCampaignCardModule then
		addAgentAdCampaignCardSegments(t, p21, turnKey)
	end
	if p21.status == "failed" or p21.stopReason == "error" then
		local CHAT_ASSISTANT_RESPONSE_FAILED = localizationStringsModule.CHAT_ASSISTANT_RESPONSE_FAILED
		local var24 = if CHAT_ASSISTANT_RESPONSE_FAILED == "" then nil else {
			kind = "agent_message",
			isError = true,
			key = makeSegmentKey(turnKey, "failure"),
			text = CHAT_ASSISTANT_RESPONSE_FAILED,
			errorCode = p21.errorCode
		}
		
		if var24 ~= nil then
			table.insert(t, var24)
		end
	elseif p21.status == "cancelled" or p21.stopReason == "cancelled" then
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
	if p21.isDone and publishToolUtils.includesPublishPlaceTool(p21) and (not fFlagBuildExperienceSinglePlaytestCardModule or p22.showPlaytestCta == true) then
		table.insert(t, {
			kind = "playtest_cta",
			key = makeSegmentKey(turnKey, "playtest-cta")
		})
	end
	return t
end

return {
	getFinalAssistantMessageText = getFinalAssistantMessageText,
	projectActiveTurnSegments = function(p21, p22)
		-- upvalues: projectTurnSegments (ref), t (ref)
		return projectTurnSegments(p21, p22 or {}, if p22 and p22.optimisticLocalTools then p22.optimisticLocalTools else t)
	end,
	projectLoadingTurnSegments = function(p21)
		-- upvalues: makeActiveActivitySummary (ref), makeSegmentKey (ref), countActionsInSegments (ref), localizationStringsModule (ref)
		local turnKey
		if p21 == nil then
			turnKey = "loading"
		elseif p21.turnKey == nil then
			local sessionId = p21.sessionId or "pending-session"
			local var22 = if p21.turnFeedbackIds == nil or typeof(p21.turnFeedbackIds) == "function" then nil else p21.turnFeedbackIds.sequenceId
			turnKey = if var22 ~= nil then sessionId else `{sessionId}:{var22}`
		else
			turnKey = p21.turnKey
		end
		local t_1
		local var23 = makeActiveActivitySummary({}, true, makeSegmentKey(turnKey, "activity-trailing"), nil)
		local t = {}
		
		if var23 ~= nil then
			table.insert(t, var23)
		end
		if #t == 0 then
			t_1 = nil
		else
			local var24 = countActionsInSegments(t)
			local CHAT_TURN_ACTIVITY = nil
			local var25 = nil
			
			if var25 == nil and var24 == 0 then
				CHAT_TURN_ACTIVITY = localizationStringsModule.CHAT_TURN_ACTIVITY
			end
			t_1 = {
				kind = "turn_work",
				key = makeSegmentKey(turnKey, "work"),
				label = CHAT_TURN_ACTIVITY,
				segments = t,
				actionCount = var24,
				workedDurationSeconds = var25
			}
		end
		return if t_1 == nil then {} else { t_1 }
	end,
	projectSetupErrorSegments = function(value, p21)
		-- upvalues: makeSegmentKey (ref)
		local turnKey
		if p21 == nil then
			turnKey = "setup-error"
		elseif p21.turnKey == nil then
			local sessionId = p21.sessionId or "pending-session"
			local var22 = if p21.turnFeedbackIds == nil or typeof(p21.turnFeedbackIds) == "function" then nil else p21.turnFeedbackIds.sequenceId
			turnKey = if var22 ~= nil then sessionId else `{sessionId}:{var22}`
		else
			turnKey = p21.turnKey
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