local _ = require(script.Parent.types)
local config = {
	BLOCK_REASON_FREE_TRIAL_EXHAUSTED = "FreeTrialExhausted",
	BLOCK_REASON_DAILY_LIMIT_REACHED = "DailyLimitReached",
	BLOCK_REASON_INSUFFICIENT_ROBUX_BALANCE = "InsufficientRobuxBalance"
}
local config1 = {
	FREE_TRIAL_RESET_PERIOD_DAILY = "Daily",
	FREE_TRIAL_RESET_PERIOD_WEEKLY = "Weekly",
	FREE_TRIAL_RESET_PERIOD_MONTHLY = "Monthly"
}

local function _(p1) --[[ Line: 20 | Named "decodeNumber" ]]
	return if typeof(p1) == "number" then p1 else typeof(p1) == "string" and tonumber(p1) or 0
end

local function decodeDailyLimitSettings(LimitSettings) --[[ Line: 30 ]]
	local LimitSettings1 = if typeof(LimitSettings) == "table" then LimitSettings else {}
	local LimitSettings2 = if typeof(LimitSettings1.limitSettings) == "table" then LimitSettings1.limitSettings else LimitSettings1
	local DailyLimit = LimitSettings2.dailyLimit
	
	return {
		additionalUsageEnabled = LimitSettings2.additionalUsageEnabled == true,
		dailyLimitSet = LimitSettings2.dailyLimitSet == true,
		dailyLimit = if typeof(DailyLimit) == "number" then DailyLimit else typeof(DailyLimit) == "string" and tonumber(DailyLimit) or 0
	}
end

local _ = function(p1) --[[ Line: 40 | Named "decodeQuotaBlockReason" ]]
	-- upvalues: config (copy)
	return if typeof(p1) == "string" then config[p1] else nil
end

local _ = function(p1) --[[ Line: 50 | Named "decodeFreeTrialResetPeriod" ]]
	-- upvalues: config1 (copy)
	return typeof(p1) == "string" and config1[p1] or "Daily"
end

return {
	decodeDailyLimitSettings = decodeDailyLimitSettings,
	decodeQuotaSummary = function(p1) --[[ Line: 57 ]]
		-- upvalues: decodeDailyLimitSettings (copy), config (copy), config1 (copy)
		local T = if typeof(p1) == "table" then p1 else {}
		local Summary = if typeof(T.summary) == "table" then T.summary else T
		local FreeTrialDailyAllowance = Summary.freeTrialDailyAllowance
		local FreeTrialDailyAllowance1 = if typeof(FreeTrialDailyAllowance) == "number" then FreeTrialDailyAllowance else typeof(FreeTrialDailyAllowance) == "string" and tonumber(FreeTrialDailyAllowance) or 0
		local FreeTrialRemaining = Summary.freeTrialRemaining
		local FreeTrialRemaining1 = if typeof(FreeTrialRemaining) == "number" then FreeTrialRemaining else typeof(FreeTrialRemaining) == "string" and tonumber(FreeTrialRemaining) or 0
		local FreeTrialPctUsed = Summary.freeTrialPctUsed
		local FreeTrialPctUsed1 = if typeof(FreeTrialPctUsed) == "number" then FreeTrialPctUsed else typeof(FreeTrialPctUsed) == "string" and tonumber(FreeTrialPctUsed) or 0
		local RobuxBalance = Summary.robuxBalance
		local RobuxBalance1 = if typeof(RobuxBalance) == "number" then RobuxBalance else typeof(RobuxBalance) == "string" and tonumber(RobuxBalance) or 0
		local RobuxSpentToday = Summary.robuxSpentToday
		local RobuxSpentToday1 = if typeof(RobuxSpentToday) == "number" then RobuxSpentToday else typeof(RobuxSpentToday) == "string" and tonumber(RobuxSpentToday) or 0
		local LimitRemaining = Summary.limitRemaining
		local LimitRemaining1 = if typeof(LimitRemaining) == "number" then LimitRemaining else typeof(LimitRemaining) == "string" and tonumber(LimitRemaining) or 0
		local Reason = Summary.reason
		local Entry = if typeof(Reason) == "string" then config[Reason] else nil
		local FreeTrialResetPeriod = Summary.freeTrialResetPeriod
		
		return {
			freeTrialDailyAllowance = FreeTrialDailyAllowance1,
			freeTrialRemaining = FreeTrialRemaining1,
			freeTrialPctUsed = FreeTrialPctUsed1,
			nextResetEligibleTime = Summary.nextResetEligibleTime or "",
			robuxBalance = RobuxBalance1,
			limitSettings = decodeDailyLimitSettings(Summary.limitSettings),
			robuxSpentToday = RobuxSpentToday1,
			limitRemaining = LimitRemaining1,
			allowed = if typeof(Summary.allowed) == "boolean" then Summary.allowed else nil,
			reason = Entry,
			freeTrialResetPeriod = typeof(FreeTrialResetPeriod) == "string" and config1[FreeTrialResetPeriod] or "Daily"
		}
	end
}