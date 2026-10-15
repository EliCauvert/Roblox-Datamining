local t = {
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
local t_1 = {}

for i, v in pairs(t) do
	t_1[v] = true
end
function t.fromValue(p1)
	-- upvalues: t_1 (ref)
	return if p1 == nil or not t_1[p1] then nil else p1
end

return t