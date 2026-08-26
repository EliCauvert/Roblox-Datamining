local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local purchasePromptModule = require(parent.PurchasePrompt)
local sharedFlagsModule = require(parent.SharedFlags)
local getShopPurchasePayloadModule = require(inExperienceShop.Utils.getShopPurchasePayload)
local fFlagEnablePurchasePayloadInExperienceShop = sharedFlagsModule.FFlagEnablePurchasePayloadInExperienceShop
local fFlagPassShopPurchaseSurfaceToBuyModal = sharedFlagsModule.FFlagPassShopPurchaseSurfaceToBuyModal
local fFlagSkipBuyDelayForExperienceShop = sharedFlagsModule.FFlagSkipBuyDelayForExperienceShop
local _ = require(inExperienceShop.Types)

return function(p1, p2, p3)
	-- upvalues: fFlagEnablePurchasePayloadInExperienceShop (ref), getShopPurchasePayloadModule (ref), purchasePromptModule (ref), fFlagPassShopPurchaseSurfaceToBuyModal (ref), inExperienceShop (ref), fFlagSkipBuyDelayForExperienceShop (ref)
	if tonumber(p1) == nil then return end
	local var1 = if fFlagEnablePurchasePayloadInExperienceShop then getShopPurchasePayloadModule() else nil
	local initiatePurchaseForProductPayload = purchasePromptModule.initiatePurchaseForProductPayload
	
	if fFlagPassShopPurchaseSurfaceToBuyModal and p3 ~= nil then
		local t = {
			surface = require(inExperienceShop.Analytics.getShopPurchaseAnalyticsSurface)(p3)
		}
		
		initiatePurchaseForProductPayload = function(p4)
			-- upvalues: purchasePromptModule (copy), t (ref)
			purchasePromptModule.initiatePurchaseForProductPayload(p4, t)
		end
	end
	if p2 == "GamePass" then
		initiatePurchaseForProductPayload({
			kind = "Gamepass",
			id = p1,
			purchasePayload = var1,
			isFromInExperienceShop = if fFlagSkipBuyDelayForExperienceShop then true else nil
		})
		
		return
	elseif p2 == "Product" then
		initiatePurchaseForProductPayload({
			kind = "Product",
			equipIfPurchased = false,
			id = p1,
			purchasePayload = var1,
			isFromInExperienceShop = if fFlagSkipBuyDelayForExperienceShop then true else nil
		})
	end
end