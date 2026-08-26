local t = {
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
local t_1 = {
	[0] = t.Invalid,
	[1] = t.InvalidInput,
	[2] = t.TransferNotFound,
	[3] = t.Unauthorized,
	[4] = t.InternalError,
	[5] = t.TransferDailyLimitExceeded,
	[6] = t.TransferMonthlyLimitExceeded,
	[7] = t.InsufficientFunds,
	[8] = t.UserNotAllowed,
	[9] = t.TransferExpired,
	[10] = t.TooManyRequests,
	[11] = t.TransferAlreadyProcessed,
	[12] = t.InvalidTransferState,
	[13] = t.AmpRecourseAvailable,
	[14] = t.TransferDisabledForUser,
	[15] = t.ReceiverNotAllowed,
	[16] = t.TransferAmountBelowMinimum,
	[17] = t.TransferAmountExceedsMaximum,
	[18] = t.TransferAmountExceedsNonSecuredMaximum,
	[19] = t.ReceiveLimitExceeded
}

function t.fromValue(p1)
	-- upvalues: t_1 (ref), t (ref)
	if p1 == nil then
		return nil
	elseif type(p1) == "number" then
		return t_1[p1]
	elseif type(p1) == "string" then
		for i, v in pairs(t) do
			if v == p1 then
				return p1
			end
		end
	end
	return nil
end

return t