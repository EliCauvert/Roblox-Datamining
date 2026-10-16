local FailureReasonModule = {
	Invalid = "Invalid",
	InvalidInput = "InvalidInput",
	GiftNotFound = "GiftNotFound",
	Unauthorized = "Unauthorized",
	InternalError = "InternalError",
	InsufficientFunds = "InsufficientFunds",
	GiftingDisabledForUser = "GiftingDisabledForUser",
	ReceiverNotAllowed = "ReceiverNotAllowed",
	AmpRecourseAvailable = "AmpRecourseAvailable",
	ChallengeRequired = "ChallengeRequired",
	InvalidGiftState = "InvalidGiftState",
	GiftExpired = "GiftExpired",
	TooManyRequests = "TooManyRequests",
	AllItemsInvalid = "AllItemsInvalid",
	ItemUnavailable = "ItemUnavailable",
	MaxGiftItemsExceeded = "MaxGiftItemsExceeded",
	EndpointDisabled = "EndpointDisabled",
	DependencyUnavailable = "DependencyUnavailable"
}
local t = {}

for _, value in pairs(FailureReasonModule) do
	t[value] = true
end
function FailureReasonModule.fromValue(p1) --[[ Line: 49 ]]
	-- upvalues: t (copy)
	return if p1 == nil or not t[p1] then nil else p1
end

return FailureReasonModule