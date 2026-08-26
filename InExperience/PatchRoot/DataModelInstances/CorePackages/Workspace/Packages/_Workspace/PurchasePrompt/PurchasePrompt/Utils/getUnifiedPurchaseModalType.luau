local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local unifiedPurchaseModalTypeEnum = require(parent.IAPExperience).Enums.UnifiedPurchaseModalTypeEnum
local isMultiItemPurchaseModule = require(purchasePrompt.Utils.isMultiItemPurchase)
local requestTypeModule = require(purchasePrompt.Enums.RequestType)
local fFlagEnableUnifiedPurchaseFlowForDevSubs = require(purchasePrompt.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local fFlagAXMISWithBlackbird = sharedFlagsModule.FFlagAXMISWithBlackbird

return function(p1)
	-- upvalues: requestTypeModule (ref), unifiedPurchaseModalTypeEnum (ref), fFlagAXMISWithBlackbird (ref), isMultiItemPurchaseModule (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref)
	return if p1 == requestTypeModule.Experience then unifiedPurchaseModalTypeEnum.Experience elseif fFlagAXMISWithBlackbird and p1 == requestTypeModule.RobuxUpsell then unifiedPurchaseModalTypeEnum.MultiItem elseif isMultiItemPurchaseModule(p1) then unifiedPurchaseModalTypeEnum.MultiItem elseif fFlagEnableUnifiedPurchaseFlowForDevSubs and p1 == requestTypeModule.DeveloperSubscription then unifiedPurchaseModalTypeEnum.DeveloperSubscription else unifiedPurchaseModalTypeEnum.SingleItem
end