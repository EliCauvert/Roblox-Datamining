local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local tModule = require(currencyTransfers.Parent.t)
local failureReasonModule = require(currencyTransfers.Enums.FailureReason)
local getFFlagEnableLimitHit2SVUpsellModule = require(currencyTransfers.Flags.GetFFlagEnableLimitHit2SVUpsell)
local t = {}

function t.new(p1)
	-- upvalues: t (ref)
	assert(t.isValid(p1))
	t.__index = t
	setmetatable(p1, t)
	
	return p1
end

function t.mock(p1)
	-- upvalues: t (ref)
	p1 = p1 or {}
	
	return t.new({
		failureReason = p1.failureReason,
		errorMessage = p1.errorMessage or "",
		ampRecourseActions = p1.ampRecourseActions,
		ampFeatureCheck = p1.ampFeatureCheck
	})
end

function t.format(p1)
	-- upvalues: getFFlagEnableLimitHit2SVUpsellModule (ref), failureReasonModule (ref), t (ref)
	local failureReason = p1.FailureReason or p1.failureReason
	local errorMessage = p1.ErrorMessage or (p1.errorMessage or "")
	local ampRecourseActions = p1.AmpRecourseActions or p1.ampRecourseActions
	local ampFeatureCheck = p1.AmpFeatureCheck or p1.ampFeatureCheck
	local isEligibleForElevatedLimitUpsell = nil
	
	if getFFlagEnableLimitHit2SVUpsellModule() then
		if p1.IsEligibleForElevatedLimitUpsell ~= nil then
			isEligibleForElevatedLimitUpsell = p1.IsEligibleForElevatedLimitUpsell
		elseif p1.isEligibleForElevatedLimitUpsell ~= nil then
			isEligibleForElevatedLimitUpsell = p1.isEligibleForElevatedLimitUpsell
		end
	end
	return t.new({
		failureReason = failureReasonModule.fromValue(failureReason),
		errorMessage = errorMessage,
		ampRecourseActions = ampRecourseActions,
		ampFeatureCheck = ampFeatureCheck,
		isEligibleForElevatedLimitUpsell = isEligibleForElevatedLimitUpsell
	})
end

t.isValid = tModule.strictInterface({
	failureReason = tModule.optional(tModule.string),
	errorMessage = tModule.string,
	ampRecourseActions = tModule.optional(tModule.array(tModule.string)),
	ampFeatureCheck = tModule.optional(tModule.string),
	isEligibleForElevatedLimitUpsell = tModule.optional(tModule.boolean)
})

return t