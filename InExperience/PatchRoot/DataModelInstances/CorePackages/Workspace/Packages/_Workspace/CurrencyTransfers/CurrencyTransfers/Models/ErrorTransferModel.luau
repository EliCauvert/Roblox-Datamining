local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local tModule = require(currencyTransfers.Parent.t)
local failureReasonModule = require(currencyTransfers.Enums.FailureReason)
local getFFlagEnableLimitHit2SVUpsellModule = require(currencyTransfers.Flags.GetFFlagEnableLimitHit2SVUpsell)
local t = {}

function t.new(p0) --[[ line: 20 ]]
	-- upvalues: t (ref)
	assert(t.isValid(p0))
	t.__index = t
	setmetatable(p0, t)
	
	return p0
end

function t.mock(p1) --[[ line: 32 ]]
	-- upvalues: t (ref)
	p1 = p1 or {}
	
	return t.new({
		failureReason = p1.failureReason,
		errorMessage = p1.errorMessage or "",
		ampRecourseActions = p1.ampRecourseActions,
		ampFeatureCheck = p1.ampFeatureCheck
	})
end

function t.format(p2) --[[ line: 45 ]]
	-- upvalues: getFFlagEnableLimitHit2SVUpsellModule (ref), failureReasonModule (ref), t (ref)
	local failureReason = p2.FailureReason or p2.failureReason
	local errorMessage = p2.ErrorMessage or (p2.errorMessage or "")
	local ampRecourseActions = p2.AmpRecourseActions or p2.ampRecourseActions
	local ampFeatureCheck = p2.AmpFeatureCheck or p2.ampFeatureCheck
	local isEligibleForElevatedLimitUpsell = nil
	
	if getFFlagEnableLimitHit2SVUpsellModule() then
		if p2.IsEligibleForElevatedLimitUpsell ~= nil then
			isEligibleForElevatedLimitUpsell = p2.IsEligibleForElevatedLimitUpsell
		elseif p2.isEligibleForElevatedLimitUpsell ~= nil then
			isEligibleForElevatedLimitUpsell = p2.isEligibleForElevatedLimitUpsell
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