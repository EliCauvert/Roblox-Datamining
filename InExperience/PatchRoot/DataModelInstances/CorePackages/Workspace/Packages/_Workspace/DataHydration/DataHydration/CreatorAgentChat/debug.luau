local HttpService = game:GetService("HttpService")
local DebugMyStatsExperienceStats = game:DefineFastFlag("DebugMyStatsExperienceStats", false)
local ClockTime = nil
local Timeline = nil
local v1 = nil

local function _(p1: number): number
	return math.floor(p1 * 1000 + 0.5) / 1000
end

local function timelineFields()
	-- upvalues: ClockTime (ref), Timeline (ref), v1 (ref)
	local ClockTime1 = os.clock()
	local config = {
		tSec = math.floor((ClockTime1 - (ClockTime or ClockTime1)) * 1000 + 0.5) / 1000
	}
	
	if Timeline ~= nil then
		config.timeline = Timeline
	end
	if v1 ~= nil then
		config.dtSec = math.floor((ClockTime1 - v1) * 1000 + 0.5) / 1000
	end
	v1 = ClockTime1
	
	return config
end

local function mergeTimeline(Tbl)
	-- upvalues: timelineFields (copy)
	local TimelineFieldsResult = timelineFields()
	
	if Tbl == nil then
		return TimelineFieldsResult
	end
	if typeof(Tbl) ~= "table" then
		return {
			detail = Tbl,
			tSec = TimelineFieldsResult.tSec,
			dtSec = TimelineFieldsResult.dtSec,
			timeline = TimelineFieldsResult.timeline
		}
	end
	local Copy = table.clone(Tbl)
	
	for i, value in TimelineFieldsResult do
		Copy[i] = value
	end
	return Copy
end

local _ = function(p1)
	-- upvalues: HttpService (copy)
	local Success, Result = pcall(HttpService.JSONEncode, HttpService, p1)
	
	return if Success and typeof(Result) == "string" then Result else tostring(p1)
end

local _ = function(Text: string, p1): string?
	if typeof(Text) == "string" then
		local EndIndex = p1 or 120
		
		return if #Text <= EndIndex then Text else string.sub(Text, 1, EndIndex) .. "..."
	else
		return nil
	end
end

local function formatRequestState(p1)
	return if typeof(p1) == "table" then {
		status = p1.status,
		error = p1.error,
		errorCode = p1.errorCode,
		result = p1.result
	} else { raw = tostring(p1) }
end

return {
	LOG_PREFIX = "[MyStats]",
	isEnabled = function()
		-- upvalues: DebugMyStatsExperienceStats (copy)
		return DebugMyStatsExperienceStats
	end,
	log = function(p1, p2, Detail)
		-- upvalues: DebugMyStatsExperienceStats (copy), mergeTimeline (copy), HttpService (copy)
		if not DebugMyStatsExperienceStats then return end
		local v2 = " | %*"
		local MergeTimelineResult = mergeTimeline(Detail)
		local Success, Result = pcall(HttpService.JSONEncode, HttpService, MergeTimelineResult)
		local FormatResult: string = v2:format(if Success and typeof(Result) == "string" then Result else tostring(MergeTimelineResult))
		
		if p1 == "warn" then
			warn(`[MyStats] {p2}{FormatResult}`)
			
			return
		else
			print(`[MyStats] {p2}{FormatResult}`)
		end
	end,
	resetTimeline = function(p1)
		-- upvalues: ClockTime (ref), Timeline (ref), v1 (ref)
		ClockTime = os.clock()
		Timeline = p1
		v1 = nil
	end,
	timelineFields = timelineFields,
	formatStudioAskUserQuestions = function(List)
		if typeof(List) ~= "table" then
			return { raw = tostring(List) }
		end
		local QuestionCount = 0
		local TotalOptionCount = 0
		local FirstQuestion = nil
		local FirstOption = nil
		
		for _, value in List do
			if typeof(value) == "table" then
				QuestionCount += 1
				
				if FirstQuestion == nil then
					local Question: string = value.question
					FirstQuestion = if typeof(Question) == "string" then if #Question <= 120 then Question else string.sub(Question, 1, 120) .. "..." else nil
				end
				local Options = value.options
				
				if typeof(Options) == "table" then
					for _, option in Options do
						TotalOptionCount += 1
						
						if FirstOption == nil and typeof(option) == "table" then
							local Title: string = option.title
							FirstOption = if typeof(Title) == "string" then if #Title <= 120 then Title else string.sub(Title, 1, 120) .. "..." else nil
						end
					end
				end
			end
		end
		return {
			questionCount = QuestionCount,
			totalOptionCount = TotalOptionCount,
			firstQuestion = FirstQuestion,
			firstOption = FirstOption
		}
	end,
	formatToolResultPayload = function(p1)
		if typeof(p1) == "table" then
			local Content = p1.content
			local Text = if typeof(Content) == "table" then Content.text else nil
			
			return {
				sessionId = p1.sessionId,
				turnId = p1.turnId,
				referenceId = p1.referenceId,
				isError = p1.isError,
				textLength = if typeof(Text) == "string" then #Text else nil,
				textPreview = if typeof(Text) == "string" then if #Text <= 160 then Text else string.sub(Text, 1, 160) .. "..." else nil
			}
		else
			return { raw = tostring(p1) }
		end
	end,
	formatRequestState = formatRequestState,
	formatTurnState = function(p1)
		return if typeof(p1) == "table" then {
			status = p1.status,
			isDone = p1.isDone,
			error = p1.error,
			errorCode = p1.errorCode,
			stopReason = p1.stopReason,
			assistantTextLength = if typeof(p1.assistantText) == "string" then #p1.assistantText else nil,
			toolCallCount = p1.toolCallCount,
			sessionId = p1.sessionId
		} else { raw = tostring(p1) }
	end,
	rpcFailureMessage = function(p1, p2): string
		-- upvalues: formatRequestState (copy)
		local FormatRequestStateResult = formatRequestState(p2)
		local Status = FormatRequestStateResult.status
		
		if Status == "failed" then
			local ErrorCode = FormatRequestStateResult.errorCode
			local Error = FormatRequestStateResult.error or "unknown error"
			
			return if ErrorCode == nil then `{p1} failed: {Error}` else `{p1} failed ({ErrorCode}): {Error}`
		else
			return if Status == "pending" then `{p1} timed out (still pending)` else `{p1} ended with unexpected state (status={tostring(Status)})`
		end
	end
}