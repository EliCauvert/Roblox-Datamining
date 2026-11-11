local FailureReasonModule = {
	Invalid = "Invalid",
	InvalidInput = "InvalidInput",
	TransferNotFound = "TransferNotFound",
	Unauthorized = "Unauthorized",
	InternalError = "InternalError",
	TransferDailyLimitExceeded = "TransferDailyLimitExceeded",
	TransferMonthlyLimitExceeded = "TransferMonthlyLimitExceeded",
	InsufficientFunds = "InsufficientFunds",
	UserNotAllowed = "UserNotAllowed",
	TransferExpired = "TransferExpired",
	TooManyRequests = "TooManyRequests",
	TransferAlreadyProcessed = "TransferAlreadyProcessed",
	InvalidTransferState = "InvalidTransferState",
	AmpRecourseAvailable = "AmpRecourseAvailable",
	TransferDisabledForUser = "TransferDisabledForUser",
	ReceiverNotAllowed = "ReceiverNotAllowed",
	ReceiveLimitExceeded = "ReceiveLimitExceeded",
	TransferAmountBelowMinimum = "TransferAmountBelowMinimum",
	TransferAmountExceedsMaximum = "TransferAmountExceedsMaximum",
	TransferAmountExceedsNonSecuredMaximum = "TransferAmountExceedsNonSecuredMaximum"
}
local config = {
	[0] = FailureReasonModule.Invalid,
	[1] = FailureReasonModule.InvalidInput,
	[2] = FailureReasonModule.TransferNotFound,
	[3] = FailureReasonModule.Unauthorized,
	[4] = FailureReasonModule.InternalError,
	[5] = FailureReasonModule.TransferDailyLimitExceeded,
	[6] = FailureReasonModule.TransferMonthlyLimitExceeded,
	[7] = FailureReasonModule.InsufficientFunds,
	[8] = FailureReasonModule.UserNotAllowed,
	[9] = FailureReasonModule.TransferExpired,
	[10] = FailureReasonModule.TooManyRequests,
	[11] = FailureReasonModule.TransferAlreadyProcessed,
	[12] = FailureReasonModule.InvalidTransferState,
	[13] = FailureReasonModule.AmpRecourseAvailable,
	[14] = FailureReasonModule.TransferDisabledForUser,
	[15] = FailureReasonModule.ReceiverNotAllowed,
	[16] = FailureReasonModule.TransferAmountBelowMinimum,
	[17] = FailureReasonModule.TransferAmountExceedsMaximum,
	[18] = FailureReasonModule.TransferAmountExceedsNonSecuredMaximum,
	[19] = FailureReasonModule.ReceiveLimitExceeded
}

function FailureReasonModule.fromValue(p1)
	-- upvalues: config (copy), FailureReasonModule (copy)
	if p1 == nil then
		return nil
	end
	if type(p1) == "number" then
		return config[p1]
	end
	if type(p1) == "string" then
		for _, value in pairs(FailureReasonModule) do
			if value == p1 then
				return p1
			end
		end
	end
	return nil
end

return FailureReasonModule