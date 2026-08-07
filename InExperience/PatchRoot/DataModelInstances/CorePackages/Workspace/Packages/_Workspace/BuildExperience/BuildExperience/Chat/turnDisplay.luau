local buildExperience = script:FindFirstAncestor("BuildExperience")
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local subagentTasks = require(buildExperience.Parent.DataHydration.CreatorAgentChat).SubagentTasks

local function formatTurnFailureMessage(p0) --[[ line: 18 ]]
	-- upvalues: localizationStringsModule (ref)
	return localizationStringsModule.formatChatTurnFailureMessage(p0.error or localizationStringsModule.CHAT_ASSISTANT_RESPONSE_FAILED, p0.errorCode)
end

local function _(p1) --[[ line: 23 | named "normalizeToolTitle" ]]
	return string.lower(string.gsub(p1, "[_%-%s]", ""))
end

local _ = function(p2) --[[ line: 27 | named "isManageTasksToolTitle" ]]
	-- upvalues: subagentTasks (ref)
	return typeof(p2) == "string" and string.lower(string.gsub(p2, "[_%-%s]", "")) == string.lower(string.gsub(subagentTasks.TOOL_NAME, "[_%-%s]", ""))
end

local function formatStepCount(p3) --[[ line: 32 ]]
	-- upvalues: localizationStringsModule (ref)
	return localizationStringsModule.formatChatTaskCount(p3)
end

local function formatWorkedDuration(p4) --[[ line: 38 ]]
	-- upvalues: localizationStringsModule (ref)
	return localizationStringsModule.formatChatWorkedDuration(p4)
end

local _ = function(p5) --[[ line: 42 | named "parseEmittedTimeMillis" ]]
	if typeof(p5) ~= "string" or p5 == "" then
		return nil
	end
	local dateTime = DateTime.fromIsoDate(p5)
	
	return if dateTime == nil then nil else dateTime.UnixTimestampMillis
end

local function getTurnWorkedDurationLabel(p6, p7, p8, p9) --[[ line: 50 ]]
	-- upvalues: formatWorkedDuration (ref), localizationStringsModule (ref)
	if p6 ~= nil and p7 ~= nil and p8 ~= nil then
		local emittedTime, var11
		local var9 = p6[p7]
		local var10 = p6[p8]
		
		if var9 == nil then
			var11 = nil
		else
			emittedTime = var9.emittedTime
			
			if typeof(emittedTime) == "string" and emittedTime ~= "" then
				local dateTime = DateTime.fromIsoDate(emittedTime)
				var11 = if dateTime ~= nil then nil else dateTime.UnixTimestampMillis
			else
				var11 = nil
			end
		end
		if var10 == nil then
			emittedTime = nil
		else
			local emittedTime_1 = var10.emittedTime
			
			if typeof(emittedTime_1) == "string" and emittedTime_1 ~= "" then
				local dateTime = DateTime.fromIsoDate(emittedTime_1)
				emittedTime = if dateTime ~= nil then nil else dateTime.UnixTimestampMillis
			else
				emittedTime = nil
			end
		end
		return if not (var11 ~= nil and emittedTime ~= nil) then if p9 > 0 then localizationStringsModule.formatChatTaskCount(p9) else localizationStringsModule.CHAT_TURN_ACTIVITY else formatWorkedDuration((emittedTime - var11) / 1000)
	end
end

local _ = function(p10) --[[ line: 70 | named "isActiveToolActivity" ]]
	return p10.kind == "tool_call" and (if p10.status ~= "pending" then if p10.status ~= "in_progress" then p10.status == nil else true else true)
end

local function getToolActivityLabel(p11) --[[ line: 77 ]]
	-- upvalues: localizationStringsModule (ref), subagentTasks (ref)
	if p11.kind ~= "tool_call" then
		return localizationStringsModule.CHAT_TOOL
	end
	local var14 = if typeof(p11.title) == "string" and p11.title ~= "" then p11.title else localizationStringsModule.CHAT_TOOL
	local chatToolActivityLabel = localizationStringsModule.getChatToolActivityLabel(var14, p11.status)
	
	return if chatToolActivityLabel == nil then if typeof(var14) == "string" and string.lower(string.gsub(var14, "[_%-%s]", "")) == string.lower(string.gsub(subagentTasks.TOOL_NAME, "[_%-%s]", "")) then localizationStringsModule.CHAT_ASSIGNING_TASKS elseif p11.status == "completed" then localizationStringsModule.formatChatFinishedTool(var14) elseif p11.status == "failed" then localizationStringsModule.formatChatFailedTool(var14) else localizationStringsModule.formatChatRunningTool(var14) else chatToolActivityLabel
end

local function getActiveActivityLabel(p12, _) --[[ line: 111 ]]
	-- upvalues: getToolActivityLabel (ref), localizationStringsModule (ref)
	for i = #p12, 1, -1 do
		local var16 = p12[i]
		
		if var16.kind ~= "tool_call" then
			continue
		end
		if not (var16.kind == "tool_call" and (if var16.status ~= "pending" then if var16.status ~= "in_progress" then var16.status == nil else true else true)) then
			continue
		end
		return getToolActivityLabel(var16)
	end
	return localizationStringsModule.CHAT_ASSISTANT_LOADING
end

return {
	ASSISTANT_STOPPED_TEXT = localizationStringsModule.CHAT_ASSISTANT_STOPPED,
	countToolCalls = function(p13) --[[ line: 101 ]]
		local var17 = 0
		
		for i, v in p13 do
			if v.kind == "tool_call" then
				var17 += 1
			end
		end
		return var17
	end,
	formatTurnFailureMessage = formatTurnFailureMessage,
	formatStepCount = formatStepCount,
	formatWorkedDuration = formatWorkedDuration,
	getActiveActivityLabel = getActiveActivityLabel,
	getAskUserActivityLabel = function(p14, p15) --[[ line: 136 ]]
		-- upvalues: localizationStringsModule (ref)
		return if p15 == 0 then localizationStringsModule.CHAT_QUESTION_COMPOSER_ANSWER elseif p14 == 1 then localizationStringsModule.CHAT_QUESTION_SINGLE else localizationStringsModule.CHAT_QUESTION_MULTIPLE
	end,
	getCompletedActivityLabel = function(p16) --[[ line: 121 ]]
		-- upvalues: getToolActivityLabel (ref), formatStepCount (ref), getActiveActivityLabel (ref)
		local var18 = 0
		
		for i, v in p16 do
			if v.kind == "tool_call" then
				var18 += 1
			end
		end
		if var18 == 1 then
			for i_1, v_1 in p16 do
				if v_1.kind == "tool_call" then
					return getToolActivityLabel(v_1)
				end
			end
		end
		return if var18 > 0 then formatStepCount(var18) else getActiveActivityLabel(p16, false)
	end,
	getToolActivityLabel = getToolActivityLabel,
	getTurnWorkedDurationLabel = getTurnWorkedDurationLabel
}