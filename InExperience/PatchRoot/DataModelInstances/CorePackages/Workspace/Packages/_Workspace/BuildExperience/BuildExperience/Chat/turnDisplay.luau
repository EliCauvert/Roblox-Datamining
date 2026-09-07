local buildExperience = script:FindFirstAncestor("BuildExperience")
local creatorAgentChatModule = require(buildExperience.Parent.DataHydration.CreatorAgentChat)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local subagentTasks = creatorAgentChatModule.SubagentTasks
local studioAskUserTool = creatorAgentChatModule.StudioAskUserTool
local studioProposePlanTool = creatorAgentChatModule.StudioProposePlanTool

local function formatTurnFailureMessage(p1)
	-- upvalues: localizationStringsModule (ref)
	return localizationStringsModule.formatChatTurnFailureMessage(p1.error or localizationStringsModule.CHAT_ASSISTANT_RESPONSE_FAILED, p1.errorCode)
end

local function _(p1)
	return string.lower(string.gsub(p1, "[_%-%s]", ""))
end

local _ = function(p1)
	-- upvalues: subagentTasks (ref)
	return typeof(p1) == "string" and string.lower(string.gsub(p1, "[_%-%s]", "")) == string.lower(string.gsub(subagentTasks.TOOL_NAME, "[_%-%s]", ""))
end

local function formatStepCount(p1)
	-- upvalues: localizationStringsModule (ref)
	return localizationStringsModule.formatChatTaskCount(p1)
end

local function formatWorkedDuration(p1)
	-- upvalues: localizationStringsModule (ref)
	return localizationStringsModule.formatChatWorkedDuration(p1)
end

local _ = function(p1)
	if typeof(p1) ~= "string" or p1 == "" then
		return nil
	end
	local dateTime = DateTime.fromIsoDate(p1)
	
	return if dateTime == nil then nil else dateTime.UnixTimestampMillis
end

local _ = function(p1)
	-- upvalues: studioProposePlanTool (ref), studioAskUserTool (ref)
	return if studioProposePlanTool.extractPlanFromToolCall(p1) == nil then studioAskUserTool.extractQuestionsFromToolCall(p1) ~= nil else true
end

local function getLocalToolWaitSeconds(p1)
	-- upvalues: studioProposePlanTool (ref), studioAskUserTool (ref)
	local eventMetaBySequenceId = p1.eventMetaBySequenceId
	
	if eventMetaBySequenceId == nil then
		return 0
	end
	local var1 = 0
	
	for i, v in p1.activitySlots do
		if v.kind == "tool_call" then
			local toolCallId = p1.toolCalls[v.toolCallId]
			
			if toolCallId ~= nil and (if studioProposePlanTool.extractPlanFromToolCall(toolCallId) == nil then studioAskUserTool.extractQuestionsFromToolCall(toolCallId) ~= nil else true) then
				local var2, dateTime
				local var3 = i - 1
				local var4 = eventMetaBySequenceId[var3]
				local var5 = eventMetaBySequenceId[var3 + 1]
				local var6 = if var4 then var4.emittedTime else nil
				
				if typeof(var6) == "string" and var6 ~= "" then
					dateTime = DateTime.fromIsoDate(var6)
					var2 = if dateTime ~= nil then nil else dateTime.UnixTimestampMillis
				else
					var2 = nil
				end
				dateTime = if var5 then var5.emittedTime else nil
				
				if typeof(dateTime) == "string" and dateTime ~= "" then
					local dateTime_1 = DateTime.fromIsoDate(dateTime)
					var6 = if dateTime_1 ~= nil then nil else dateTime_1.UnixTimestampMillis
				else
					var6 = nil
				end
				if var2 ~= nil and var6 ~= nil and var2 < var6 then
					var1 += var6 - var2
				end
			end
		end
	end
	return var1 / 1000
end

local function getTurnWorkedDurationLabel(p2, p3, p4, p5, p6)
	-- upvalues: formatWorkedDuration (ref), localizationStringsModule (ref)
	if p2 ~= nil and p3 ~= nil and p4 ~= nil then
		local emittedTime, var7
		local var8 = p2[p3]
		local var9 = p2[p4]
		
		if var8 == nil then
			var7 = nil
		else
			emittedTime = var8.emittedTime
			
			if typeof(emittedTime) == "string" and emittedTime ~= "" then
				local dateTime = DateTime.fromIsoDate(emittedTime)
				var7 = if dateTime ~= nil then nil else dateTime.UnixTimestampMillis
			else
				var7 = nil
			end
		end
		local emittedTime_1
		if var9 == nil then
			emittedTime = nil
		else
			emittedTime_1 = var9.emittedTime
			
			if typeof(emittedTime_1) == "string" and emittedTime_1 ~= "" then
				local dateTime = DateTime.fromIsoDate(emittedTime_1)
				emittedTime = if dateTime ~= nil then nil else dateTime.UnixTimestampMillis
			else
				emittedTime = nil
			end
		end
		if var7 == nil or emittedTime == nil then
			return if p5 > 0 then localizationStringsModule.formatChatTaskCount(p5) else localizationStringsModule.CHAT_TURN_ACTIVITY
		else
			emittedTime_1 = (emittedTime - var7) / 1000
			
			return if p6 == nil then formatWorkedDuration(emittedTime_1) else formatWorkedDuration(math.max(0, emittedTime_1 - p6))
		end
	end
end

local _ = function(p2)
	return p2.kind == "tool_call" and (if p2.status ~= "pending" then if p2.status ~= "in_progress" then p2.status == nil else true else true)
end

local function getToolActivityLabel(p2)
	-- upvalues: localizationStringsModule (ref), subagentTasks (ref)
	if p2.kind ~= "tool_call" then
		return localizationStringsModule.CHAT_TOOL
	end
	local var7 = if typeof(p2.title) == "string" and p2.title ~= "" then p2.title else localizationStringsModule.CHAT_TOOL
	local chatToolActivityLabel = localizationStringsModule.getChatToolActivityLabel(var7, p2.status)
	
	return if chatToolActivityLabel == nil then if typeof(var7) == "string" and string.lower(string.gsub(var7, "[_%-%s]", "")) == string.lower(string.gsub(subagentTasks.TOOL_NAME, "[_%-%s]", "")) then localizationStringsModule.CHAT_ASSIGNING_TASKS elseif p2.status == "completed" then localizationStringsModule.formatChatFinishedTool(var7) elseif p2.status == "failed" then localizationStringsModule.formatChatFailedTool(var7) else localizationStringsModule.formatChatRunningTool(var7) else chatToolActivityLabel
end

local function getActiveActivityLabel(p2, _)
	-- upvalues: getToolActivityLabel (ref), localizationStringsModule (ref)
	for i = #p2, 1, -1 do
		local var7 = p2[i]
		
		if var7.kind ~= "tool_call" then
			continue
		end
		if not (var7.kind == "tool_call" and (if var7.status ~= "pending" then if var7.status ~= "in_progress" then var7.status == nil else true else true)) then
			continue
		end
		return getToolActivityLabel(var7)
	end
	return localizationStringsModule.CHAT_ASSISTANT_LOADING
end

return {
	ASSISTANT_STOPPED_TEXT = localizationStringsModule.CHAT_ASSISTANT_STOPPED,
	countToolCalls = function(p3)
		local var8 = 0
		
		for i, v in p3 do
			if v.kind == "tool_call" then
				var8 += 1
			end
		end
		return var8
	end,
	formatTurnFailureMessage = formatTurnFailureMessage,
	formatStepCount = formatStepCount,
	formatWorkedDuration = formatWorkedDuration,
	getActiveActivityLabel = getActiveActivityLabel,
	getAskUserActivityLabel = function(p4, p5)
		-- upvalues: localizationStringsModule (ref)
		return if p5 == 0 then localizationStringsModule.CHAT_QUESTION_COMPOSER_ANSWER elseif p4 == 1 then localizationStringsModule.CHAT_QUESTION_SINGLE else localizationStringsModule.CHAT_QUESTION_MULTIPLE
	end,
	getCompletedActivityLabel = function(p4)
		-- upvalues: getToolActivityLabel (ref), formatStepCount (ref), getActiveActivityLabel (ref)
		local var9 = 0
		
		for i, v in p4 do
			if v.kind == "tool_call" then
				var9 += 1
			end
		end
		if var9 == 1 then
			for i_1, v_1 in p4 do
				if v_1.kind == "tool_call" then
					return getToolActivityLabel(v_1)
				end
			end
		end
		return if var9 > 0 then formatStepCount(var9) else getActiveActivityLabel(p4, false)
	end,
	getLocalToolWaitSeconds = getLocalToolWaitSeconds,
	getSummaryToolActivity = function(p5, p6)
		if p6 == "active" then
			for i = #p5, 1, -1 do
				local var10 = p5[i]
				
				if not (var10.kind == "tool_call" and (if var10.status ~= "pending" then if var10.status ~= "in_progress" then var10.status == nil else true else true)) then
					continue
				end
				return var10
			end
		else
			local var11 = 0
			
			for i_1, v in p5 do
				if v.kind == "tool_call" then
					var11 += 1
				end
			end
			if var11 == 1 then
				for i_2, v_1 in p5 do
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