local httpService = game:GetService("HttpService")
local debugMyStatsExperienceStats = game:DefineFastFlag("DebugMyStatsExperienceStats", false)
local var2 = nil
local var3 = nil
local var4 = nil

local function _(value)
	return math.floor(value * 1000 + 0.5) / 1000
end

local function isEnabled()
	-- upvalues: debugMyStatsExperienceStats (ref)
	return debugMyStatsExperienceStats
end

local function resetTimeline(value)
	-- upvalues: var2 (write), var3 (write), var4 (write)
	var2 = os.clock()
	var3 = value
	var4 = nil
end

local function timelineFields()
	-- upvalues: var2 (write), var3 (write), var4 (write)
	local processTime = os.clock()
	local t = {
		tSec = math.floor((processTime - (var2 or processTime)) * 1000 + 0.5) / 1000
	}
	
	if var3 ~= nil then
		t.timeline = var3
	end
	if var4 ~= nil then
		t.dtSec = math.floor((processTime - var4) * 1000 + 0.5) / 1000
	end
	var4 = processTime
	
	return t
end

local function mergeTimeline(p0)
	-- upvalues: timelineFields (ref)
	local var12 = timelineFields()
	
	if p0 == nil then
		return var12
	elseif typeof(p0) ~= "table" then
		return {
			detail = p0,
			tSec = var12.tSec,
			dtSec = var12.dtSec,
			timeline = var12.timeline
		}
	end
	local cloned = table.clone(p0)
	
	for i, v in var12 do
		cloned[i] = v
	end
	return cloned
end

local _ = function(p1)
	-- upvalues: httpService (ref)
	local ok, status = pcall(httpService.JSONEncode, httpService, p1)
	
	return if ok and typeof(status) == "string" then status else tostring(p1)
end

local _ = function(p2, p3)
	if typeof(p2) ~= "string" then
		return nil
	end
	p3 = p3 or 120
	
	return if #p2 <= p3 then p2 else string.sub(p2, 1, p3) .. "..."
end

local function formatRequestState(p4)
	return if typeof(p4) == "table" then {
		status = p4.status,
		error = p4.error,
		errorCode = p4.errorCode,
		result = p4.result
	} else { raw = tostring(p4) }
end

return {
	LOG_PREFIX = "[MyStats]",
	isEnabled = isEnabled,
	log = function(p5, p6, p7)
		-- upvalues: debugMyStatsExperienceStats (ref), mergeTimeline (ref), httpService (ref)
		if not debugMyStatsExperienceStats then return end
		local var15 = " | %*"
		local var16 = mergeTimeline(p7)
		local ok, status = pcall(httpService.JSONEncode, httpService, var16)
		var15 = var15:format(if ok and typeof(status) == "string" then status else tostring(var16))
		
		if p5 == "warn" then
			warn(`[MyStats] {p6}{var15}`)
			
			return
		end
		print(`[MyStats] {p6}{var15}`)
	end,
	resetTimeline = resetTimeline,
	timelineFields = timelineFields,
	formatStudioAskUserQuestions = function(p8)
		if typeof(p8) ~= "table" then
			return { raw = tostring(p8) }
		end
		local var17 = 0
		local var18 = 0
		local var19 = nil
		local var20 = nil
		
		for i, v in p8 do
			if typeof(v) == "table" then
				var17 += 1
				
				if var19 == nil then
					local question = v.question
					var19 = if typeof(question) ~= "string" then if #question <= 120 then question else string.sub(question, 1, 120) .. "..." else nil
				end
				local options = v.options
				
				if typeof(options) == "table" then
					for i_1, v_1 in options do
						var18 += 1
						
						if var20 == nil and typeof(v_1) == "table" then
							local title = v_1.title
							var20 = if typeof(title) ~= "string" then if #title <= 120 then title else string.sub(title, 1, 120) .. "..." else nil
						end
					end
				end
			end
		end
		return {
			questionCount = var17,
			totalOptionCount = var18,
			firstQuestion = var19,
			firstOption = var20
		}
	end,
	formatToolResultPayload = function(p9)
		if typeof(p9) == "table" then
			local content = p9.content
			local var21 = if typeof(content) == "table" then content.text else nil
			
			return {
				sessionId = p9.sessionId,
				turnId = p9.turnId,
				referenceId = p9.referenceId,
				isError = p9.isError,
				textLength = if typeof(var21) == "string" then #var21 else nil,
				textPreview = if typeof(var21) ~= "string" then if #var21 <= 160 then var21 else string.sub(var21, 1, 160) .. "..." else nil
			}
		end
		return { raw = tostring(p9) }
	end,
	formatRequestState = formatRequestState,
	formatTurnState = function(p10)
		return if typeof(p10) == "table" then {
			status = p10.status,
			isDone = p10.isDone,
			error = p10.error,
			errorCode = p10.errorCode,
			stopReason = p10.stopReason,
			assistantTextLength = if typeof(p10.assistantText) == "string" then #p10.assistantText else nil,
			toolCallCount = p10.toolCallCount,
			sessionId = p10.sessionId
		} else { raw = tostring(p10) }
	end,
	rpcFailureMessage = function(p11, p12)
		-- upvalues: formatRequestState (ref)
		local var22 = formatRequestState(p12)
		local status = var22.status
		
		if status == "failed" then
			local errorCode = var22.errorCode
			local error = var22.error or "unknown error"
			
			return if errorCode == nil then `{p11} failed: {error}` else `{p11} failed ({errorCode}): {error}`
		end
		return if status == "pending" then `{p11} timed out (still pending)` else `{p11} ended with unexpected state (status={tostring(status)})`
	end
}