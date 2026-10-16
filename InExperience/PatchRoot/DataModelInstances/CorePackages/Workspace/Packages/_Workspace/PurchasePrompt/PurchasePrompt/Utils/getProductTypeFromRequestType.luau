local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local _ = purchasePrompt.Parent
local requestTypeModule = require(purchasePrompt.Enums.RequestType)
local productTypeEnum = require(purchasePrompt.types).ProductTypeEnum
local t = {
	[requestTypeModule.Asset] = productTypeEnum.Asset,
	[requestTypeModule.Bundle] = productTypeEnum.Bundle,
	[requestTypeModule.GamePass] = productTypeEnum.Gamepass,
	[requestTypeModule.Product] = productTypeEnum.Product,
	[requestTypeModule.AvatarCreationFee] = productTypeEnum.AvatarCreationFee,
	[requestTypeModule.Experience] = productTypeEnum.Experience,
	[requestTypeModule.Look] = productTypeEnum.Look,
	[requestTypeModule.DeveloperSubscription] = productTypeEnum.DeveloperSubscription
}

function getProductTypeFromRequestType(p1)
	-- upvalues: t (ref), productTypeEnum (ref)
	return t[p1] or productTypeEnum.Unknown
end

return getProductTypeFromRequestType