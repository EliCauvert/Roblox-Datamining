local subagentTasks = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat).SubagentTasks
local myStatsExperienceCasRtnFallbackSeconds = game:DefineFastInt("MyStatsExperienceCasRtnFallbackSeconds", 10)
local myStatsExperienceCasPollingMinIntervalSeconds = game:DefineFastInt("MyStatsExperienceCasPollingMinIntervalSeconds", 2)
local myStatsExperienceCasPollingMaxIntervalSeconds = game:DefineFastInt("MyStatsExperienceCasPollingMaxIntervalSeconds", 30)

local function formatTurnFailureMessage(p0) --[[ line: 30 ]]
	local error = p0.error or "Assistant response failed."
	
	if p0.errorCode ~= nil then
		error = `({p0.errorCode}) {error}`
	end
	return error
end

local function _(p1, p2) --[[ line: 38 | named "isToolCallActive" ]]
	return if p2 and p2[p1.toolCallId] then false elseif p1.status ~= "pending" then p1.status == "in_progress" else true
end

local function getActiveToolTitle(p3, p4) --[[ line: 45 ]]
	for i, v in p3.toolCalls do
		if (if p4 and p4[v.toolCallId] then false elseif v.status ~= "pending" then v.status == "in_progress" else true) and typeof(v.title) == "string" and v.title ~= "" then
			return v.title
		end
	end
	return nil
end

local _ = function(p5, p6) --[[ line: 56 | named "countActiveToolCalls" ]]
	local var7 = 0
	
	for i, v in p5.toolCalls do
		if if p6 and p6[v.toolCallId] then false elseif v.status ~= "pending" then v.status == "in_progress" else true then
			var7 += 1
		end
	end
	return var7
end

local _ = function(p7) --[[ line: 66 | named "normalizeToolTitle" ]]
	return string.lower(string.gsub(p7, "[_%-%s]", ""))
end

local _ = function(p8) --[[ line: 70 | named "isManageTasksToolTitle" ]]
	-- upvalues: subagentTasks (ref)
	return typeof(p8) == "string" and string.lower(string.gsub(p8, "[_%-%s]", "")) == string.lower(string.gsub(subagentTasks.TOOL_NAME, "[_%-%s]", ""))
end

local function formatTurnDisplayText(p9, p10) --[[ line: 75 ]]
	-- upvalues: getActiveToolTitle (ref), subagentTasks (ref)
	if p9.thoughtText ~= "" and p9.assistantText == "" then
		return p9.thoughtText, false
	end
	local var8 = getActiveToolTitle(p9, p10)
	
	if var8 then
		if typeof(var8) == "string" and string.lower(string.gsub(var8, "[_%-%s]", "")) == string.lower(string.gsub(subagentTasks.TOOL_NAME, "[_%-%s]", "")) then
			return "Assigning tasks to agents", false
		end
		return `Running tools ({var8})\226\128\166`, false
	else
		local var9 = 0
		
		for i, v in p9.toolCalls do
			if if p10 and p10[v.toolCallId] then false elseif v.status ~= "pending" then v.status == "in_progress" else true then
				var9 += 1
			end
		end
		if var9 > 0 then
			return "Running tools\226\128\166", false
		elseif p9.assistantText ~= "" then
			return p9.assistantText, true
		elseif p9.status == "streaming" then
			return "Thinking", false
		end
		return "Thinking", false
	end
end

return {
	ASSIGNING_TASKS_TEXT = "Assigning tasks to agents",
	ASSISTANT_LOADING_TEXT = "Thinking",
	ASSISTANT_STOPPED_TEXT = "You stopped the agent.",
	CAS_RTN_IDLE_FALLBACK_SECONDS = myStatsExperienceCasRtnFallbackSeconds,
	CAS_POLL_MIN_INTERVAL_SECONDS = myStatsExperienceCasPollingMinIntervalSeconds,
	CAS_POLL_MAX_INTERVAL_SECONDS = myStatsExperienceCasPollingMaxIntervalSeconds,
	formatTurnFailureMessage = formatTurnFailureMessage,
	formatTurnDisplayText = formatTurnDisplayText,
	formatTerminalTurnFallbackText = function(a) --[[ line: 100 ]]
		return if a.status == "cancelled" or a.stopReason == "cancelled" then "You stopped the agent." elseif a.toolCallCount > 0 then "The assistant finished without a text reply." else "The assistant didn't return a response. Please try again."
	end,
	syncTurnResponseText = function(value, p11, p12, p13, p14, p15) --[[ line: 110 ]]
		-- upvalues: formatTurnDisplayText (ref)
		local var12
		local var10 = "Thinking"
		local var11 = value.state(false)
		
		local function _() --[[ line: 121 | named "currentSkipIds" ]]
			-- upvalues: p15 (ref)
			return if p15 == nil then nil else p15()
		end
		
		p12(true)
		p11("Thinking")
		
		if p13 ~= nil then
			p13(var11.activityItems)
		end
		if p14 ~= nil then
			p14(var11)
		end
		while not var11.isDone do
			var12 = value.state(false)
			
			if p14 ~= nil then
				p14(var12)
			end
			if var12.status ~= "failed" then
				var11 = var12
				
				if p13 ~= nil then
					p13(var12.activityItems)
				end
				local var14, var15 = formatTurnDisplayText(var12, if p15 ~= nil then nil else p15())
				
				if var14 ~= var10 then
					var10 = var14
					p12(not var15)
					p11(var14)
				end
				task.wait()
			end
			p12(false)
			local error = var12.error or "Assistant response failed."
			
			if var12.errorCode ~= nil then
				error = `({var12.errorCode}) {error}`
			end
			p11(error)
			
			return false
		end
		var12 = value.state(false)
		
		if p13 ~= nil then
			p13(var12.activityItems)
		end
		if p14 ~= nil then
			p14(var12)
		end
		if var12.status == "failed" then
			p12(false)
			local error = var12.error or "Assistant response failed."
			
			if var12.errorCode ~= nil then
				error = `({var12.errorCode}) {error}`
			end
			p11(error)
			
			return false
		else
			local var17, var18 = formatTurnDisplayText(var12, if p15 ~= nil then nil else p15())
			
			if var18 then
				p12(false)
				p11(var17)
				
				return true
			end
			p12(false)
			p11(if var12.status == "cancelled" or var12.stopReason == "cancelled" then "You stopped the agent." elseif var12.toolCallCount > 0 then "The assistant finished without a text reply." else "The assistant didn't return a response. Please try again.")
			
			return false
		end
	end
}