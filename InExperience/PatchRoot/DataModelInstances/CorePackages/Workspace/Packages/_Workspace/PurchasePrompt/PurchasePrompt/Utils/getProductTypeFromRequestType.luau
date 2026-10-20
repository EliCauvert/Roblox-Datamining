local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local _ = PurchasePrompt.Parent
local RequestTypeModule = require(PurchasePrompt.Enums.RequestType)
local ProductTypeEnum = require(PurchasePrompt.types).ProductTypeEnum
local config = {
	[RequestTypeModule.Asset] = ProductTypeEnum.Asset,
	[RequestTypeModule.Bundle] = ProductTypeEnum.Bundle,
	[RequestTypeModule.GamePass] = ProductTypeEnum.Gamepass,
	[RequestTypeModule.Product] = ProductTypeEnum.Product,
	[RequestTypeModule.AvatarCreationFee] = ProductTypeEnum.AvatarCreationFee,
	[RequestTypeModule.Experience] = ProductTypeEnum.Experience,
	[RequestTypeModule.Look] = ProductTypeEnum.Look,
	[RequestTypeModule.DeveloperSubscription] = ProductTypeEnum.DeveloperSubscription,
	[RequestTypeModule.VIPServer] = ProductTypeEnum.VIPServer
}

function getProductTypeFromRequestType(p1)
	-- upvalues: config (copy), ProductTypeEnum (copy)
	return config[p1] or ProductTypeEnum.Unknown
end

return getProductTypeFromRequestType