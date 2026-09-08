local buildExperience = script:FindFirstAncestor("BuildExperience")
local creatorAgentChatModule = require(buildExperience.Parent.DataHydration.CreatorAgentChat)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local studioAskUserTool = creatorAgentChatModule.StudioAskUserTool
local studioProposePlanTool = creatorAgentChatModule.StudioProposePlanTool

local function _(p1)
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

local _ = function(p1)
	return p1.kind == "tool_call" and (if p1.status ~= "pending" then if p1.status ~= "in_progress" then p1.status == nil else true else true)
end

return {
	ASSISTANT_STOPPED_TEXT = localizationStringsModule.CHAT_ASSISTANT_STOPPED,
	countToolCalls = function(p1)
		local var1 = 0
		
		for i, v in p1 do
			if v.kind == "tool_call" then
				var1 += 1
			end
		end
		return var1
	end,
	getAskUserActivityLabel = function(p2, p3)
		-- upvalues: localizationStringsModule (ref)
		return if p3 == 0 then localizationStringsModule.CHAT_QUESTION_COMPOSER_ANSWER elseif p2 == 1 then localizationStringsModule.CHAT_QUESTION_SINGLE else localizationStringsModule.CHAT_QUESTION_MULTIPLE
	end,
	getLocalToolWaitSeconds = function(p2)
		-- upvalues: studioProposePlanTool (ref), studioAskUserTool (ref)
		local eventMetaBySequenceId = p2.eventMetaBySequenceId
		
		if eventMetaBySequenceId == nil then
			return 0
		end
		local var2 = 0
		
		for i, v in p2.activitySlots do
			if v.kind == "tool_call" then
				local toolCallId = p2.toolCalls[v.toolCallId]
				
				if toolCallId ~= nil and (if studioProposePlanTool.extractPlanFromToolCall(toolCallId) == nil then studioAskUserTool.extractQuestionsFromToolCall(toolCallId) ~= nil else true) then
					local var3, dateTime
					local var4 = i - 1
					local var5 = eventMetaBySequenceId[var4]
					local var6 = eventMetaBySequenceId[var4 + 1]
					local var7 = if var5 then var5.emittedTime else nil
					
					if typeof(var7) == "string" and var7 ~= "" then
						dateTime = DateTime.fromIsoDate(var7)
						var3 = if dateTime ~= nil then nil else dateTime.UnixTimestampMillis
					else
						var3 = nil
					end
					dateTime = if var6 then var6.emittedTime else nil
					
					if typeof(dateTime) == "string" and dateTime ~= "" then
						local dateTime_1 = DateTime.fromIsoDate(dateTime)
						var7 = if dateTime_1 ~= nil then nil else dateTime_1.UnixTimestampMillis
					else
						var7 = nil
					end
					if var3 ~= nil and var7 ~= nil and var3 < var7 then
						var2 += var7 - var3
					end
				end
			end
		end
		return var2 / 1000
	end,
	getSummaryToolActivity = function(p3, p4)
		if p4 == "active" then
			for i = #p3, 1, -1 do
				local var8 = p3[i]
				
				if not (var8.kind == "tool_call" and (if var8.status ~= "pending" then if var8.status ~= "in_progress" then var8.status == nil else true else true)) then
					continue
				end
				return var8
			end
		else
			local var9 = 0
			
			for i_1, v in p3 do
				if v.kind == "tool_call" then
					var9 += 1
				end
			end
			if var9 == 1 then
				for i_2, v_1 in p3 do
					if v_1.kind == "tool_call" then
						return v_1
					end
				end
			end
		end
		return nil
	end
}