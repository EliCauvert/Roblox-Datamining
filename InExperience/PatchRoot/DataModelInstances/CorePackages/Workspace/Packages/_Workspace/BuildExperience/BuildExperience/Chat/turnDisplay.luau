local buildExperience = script:FindFirstAncestor("BuildExperience")
local creatorAgentChatModule = require(buildExperience.Parent.DataHydration.CreatorAgentChat)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local subagentTasks = creatorAgentChatModule.SubagentTasks
local studioAskUserTool = creatorAgentChatModule.StudioAskUserTool
local studioProposePlanTool = creatorAgentChatModule.StudioProposePlanTool

local function formatTurnFailureMessage(p0) --[[ line: 21 ]]
	-- upvalues: localizationStringsModule (ref)
	return localizationStringsModule.formatChatTurnFailureMessage(p0.error or localizationStringsModule.CHAT_ASSISTANT_RESPONSE_FAILED, p0.errorCode)
end

local function _(p1) --[[ line: 26 | named "normalizeToolTitle" ]]
	return string.lower(string.gsub(p1, "[_%-%s]", ""))
end

local _ = function(p2) --[[ line: 30 | named "isManageTasksToolTitle" ]]
	-- upvalues: subagentTasks (ref)
	return typeof(p2) == "string" and string.lower(string.gsub(p2, "[_%-%s]", "")) == string.lower(string.gsub(subagentTasks.TOOL_NAME, "[_%-%s]", ""))
end

local function formatStepCount(p3) --[[ line: 35 ]]
	-- upvalues: localizationStringsModule (ref)
	return localizationStringsModule.formatChatTaskCount(p3)
end

local function formatWorkedDuration(p4) --[[ line: 41 ]]
	-- upvalues: localizationStringsModule (ref)
	return localizationStringsModule.formatChatWorkedDuration(p4)
end

local _ = function(p5) --[[ line: 45 | named "parseEmittedTimeMillis" ]]
	if typeof(p5) ~= "string" or p5 == "" then
		return nil
	end
	local dateTime = DateTime.fromIsoDate(p5)
	
	return if dateTime == nil then nil else dateTime.UnixTimestampMillis
end

local _ = function(p6) --[[ line: 53 | named "toolCallIsLocalPrompt" ]]
	-- upvalues: studioProposePlanTool (ref), studioAskUserTool (ref)
	return if studioProposePlanTool.extractPlanFromToolCall(p6) == nil then studioAskUserTool.extractQuestionsFromToolCall(p6) ~= nil else true
end

local function getLocalToolWaitSeconds(p7) --[[ line: 61 ]]
	-- upvalues: studioProposePlanTool (ref), studioAskUserTool (ref)
	local eventMetaBySequenceId = p7.eventMetaBySequenceId
	
	if eventMetaBySequenceId == nil then
		return 0
	end
	local var11 = 0
	
	for i, v in p7.activitySlots do
		if v.kind == "tool_call" then
			local toolCallId = p7.toolCalls[v.toolCallId]
			
			if toolCallId ~= nil and (if studioProposePlanTool.extractPlanFromToolCall(toolCallId) == nil then studioAskUserTool.extractQuestionsFromToolCall(toolCallId) ~= nil else true) then
				local var16, dateTime
				local var12 = i - 1
				local var13 = eventMetaBySequenceId[var12]
				local var14 = eventMetaBySequenceId[var12 + 1]
				local var15 = if var13 then var13.emittedTime else nil
				
				if typeof(var15) == "string" and var15 ~= "" then
					dateTime = DateTime.fromIsoDate(var15)
					var16 = if dateTime ~= nil then nil else dateTime.UnixTimestampMillis
				else
					var16 = nil
				end
				dateTime = if var14 then var14.emittedTime else nil
				
				if typeof(dateTime) == "string" and dateTime ~= "" then
					local dateTime_1 = DateTime.fromIsoDate(dateTime)
					var15 = if dateTime_1 ~= nil then nil else dateTime_1.UnixTimestampMillis
				else
					var15 = nil
				end
				if var16 ~= nil and var15 ~= nil and var16 < var15 then
					var11 += var15 - var16
				end
			end
		end
	end
	return var11 / 1000
end

local function getTurnWorkedDurationLabel(p8, p9, p10, p11, p12) --[[ line: 94 ]]
	-- upvalues: formatWorkedDuration (ref), localizationStringsModule (ref)
	if p8 ~= nil and p9 ~= nil and p10 ~= nil then
		local emittedTime, var21
		local var19 = p8[p9]
		local var20 = p8[p10]
		
		if var19 == nil then
			var21 = nil
		else
			emittedTime = var19.emittedTime
			
			if typeof(emittedTime) == "string" and emittedTime ~= "" then
				local dateTime = DateTime.fromIsoDate(emittedTime)
				var21 = if dateTime ~= nil then nil else dateTime.UnixTimestampMillis
			else
				var21 = nil
			end
		end
		local emittedTime_1
		if var20 == nil then
			emittedTime = nil
		else
			emittedTime_1 = var20.emittedTime
			
			if typeof(emittedTime_1) == "string" and emittedTime_1 ~= "" then
				local dateTime = DateTime.fromIsoDate(emittedTime_1)
				emittedTime = if dateTime ~= nil then nil else dateTime.UnixTimestampMillis
			else
				emittedTime = nil
			end
		end
		if var21 == nil or emittedTime == nil then
			return if p11 > 0 then localizationStringsModule.formatChatTaskCount(p11) else localizationStringsModule.CHAT_TURN_ACTIVITY
		else
			emittedTime_1 = (emittedTime - var21) / 1000
			
			return if p12 == nil then formatWorkedDuration(emittedTime_1) else formatWorkedDuration(math.max(0, emittedTime_1 - p12))
		end
	end
end

local _ = function(p13) --[[ line: 119 | named "isActiveToolActivity" ]]
	return p13.kind == "tool_call" and (if p13.status ~= "pending" then if p13.status ~= "in_progress" then p13.status == nil else true else true)
end

local function getToolActivityLabel(p14) --[[ line: 126 ]]
	-- upvalues: localizationStringsModule (ref), subagentTasks (ref)
	if p14.kind ~= "tool_call" then
		return localizationStringsModule.CHAT_TOOL
	end
	local var24 = if typeof(p14.title) == "string" and p14.title ~= "" then p14.title else localizationStringsModule.CHAT_TOOL
	local chatToolActivityLabel = localizationStringsModule.getChatToolActivityLabel(var24, p14.status)
	
	return if chatToolActivityLabel == nil then if typeof(var24) == "string" and string.lower(string.gsub(var24, "[_%-%s]", "")) == string.lower(string.gsub(subagentTasks.TOOL_NAME, "[_%-%s]", "")) then localizationStringsModule.CHAT_ASSIGNING_TASKS elseif p14.status == "completed" then localizationStringsModule.formatChatFinishedTool(var24) elseif p14.status == "failed" then localizationStringsModule.formatChatFailedTool(var24) else localizationStringsModule.formatChatRunningTool(var24) else chatToolActivityLabel
end

local function getActiveActivityLabel(p15, _) --[[ line: 181 ]]
	-- upvalues: getToolActivityLabel (ref), localizationStringsModule (ref)
	for i = #p15, 1, -1 do
		local var26 = p15[i]
		
		if var26.kind ~= "tool_call" then
			continue
		end
		if not (var26.kind == "tool_call" and (if var26.status ~= "pending" then if var26.status ~= "in_progress" then var26.status == nil else true else true)) then
			continue
		end
		return getToolActivityLabel(var26)
	end
	return localizationStringsModule.CHAT_ASSISTANT_LOADING
end

return {
	ASSISTANT_STOPPED_TEXT = localizationStringsModule.CHAT_ASSISTANT_STOPPED,
	countToolCalls = function(p16) --[[ line: 150 ]]
		local var27 = 0
		
		for i, v in p16 do
			if v.kind == "tool_call" then
				var27 += 1
			end
		end
		return var27
	end,
	formatTurnFailureMessage = formatTurnFailureMessage,
	formatStepCount = formatStepCount,
	formatWorkedDuration = formatWorkedDuration,
	getActiveActivityLabel = getActiveActivityLabel,
	getAskUserActivityLabel = function(p17, p18) --[[ line: 206 ]]
		-- upvalues: localizationStringsModule (ref)
		return if p18 == 0 then localizationStringsModule.CHAT_QUESTION_COMPOSER_ANSWER elseif p17 == 1 then localizationStringsModule.CHAT_QUESTION_SINGLE else localizationStringsModule.CHAT_QUESTION_MULTIPLE
	end,
	getCompletedActivityLabel = function(p19) --[[ line: 191 ]]
		-- upvalues: getToolActivityLabel (ref), formatStepCount (ref), getActiveActivityLabel (ref)
		local var28 = 0
		
		for i, v in p19 do
			if v.kind == "tool_call" then
				var28 += 1
			end
		end
		if var28 == 1 then
			for i_1, v_1 in p19 do
				if v_1.kind == "tool_call" then
					return getToolActivityLabel(v_1)
				end
			end
		end
		return if var28 > 0 then formatStepCount(var28) else getActiveActivityLabel(p19, false)
	end,
	getLocalToolWaitSeconds = getLocalToolWaitSeconds,
	getSummaryToolActivity = function(p20, p21) --[[ line: 160 ]]
		if p21 == "active" then
			for i = #p20, 1, -1 do
				local var29 = p20[i]
				
				if not (var29.kind == "tool_call" and (if var29.status ~= "pending" then if var29.status ~= "in_progress" then var29.status == nil else true else true)) then
					continue
				end
				return var29
			end
		else
			local var30 = 0
			
			for i_1, v in p20 do
				if v.kind == "tool_call" then
					var30 += 1
				end
			end
			if var30 == 1 then
				for i_2, v_1 in p20 do
					if v_1.kind == "tool_call" then
						return v_1
					end
				end
			end
		end
		return nil
	end,
	getToolActivityLabel = getToolActivityLabel,
	getTurnWorkedDurationLabel = getTurnWorkedDurationLabel
}