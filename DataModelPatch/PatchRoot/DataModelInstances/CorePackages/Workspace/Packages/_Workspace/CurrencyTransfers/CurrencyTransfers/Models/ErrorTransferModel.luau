local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local TModule = require(CurrencyTransfers.Parent.t)
local FailureReasonModule = require(CurrencyTransfers.Enums.FailureReason)
local ErrorTransferModelModule = {}

function ErrorTransferModelModule.new(p1)
	-- upvalues: ErrorTransferModelModule (copy)
	assert(ErrorTransferModelModule.isValid(p1))
	ErrorTransferModelModule.__index = ErrorTransferModelModule
	setmetatable(p1, ErrorTransferModelModule)
	
	return p1
end

function ErrorTransferModelModule.mock(p1)
	-- upvalues: ErrorTransferModelModule (copy)
	local P1 = p1 or {}
	
	return (ErrorTransferModelModule.new({
		failureReason = P1.failureReason,
		errorMessage = P1.errorMessage or "",
		ampRecourseActions = P1.ampRecourseActions,
		ampFeatureCheck = P1.ampFeatureCheck
	}))
end

function ErrorTransferModelModule.format(p1)
	-- upvalues: FailureReasonModule (copy), ErrorTransferModelModule (copy)
	return (ErrorTransferModelModule.new({
		failureReason = FailureReasonModule.fromValue(p1.FailureReason or p1.failureReason),
		errorMessage = p1.ErrorMessage or (p1.errorMessage or ""),
		ampRecourseActions = p1.AmpRecourseActions or p1.ampRecourseActions,
		ampFeatureCheck = p1.AmpFeatureCheck or p1.ampFeatureCheck
	}))
end

ErrorTransferModelModule.isValid = TModule.strictInterface({
	failureReason = TModule.optional(TModule.string),
	errorMessage = TModule.string,
	ampRecourseActions = TModule.optional(TModule.array(TModule.string)),
	ampFeatureCheck = TModule.optional(TModule.string)
})

return ErrorTransferModelModule