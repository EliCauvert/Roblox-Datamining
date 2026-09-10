local _ = require(script.Parent.types)
local t = {
	BLOCK_REASON_FREE_TRIAL_EXHAUSTED = "FreeTrialExhausted",
	BLOCK_REASON_DAILY_LIMIT_REACHED = "DailyLimitReached",
	BLOCK_REASON_INSUFFICIENT_ROBUX_BALANCE = "InsufficientRobuxBalance"
}
local t_1 = {
	FREE_TRIAL_RESET_PERIOD_DAILY = "Daily",
	FREE_TRIAL_RESET_PERIOD_WEEKLY = "Weekly",
	FREE_TRIAL_RESET_PERIOD_MONTHLY = "Monthly"
}

local function _(p1)
	return if typeof(p1) == "number" then p1 elseif typeof(p1) == "string" then tonumber(p1) or 0 else 0
end

local function decodeDailyLimitSettings(value)
	local var1 = if typeof(value) == "table" then value else {}
	local var2 = if typeof(var1.limitSettings) == "table" then var1.limitSettings else var1
	local t = {
		additionalUsageEnabled = var2.additionalUsageEnabled == true,
		dailyLimitSet = var2.dailyLimitSet == true
	}
	local dailyLimit = var2.dailyLimit
	t.dailyLimit = if typeof(dailyLimit) == "number" then dailyLimit elseif typeof(dailyLimit) == "string" then tonumber(dailyLimit) or 0 else 0
	
	return t
end

local _ = function(p1)
	-- upvalues: t (ref)
	return if typeof(p1) == "string" then t[p1] else nil
end

local _ = function(value)
	-- upvalues: t_1 (ref)
	return if typeof(value) == "string" then t_1[value] or "Daily" else "Daily"
end

return {
	decodeDailyLimitSettings = decodeDailyLimitSettings,
	decodeQuotaSummary = function(p1)
		-- upvalues: decodeDailyLimitSettings (ref), t (ref), t_1 (ref)
		local var1 = if typeof(p1) == "table" then p1 else {}
		local var2 = if typeof(var1.summary) == "table" then var1.summary else var1
		local t_2 = {}
		local freeTrialDailyAllowance = var2.freeTrialDailyAllowance
		t_2.freeTrialDailyAllowance = if typeof(freeTrialDailyAllowance) == "number" then freeTrialDailyAllowance elseif typeof(freeTrialDailyAllowance) == "string" then tonumber(freeTrialDailyAllowance) or 0 else 0
		local freeTrialRemaining = var2.freeTrialRemaining
		t_2.freeTrialRemaining = if typeof(freeTrialRemaining) == "number" then freeTrialRemaining elseif typeof(freeTrialRemaining) == "string" then tonumber(freeTrialRemaining) or 0 else 0
		local freeTrialPctUsed = var2.freeTrialPctUsed
		t_2.freeTrialPctUsed = if typeof(freeTrialPctUsed) == "number" then freeTrialPctUsed elseif typeof(freeTrialPctUsed) == "string" then tonumber(freeTrialPctUsed) or 0 else 0
		t_2.nextResetEligibleTime = var2.nextResetEligibleTime or ""
		local robuxBalance = var2.robuxBalance
		t_2.robuxBalance = if typeof(robuxBalance) == "number" then robuxBalance elseif typeof(robuxBalance) == "string" then tonumber(robuxBalance) or 0 else 0
		t_2.limitSettings = decodeDailyLimitSettings(var2.limitSettings)
		local robuxSpentToday = var2.robuxSpentToday
		t_2.robuxSpentToday = if typeof(robuxSpentToday) == "number" then robuxSpentToday elseif typeof(robuxSpentToday) == "string" then tonumber(robuxSpentToday) or 0 else 0
		local limitRemaining = var2.limitRemaining
		t_2.limitRemaining = if typeof(limitRemaining) == "number" then limitRemaining elseif typeof(limitRemaining) == "string" then tonumber(limitRemaining) or 0 else 0
		t_2.allowed = if typeof(var2.allowed) == "boolean" then var2.allowed else nil
		local reason = var2.reason
		t_2.reason = if typeof(reason) ~= "string" then t[reason] else nil
		local freeTrialResetPeriod = var2.freeTrialResetPeriod
		t_2.freeTrialResetPeriod = if typeof(freeTrialResetPeriod) ~= "string" then t_1[freeTrialResetPeriod] or "Daily" else "Daily"
		
		return t_2
	end
}