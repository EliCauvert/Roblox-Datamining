local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local tModule = require(currencyTransfers.Parent.t)
local failureReasonModule = require(currencyTransfers.Enums.FailureReason)
local t = {}

function t.new(p0) --[[ line: 17 ]]
	-- upvalues: t (ref)
	assert(t.isValid(p0))
	t.__index = t
	setmetatable(p0, t)
	
	return p0
end

function t.mock(p1) --[[ line: 29 ]]
	-- upvalues: t (ref)
	p1 = p1 or {}
	
	return t.new({
		failureReason = p1.failureReason,
		errorMessage = p1.errorMessage or "",
		ampRecourseActions = p1.ampRecourseActions,
		ampFeatureCheck = p1.ampFeatureCheck
	})
end

function t.format(p2) --[[ line: 42 ]]
	-- upvalues: failureReasonModule (ref), t (ref)
	return t.new({
		failureReason = failureReasonModule.fromValue(p2.FailureReason or p2.failureReason),
		errorMessage = p2.ErrorMessage or (p2.errorMessage or ""),
		ampRecourseActions = p2.AmpRecourseActions or p2.ampRecourseActions,
		ampFeatureCheck = p2.AmpFeatureCheck or p2.ampFeatureCheck
	})
end

t.isValid = tModule.strictInterface({
	failureReason = tModule.optional(tModule.string),
	errorMessage = tModule.string,
	ampRecourseActions = tModule.optional(tModule.array(tModule.string)),
	ampFeatureCheck = tModule.optional(tModule.string)
})

return t