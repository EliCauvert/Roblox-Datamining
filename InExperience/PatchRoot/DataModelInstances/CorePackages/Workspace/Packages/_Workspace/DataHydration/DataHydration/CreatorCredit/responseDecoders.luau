local _ = require(script.Parent.types)
local FFlagBuildExperienceModelPickerData = require(script:FindFirstAncestor("DataHydration").Parent.SharedFlags).FFlagBuildExperienceModelPickerData
local config = {
	BLOCK_REASON_FREE_TRIAL_EXHAUSTED = "FreeTrialExhausted",
	BLOCK_REASON_DAILY_LIMIT_REACHED = "DailyLimitReached",
	BLOCK_REASON_INSUFFICIENT_ROBUX_BALANCE = "InsufficientRobuxBalance",
	[1] = "InsufficientRobuxBalance",
	[2] = "DailyLimitReached",
	[3] = "FreeTrialExhausted"
}
local config1 = {
	MODEL_TIER_DEFAULT = "default",
	MODEL_TIER_ADVANCED = "advanced",
	[1] = "default",
	[2] = "advanced"
}
local config2 = {
	FREE_TRIAL_RESET_PERIOD_DAILY = "Daily",
	FREE_TRIAL_RESET_PERIOD_WEEKLY = "Weekly",
	FREE_TRIAL_RESET_PERIOD_MONTHLY = "Monthly"
}

local function _(p1)
	return if typeof(p1) == "number" then p1 else typeof(p1) == "string" and tonumber(p1) or 0
end

local function decodeDailyLimitSettings(LimitSettings)
	local LimitSettings1 = if typeof(LimitSettings) == "table" then LimitSettings else {}
	local LimitSettings2 = if typeof(LimitSettings1.limitSettings) == "table" then LimitSettings1.limitSettings else LimitSettings1
	local DailyLimit = LimitSettings2.dailyLimit
	
	return {
		additionalUsageEnabled = LimitSettings2.additionalUsageEnabled == true,
		dailyLimitSet = LimitSettings2.dailyLimitSet == true,
		dailyLimit = if typeof(DailyLimit) == "number" then DailyLimit else typeof(DailyLimit) == "string" and tonumber(DailyLimit) or 0
	}
end

local _ = function(p1)
	-- upvalues: config (copy)
	return if typeof(p1) == "string" then config[p1] else nil
end

local _ = function(p1)
	-- upvalues: config2 (copy)
	return typeof(p1) == "string" and config2[p1] or "Daily"
end

local _ = function(p1)
	-- upvalues: config1 (copy)
	return if typeof(p1) == "string" or typeof(p1) == "number" then config1[p1] else nil
end

local _ = function(p1)
	if typeof(p1) == "number" or typeof(p1) == "string" then
		local Number: number? = tonumber(p1)
		
		return if Number == nil or Number < 0 or Number > 9007199254740991 or Number % 1 ~= 0 then nil else Number
	else
		return nil
	end
end

local function decodeQuotaSummary(p1)
	-- upvalues: decodeDailyLimitSettings (copy), config (copy), config2 (copy), FFlagBuildExperienceModelPickerData (copy), config1 (copy)
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
	local config3 = {
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
		freeTrialResetPeriod = typeof(FreeTrialResetPeriod) == "string" and config2[FreeTrialResetPeriod] or "Daily"
	}
	
	if FFlagBuildExperienceModelPickerData then
		local BlockDetails = Summary.blockDetails
		
		if typeof(BlockDetails) == "table" then
			local ModelTier = BlockDetails.modelTier
			local BlockDetails1 = {
				modelTier = if typeof(ModelTier) == "string" or typeof(ModelTier) == "number" then config1[ModelTier] else nil
			}
			local RequiredRobux = BlockDetails.requiredRobux
			local Number2 = nil
			
			if typeof(RequiredRobux) == "number" or typeof(RequiredRobux) == "string" then
				local Number: number? = tonumber(RequiredRobux)
				Number2 = if Number == nil or Number < 0 or (Number > 9007199254740991 or Number % 1 ~= 0) then nil else Number
			else
				Number2 = nil
			end
			BlockDetails1.requiredRobux = Number2
			local AvailableRobux = BlockDetails.availableRobux
			local Number1 = nil
			
			if typeof(AvailableRobux) == "number" or typeof(AvailableRobux) == "string" then
				local Number: number? = tonumber(AvailableRobux)
				Number1 = if Number == nil or Number < 0 or Number > 9007199254740991 or Number % 1 ~= 0 then nil else Number
			else
				Number1 = nil
			end
			BlockDetails1.availableRobux = Number1
			config3.blockDetails = BlockDetails1
		end
	end
	return config3
end

return {
	decodeDailyLimitSettings = decodeDailyLimitSettings,
	decodeQuotaSummary = decodeQuotaSummary,
	decodeTierQuotaSummary = function(p1)
		-- upvalues: decodeQuotaSummary (copy), config (copy)
		local DecodeQuotaSummaryResult = decodeQuotaSummary(p1)
		local Summary = if typeof(p1) == "table" then p1.summary else nil
		
		if typeof(Summary) == "table" then
			if Summary.allowed == nil then
				DecodeQuotaSummaryResult.allowed = false
			end
			if typeof(Summary.reason) == "number" then
				DecodeQuotaSummaryResult.reason = config[Summary.reason]
			end
		end
		return DecodeQuotaSummaryResult
	end
}