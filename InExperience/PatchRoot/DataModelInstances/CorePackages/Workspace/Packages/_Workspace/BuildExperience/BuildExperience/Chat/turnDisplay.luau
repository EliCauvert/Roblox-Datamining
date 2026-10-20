local BuildExperience = script:FindFirstAncestor("BuildExperience")
local CreatorAgentChatModule = require(BuildExperience.Parent.DataHydration.CreatorAgentChat)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local StudioAskUserTool = CreatorAgentChatModule.StudioAskUserTool
local StudioProposePlanTool = CreatorAgentChatModule.StudioProposePlanTool

local function _(p1)
	if typeof(p1) == "string" and p1 ~= "" then
		local _DateTime = DateTime.fromIsoDate(p1)
		
		return if _DateTime == nil then nil else _DateTime.UnixTimestampMillis
	else
		return nil
	end
end

local _ = function(p1): boolean
	-- upvalues: StudioProposePlanTool (copy), StudioAskUserTool (copy)
	return StudioProposePlanTool.extractPlanFromToolCall(p1) ~= nil or StudioAskUserTool.extractQuestionsFromToolCall(p1) ~= nil
end

local _ = function(p1): boolean
	return p1.kind == "tool_call" and (p1.status == "pending" or (p1.status == "in_progress" or p1.status == nil))
end

return {
	ASSISTANT_STOPPED_TEXT = LocalizationStringsModule.CHAT_ASSISTANT_STOPPED,
	countToolCalls = function(List): number
		local Count = 0
		
		for _, value in List do
			if value.kind == "tool_call" then
				Count += 1
			end
		end
		return Count
	end,
	getAskUserActivityLabel = function(p1, p2)
		-- upvalues: LocalizationStringsModule (copy)
		return if p2 == 0 then LocalizationStringsModule.CHAT_QUESTION_COMPOSER_ANSWER elseif p1 == 1 then LocalizationStringsModule.CHAT_QUESTION_SINGLE else LocalizationStringsModule.CHAT_QUESTION_MULTIPLE
	end,
	getLocalToolWaitSeconds = function(p1): number
		-- upvalues: StudioProposePlanTool (copy), StudioAskUserTool (copy)
		local EventMetaBySequenceId = p1.eventMetaBySequenceId
		
		if EventMetaBySequenceId == nil then
			return 0
		end
		local Total = 0
		
		for i, activitySlot in p1.activitySlots do
			if activitySlot.kind == "tool_call" then
				local ToolCall = p1.toolCalls[activitySlot.toolCallId]
				
				if ToolCall ~= nil and (StudioProposePlanTool.extractPlanFromToolCall(ToolCall) ~= nil or StudioAskUserTool.extractQuestionsFromToolCall(ToolCall) ~= nil) then
					local IDelta = i - 1
					local EventMetaBySequenceIdEntry = EventMetaBySequenceId[IDelta]
					local EventMetaBySequenceIdEntry1 = EventMetaBySequenceId[IDelta + 1]
					local EmittedTime = if EventMetaBySequenceIdEntry then EventMetaBySequenceIdEntry.emittedTime else nil
					local UnixTimestampMillis = nil
					
					if typeof(EmittedTime) == "string" and EmittedTime ~= "" then
						local _DateTime = DateTime.fromIsoDate(EmittedTime)
						UnixTimestampMillis = if _DateTime == nil then nil else _DateTime.UnixTimestampMillis
					else
						UnixTimestampMillis = nil
					end
					local EmittedTime1 = if EventMetaBySequenceIdEntry1 then EventMetaBySequenceIdEntry1.emittedTime else nil
					local UnixTimestampMillis1 = nil
					
					if typeof(EmittedTime1) == "string" and EmittedTime1 ~= "" then
						local _DateTime = DateTime.fromIsoDate(EmittedTime1)
						UnixTimestampMillis1 = if _DateTime == nil then nil else _DateTime.UnixTimestampMillis
					else
						UnixTimestampMillis1 = nil
					end
					if UnixTimestampMillis ~= nil and UnixTimestampMillis1 ~= nil and UnixTimestampMillis < UnixTimestampMillis1 then
						Total += UnixTimestampMillis1 - UnixTimestampMillis
					end
				end
			end
		end
		return Total / 1000
	end,
	getSummaryToolActivity = function(List, p2)
		if p2 == "active" then
			local Entry = nil
			for i = #List, 1, -1 do
				Entry = List[i]
				
				if Entry.kind == "tool_call" and (Entry.status == "pending" or (Entry.status == "in_progress" or Entry.status == nil)) then
					return Entry
				end
			end
		else
			local Count = 0
			
			for _, value in List do
				if value.kind == "tool_call" then
					Count += 1
				end
			end
			if Count == 1 then
				for _, value1 in List do
					if value1.kind == "tool_call" then
						return value1
					end
				end
			end
		end
		return nil
	end
}