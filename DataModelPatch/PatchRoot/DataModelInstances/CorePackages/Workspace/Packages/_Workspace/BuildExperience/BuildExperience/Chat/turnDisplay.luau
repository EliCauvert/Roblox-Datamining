local SubagentTasks = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat).SubagentTasks

local function _(Text: string): string
	return string.lower((string.gsub(Text, "[_%-%s]", "")))
end

local _ = function(Text: string): boolean
	-- upvalues: SubagentTasks (copy)
	return typeof(Text) == "string" and string.lower((string.gsub(Text, "[_%-%s]", ""))) == string.lower((string.gsub(SubagentTasks.TOOL_NAME, "[_%-%s]", "")))
end

local _ = function(p1)
	if typeof(p1) == "string" and p1 ~= "" then
		local _DateTime = DateTime.fromIsoDate(p1)
		
		return if _DateTime == nil then nil else _DateTime.UnixTimestampMillis
	else
		return nil
	end
end

local _ = function(p1): boolean
	return p1.kind == "tool_call" and (p1.status == "pending" or (p1.status == "in_progress" or p1.status == nil))
end

local function getToolActivityLabel(p1): string
	-- upvalues: SubagentTasks (copy)
	if p1.kind == "tool_call" then
		local Title = if typeof(p1.title) == "string" and p1.title ~= "" then p1.title else "tool"
		local IsLoweredMatch: boolean = typeof(Title) == "string" and string.lower((string.gsub(Title, "[_%-%s]", ""))) == string.lower((string.gsub(SubagentTasks.TOOL_NAME, "[_%-%s]", "")))
		
		return if IsLoweredMatch then "Assigning tasks to agents" elseif p1.status == "completed" then `Finished {Title}` elseif p1.status == "failed" then `Failed {Title}` else `Running {Title}`
	else
		return "tool"
	end
end

local function getActiveActivityLabel(p1, _)
	-- upvalues: getToolActivityLabel (copy)
	local v1 = nil
	for i = #p1, 1, -1 do
		v1 = p1[i]
		
		if v1.kind == "tool_call" and (v1.kind == "tool_call" and (v1.status == "pending" or (v1.status == "in_progress" or v1.status == nil))) then
			return (getToolActivityLabel(v1))
		end
	end
	return "Thinking"
end

return {
	ASSISTANT_STOPPED_TEXT = "You stopped the agent.",
	countToolCalls = function(List): number
		local Count = 0
		
		for _, value in List do
			if value.kind == "tool_call" then
				Count += 1
			end
		end
		return Count
	end,
	formatTurnFailureMessage = function(p2)
		local Error = p2.error or "Assistant response failed."
		
		if p2.errorCode ~= nil then
			Error = `({p2.errorCode}) {Error}`
		end
		return Error
	end,
	formatStepCount = function(p2): string
		return if p2 == 1 then "1 Action completed" else `{p2} Actions completed`
	end,
	formatWorkedDuration = function(p2: number): string
		local Largest = math.max(0, (math.floor(p2 + 0.5)))
		
		return if Largest < 60 then `Worked for {Largest}s` else `Worked for {math.floor(Largest / 60)}m{Largest % 60}s`
	end,
	getActiveActivityLabel = getActiveActivityLabel,
	getAskUserActivityLabel = function(p3, p4): string
		return if p4 == 0 then "Answer the agent's question in the composer below" elseif p3 == 1 then "Agent has a question" else "Agent has some questions"
	end,
	getCompletedActivityLabel = function(List)
		-- upvalues: getActiveActivityLabel (copy)
		local Count = 0
		
		for _, value in List do
			if value.kind == "tool_call" then
				Count += 1
			end
		end
		return if Count > 0 then if Count == 1 then "1 Action completed" else `{Count} Actions completed` else getActiveActivityLabel(List, false)
	end,
	getToolActivityLabel = getToolActivityLabel,
	getTurnWorkedDurationLabel = function(p3, p4, p5, p6: number): string
		if p3 ~= nil and p4 ~= nil and p5 ~= nil then
			local v2 = p3[p4]
			local v3 = p3[p5]
			local UnixTimestampMillis = nil
			
			if v2 == nil then
				UnixTimestampMillis = nil
			else
				local EmittedTime = v2.emittedTime
				
				if typeof(EmittedTime) == "string" and EmittedTime ~= "" then
					local _DateTime = DateTime.fromIsoDate(EmittedTime)
					UnixTimestampMillis = if _DateTime == nil then nil else _DateTime.UnixTimestampMillis
				else
					UnixTimestampMillis = nil
				end
			end
			local UnixTimestampMillis1 = nil
			if v3 == nil then
				UnixTimestampMillis1 = nil
			else
				local EmittedTime = v3.emittedTime
				
				if typeof(EmittedTime) == "string" and EmittedTime ~= "" then
					local _DateTime = DateTime.fromIsoDate(EmittedTime)
					UnixTimestampMillis1 = if _DateTime == nil then nil else _DateTime.UnixTimestampMillis
				else
					UnixTimestampMillis1 = nil
				end
			end
			if UnixTimestampMillis ~= nil and UnixTimestampMillis1 ~= nil then
				local Largest = math.max(0, (math.floor((UnixTimestampMillis1 - UnixTimestampMillis) / 1000 + 0.5)))
				
				return if Largest < 60 then `Worked for {Largest}s` else `Worked for {math.floor(Largest / 60)}m{Largest % 60}s`
			end
		end
		return if p6 > 0 then if p6 == 1 then "1 Action completed" else `{p6} Actions completed` else "Turn activity"
	end
}