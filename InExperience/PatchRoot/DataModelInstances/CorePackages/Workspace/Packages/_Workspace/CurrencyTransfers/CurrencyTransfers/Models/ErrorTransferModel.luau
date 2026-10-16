local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local TModule = require(CurrencyTransfers.Parent.t)
local FailureReasonModule = require(CurrencyTransfers.Enums.FailureReason)
local GetFFlagEnableLimitHit2SVUpsellModule = require(CurrencyTransfers.Flags.GetFFlagEnableLimitHit2SVUpsell)
local ErrorTransferModelModule = {}

function ErrorTransferModelModule.new(p1) --[[ Line: 20 ]]
	-- upvalues: ErrorTransferModelModule (copy)
	assert(ErrorTransferModelModule.isValid(p1))
	ErrorTransferModelModule.__index = ErrorTransferModelModule
	setmetatable(p1, ErrorTransferModelModule)
	
	return p1
end

function ErrorTransferModelModule.mock(p1) --[[ Line: 32 ]]
	-- upvalues: ErrorTransferModelModule (copy)
	local P1 = p1 or {}
	
	return (ErrorTransferModelModule.new({
		failureReason = P1.failureReason,
		errorMessage = P1.errorMessage or "",
		ampRecourseActions = P1.ampRecourseActions,
		ampFeatureCheck = P1.ampFeatureCheck
	}))
end

function ErrorTransferModelModule.format(p1) --[[ Line: 45 ]]
	-- upvalues: GetFFlagEnableLimitHit2SVUpsellModule (copy), FailureReasonModule (copy), ErrorTransferModelModule (copy)
	local FailureReason = p1.FailureReason or p1.failureReason
	local ErrorMessage = p1.ErrorMessage or (p1.errorMessage or "")
	local AmpRecourseActions = p1.AmpRecourseActions or p1.ampRecourseActions
	local AmpFeatureCheck = p1.AmpFeatureCheck or p1.ampFeatureCheck
	local IsEligibleForElevatedLimitUpsell = nil
	
	if GetFFlagEnableLimitHit2SVUpsellModule() then
		if p1.IsEligibleForElevatedLimitUpsell == nil then
			if p1.isEligibleForElevatedLimitUpsell ~= nil then
				IsEligibleForElevatedLimitUpsell = p1.isEligibleForElevatedLimitUpsell
			end
		else
			IsEligibleForElevatedLimitUpsell = p1.IsEligibleForElevatedLimitUpsell
		end
	end
	return (ErrorTransferModelModule.new({
		failureReason = FailureReasonModule.fromValue(FailureReason),
		errorMessage = ErrorMessage,
		ampRecourseActions = AmpRecourseActions,
		ampFeatureCheck = AmpFeatureCheck,
		isEligibleForElevatedLimitUpsell = IsEligibleForElevatedLimitUpsell
	}))
end

ErrorTransferModelModule.isValid = TModule.strictInterface({
	failureReason = TModule.optional(TModule.string),
	errorMessage = TModule.string,
	ampRecourseActions = TModule.optional(TModule.array(TModule.string)),
	ampFeatureCheck = TModule.optional(TModule.string),
	isEligibleForElevatedLimitUpsell = TModule.optional(TModule.boolean)
})

return ErrorTransferModelModule