local CreatorCreditModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorCredit)

local function _(p1: number): string
	return if p1 <= 0 then "0" elseif p1 < 100 then "1-99" elseif p1 < 500 then "100-499" else "500+"
end

local _ = function(p1): string
	return if p1 then "true" else "false"
end

return function(Context)
	-- upvalues: CreatorCreditModule (copy)
	local t = {}
	
	if Context ~= nil then
		t.context = Context
	end
	local DataResult = CreatorCreditModule.getCreatorCreditStore(false).getQuotaSummarySignals().data(false)
	
	if DataResult == nil then
		return t
	end
	local LimitSettings = DataResult.limitSettings
	
	if LimitSettings ~= nil then
		local IsAdditionalUsageEnabled = LimitSettings.additionalUsageEnabled == true
		t.additionalUsageEnabled = if IsAdditionalUsageEnabled then "true" else "false"
		local IsDailyLimitSet = LimitSettings.dailyLimitSet == true
		t.dailyLimitSet = if IsDailyLimitSet then "true" else "false"
	end
	if type(DataResult.freeTrialRemaining) == "number" then
		local IsFreeTrialRemainingBelow = DataResult.freeTrialRemaining <= 0
		t.freeTrialRemainingZero = if IsFreeTrialRemainingBelow then "true" else "false"
	end
	if type(DataResult.robuxBalance) == "number" then
		local RobuxBalance: number = DataResult.robuxBalance
		t.robuxBalanceBucket = if RobuxBalance <= 0 then "0" elseif RobuxBalance < 100 then "1-99" elseif RobuxBalance < 500 then "100-499" else "500+"
	end
	return t
end