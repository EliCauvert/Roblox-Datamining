local httpService = game:GetService("HttpService")
local debugMyStatsExperienceStats = game:DefineFastFlag("DebugMyStatsExperienceStats", false)
local var1 = nil
local var2 = nil
local var3 = nil

local function _(value)
	return math.floor(value * 1000 + 0.5) / 1000
end

local function isEnabled()
	-- upvalues: debugMyStatsExperienceStats (ref)
	return debugMyStatsExperienceStats
end

local function resetTimeline(value)
	-- upvalues: var1 (write), var2 (write), var3 (write)
	var1 = os.clock()
	var2 = value
	var3 = nil
end

local function timelineFields()
	-- upvalues: var1 (write), var2 (write), var3 (write)
	local processTime = os.clock()
	local t = {
		tSec = math.floor((processTime - (var1 or processTime)) * 1000 + 0.5) / 1000
	}
	
	if var2 ~= nil then
		t.timeline = var2
	end
	if var3 ~= nil then
		t.dtSec = math.floor((processTime - var3) * 1000 + 0.5) / 1000
	end
	var3 = processTime
	
	return t
end

local function mergeTimeline(p1)
	-- upvalues: timelineFields (ref)
	local var4 = timelineFields()
	
	if p1 == nil then
		return var4
	elseif typeof(p1) ~= "table" then
		return {
			detail = p1,
			tSec = var4.tSec,
			dtSec = var4.dtSec,
			timeline = var4.timeline
		}
	end
	local cloned = table.clone(p1)
	
	for i, v in var4 do
		cloned[i] = v
	end
	return cloned
end

local _ = function(p2)
	-- upvalues: httpService (ref)
	local ok, status = pcall(httpService.JSONEncode, httpService, p2)
	
	return if ok and typeof(status) == "string" then status else tostring(p2)
end

local _ = function(p2, p3)
	if typeof(p2) ~= "string" then
		return nil
	end
	p3 = p3 or 120
	
	return if #p2 <= p3 then p2 else string.sub(p2, 1, p3) .. "..."
end

local function formatRequestState(p2)
	return if typeof(p2) == "table" then {
		status = p2.status,
		error = p2.error,
		errorCode = p2.errorCode,
		result = p2.result
	} else { raw = tostring(p2) }
end

return {
	LOG_PREFIX = "[MyStats]",
	isEnabled = isEnabled,
	log = function(p2, p3, p4)
		-- upvalues: debugMyStatsExperienceStats (ref), mergeTimeline (ref), httpService (ref)
		if not debugMyStatsExperienceStats then return end
		local var5 = " | %*"
		local var6 = mergeTimeline(p4)
		local ok, status = pcall(httpService.JSONEncode, httpService, var6)
		var5 = var5:format(if ok and typeof(status) == "string" then status else tostring(var6))
		
		if p2 == "warn" then
			warn(`[MyStats] {p3}{var5}`)
			
			return
		end
		print(`[MyStats] {p3}{var5}`)
	end,
	resetTimeline = resetTimeline,
	timelineFields = timelineFields,
	formatStudioAskUserQuestions = function(p2)
		if typeof(p2) ~= "table" then
			return { raw = tostring(p2) }
		end
		local var5 = 0
		local var6 = 0
		local var7 = nil
		local var8 = nil
		
		for i, v in p2 do
			if typeof(v) == "table" then
				var5 += 1
				
				if var7 == nil then
					local question = v.question
					var7 = if typeof(question) ~= "string" then if #question <= 120 then question else string.sub(question, 1, 120) .. "..." else nil
				end
				local options = v.options
				
				if typeof(options) == "table" then
					for i_1, v_1 in options do
						var6 += 1
						
						if var8 == nil and typeof(v_1) == "table" then
							local title = v_1.title
							var8 = if typeof(title) ~= "string" then if #title <= 120 then title else string.sub(title, 1, 120) .. "..." else nil
						end
					end
				end
			end
		end
		return {
			questionCount = var5,
			totalOptionCount = var6,
			firstQuestion = var7,
			firstOption = var8
		}
	end,
	formatToolResultPayload = function(p3)
		if typeof(p3) == "table" then
			local content = p3.content
			local var9 = if typeof(content) == "table" then content.text else nil
			
			return {
				sessionId = p3.sessionId,
				turnId = p3.turnId,
				referenceId = p3.referenceId,
				isError = p3.isError,
				textLength = if typeof(var9) == "string" then #var9 else nil,
				textPreview = if typeof(var9) ~= "string" then if #var9 <= 160 then var9 else string.sub(var9, 1, 160) .. "..." else nil
			}
		end
		return { raw = tostring(p3) }
	end,
	formatRequestState = formatRequestState,
	formatTurnState = function(p3)
		return if typeof(p3) == "table" then {
			status = p3.status,
			isDone = p3.isDone,
			error = p3.error,
			errorCode = p3.errorCode,
			stopReason = p3.stopReason,
			assistantTextLength = if typeof(p3.assistantText) == "string" then #p3.assistantText else nil,
			toolCallCount = p3.toolCallCount,
			sessionId = p3.sessionId
		} else { raw = tostring(p3) }
	end,
	rpcFailureMessage = function(p3, p4)
		-- upvalues: formatRequestState (ref)
		local var9 = formatRequestState(p4)
		local status = var9.status
		
		if status == "failed" then
			local errorCode = var9.errorCode
			local error = var9.error or "unknown error"
			
			return if errorCode == nil then `{p3} failed: {error}` else `{p3} failed ({errorCode}): {error}`
		end
		return if status == "pending" then `{p3} timed out (still pending)` else `{p3} ended with unexpected state (status={tostring(status)})`
	end
}