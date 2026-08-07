local _ = require(script.Parent.types)
local t = {
	BLOCK_REASON_FREE_TRIAL_EXHAUSTED = "FreeTrialExhausted",
	BLOCK_REASON_DAILY_LIMIT_REACHED = "DailyLimitReached",
	BLOCK_REASON_INSUFFICIENT_ROBUX_BALANCE = "InsufficientRobuxBalance"
}

local function _(p0) --[[ line: 13 | named "decodeNumber" ]]
	return if typeof(p0) == "number" then p0 elseif typeof(p0) == "string" then tonumber(p0) or 0 else 0
end

local function decodeDailyLimitSettings(value) --[[ line: 23 ]]
	local var2 = if typeof(value) == "table" then value else {}
	local var3 = if typeof(var2.limitSettings) == "table" then var2.limitSettings else var2
	local t = {
		additionalUsageEnabled = var3.additionalUsageEnabled == true,
		dailyLimitSet = var3.dailyLimitSet == true
	}
	local dailyLimit = var3.dailyLimit
	t.dailyLimit = if typeof(dailyLimit) == "number" then dailyLimit elseif typeof(dailyLimit) == "string" then tonumber(dailyLimit) or 0 else 0
	
	return t
end

local _ = function(p1) --[[ line: 33 | named "decodeQuotaBlockReason" ]]
	-- upvalues: t (ref)
	return if typeof(p1) == "string" then t[p1] else nil
end

return {
	decodeDailyLimitSettings = decodeDailyLimitSettings,
	decodeQuotaSummary = function(p2) --[[ line: 40 ]]
		-- upvalues: decodeDailyLimitSettings (ref), t (ref)
		local var5 = if typeof(p2) == "table" then p2 else {}
		local var6 = if typeof(var5.summary) == "table" then var5.summary else var5
		local t_1 = {}
		local freeTrialDailyAllowance = var6.freeTrialDailyAllowance
		t_1.freeTrialDailyAllowance = if typeof(freeTrialDailyAllowance) == "number" then freeTrialDailyAllowance elseif typeof(freeTrialDailyAllowance) == "string" then tonumber(freeTrialDailyAllowance) or 0 else 0
		local freeTrialRemaining = var6.freeTrialRemaining
		t_1.freeTrialRemaining = if typeof(freeTrialRemaining) == "number" then freeTrialRemaining elseif typeof(freeTrialRemaining) == "string" then tonumber(freeTrialRemaining) or 0 else 0
		local freeTrialPctUsed = var6.freeTrialPctUsed
		t_1.freeTrialPctUsed = if typeof(freeTrialPctUsed) == "number" then freeTrialPctUsed elseif typeof(freeTrialPctUsed) == "string" then tonumber(freeTrialPctUsed) or 0 else 0
		t_1.nextResetEligibleTime = var6.nextResetEligibleTime or ""
		local robuxBalance = var6.robuxBalance
		t_1.robuxBalance = if typeof(robuxBalance) == "number" then robuxBalance elseif typeof(robuxBalance) == "string" then tonumber(robuxBalance) or 0 else 0
		t_1.limitSettings = decodeDailyLimitSettings(var6.limitSettings)
		local robuxSpentToday = var6.robuxSpentToday
		t_1.robuxSpentToday = if typeof(robuxSpentToday) == "number" then robuxSpentToday elseif typeof(robuxSpentToday) == "string" then tonumber(robuxSpentToday) or 0 else 0
		local limitRemaining = var6.limitRemaining
		t_1.limitRemaining = if typeof(limitRemaining) == "number" then limitRemaining elseif typeof(limitRemaining) == "string" then tonumber(limitRemaining) or 0 else 0
		t_1.allowed = if typeof(var6.allowed) == "boolean" then var6.allowed else nil
		local reason = var6.reason
		t_1.reason = if typeof(reason) ~= "string" then t[reason] else nil
		
		return t_1
	end
}