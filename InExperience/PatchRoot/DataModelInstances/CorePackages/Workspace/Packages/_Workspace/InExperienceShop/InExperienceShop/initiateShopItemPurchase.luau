local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local purchasePromptModule = require(parent.PurchasePrompt)
local sharedFlagsModule = require(parent.SharedFlags)
local getShopPurchasePayloadModule = require(inExperienceShop.Utils.getShopPurchasePayload)
local fFlagEnablePurchasePayloadInExperienceShop = sharedFlagsModule.FFlagEnablePurchasePayloadInExperienceShop
local fFlagPassShopPurchaseSurfaceToBuyModal = sharedFlagsModule.FFlagPassShopPurchaseSurfaceToBuyModal
local fFlagSkipBuyDelayForExperienceShop = sharedFlagsModule.FFlagSkipBuyDelayForExperienceShop
local _ = require(inExperienceShop.Types)

return function(p0, p1, p2) --[[ line: 33 | named "initiateShopItemPurchase" ]]
	-- upvalues: fFlagEnablePurchasePayloadInExperienceShop (ref), getShopPurchasePayloadModule (ref), purchasePromptModule (ref), fFlagPassShopPurchaseSurfaceToBuyModal (ref), inExperienceShop (ref), fFlagSkipBuyDelayForExperienceShop (ref)
	if tonumber(p0) == nil then return end
	local var4 = if fFlagEnablePurchasePayloadInExperienceShop then getShopPurchasePayloadModule() else nil
	local initiatePurchaseForProductPayload = purchasePromptModule.initiatePurchaseForProductPayload
	
	if fFlagPassShopPurchaseSurfaceToBuyModal and p2 ~= nil then
		local t = {
			surface = require(inExperienceShop.Analytics.getShopPurchaseAnalyticsSurface)(p2)
		}
		
		initiatePurchaseForProductPayload = function(p3) --[[ line: 49 ]]
			-- upvalues: purchasePromptModule (copy), t (ref)
			purchasePromptModule.initiatePurchaseForProductPayload(p3, t)
		end
	end
	if p1 == "GamePass" then
		initiatePurchaseForProductPayload({
			kind = "Gamepass",
			id = p0,
			purchasePayload = var4,
			isFromInExperienceShop = if fFlagSkipBuyDelayForExperienceShop then true else nil
		})
		
		return
	elseif p1 == "Product" then
		initiatePurchaseForProductPayload({
			kind = "Product",
			equipIfPurchased = false,
			id = p0,
			purchasePayload = var4,
			isFromInExperienceShop = if fFlagSkipBuyDelayForExperienceShop then true else nil
		})
	end
end