local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local UnifiedPurchaseModalTypeEnum = require(Parent.IAPExperience).Enums.UnifiedPurchaseModalTypeEnum
local IsMultiItemPurchaseModule = require(PurchasePrompt.Utils.isMultiItemPurchase)
local RequestTypeModule = require(PurchasePrompt.Enums.RequestType)
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(PurchasePrompt.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local FFlagAXMISWithBlackbird = require(Parent.SharedFlags).FFlagAXMISWithBlackbird

return function(DeveloperSubscription)
	-- upvalues: RequestTypeModule (copy), UnifiedPurchaseModalTypeEnum (copy), FFlagAXMISWithBlackbird (copy), IsMultiItemPurchaseModule (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy)
	return if DeveloperSubscription == RequestTypeModule.Experience then UnifiedPurchaseModalTypeEnum.Experience elseif FFlagAXMISWithBlackbird and DeveloperSubscription == RequestTypeModule.RobuxUpsell then UnifiedPurchaseModalTypeEnum.MultiItem elseif IsMultiItemPurchaseModule(DeveloperSubscription) then UnifiedPurchaseModalTypeEnum.MultiItem elseif FFlagEnableUnifiedPurchaseFlowForDevSubs and DeveloperSubscription == RequestTypeModule.DeveloperSubscription then UnifiedPurchaseModalTypeEnum.DeveloperSubscription else UnifiedPurchaseModalTypeEnum.SingleItem
end