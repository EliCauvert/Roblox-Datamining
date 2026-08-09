local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local purchasePromptModule = require(parent.PurchasePrompt)
local getShopPurchasePayloadModule = require(inExperienceShop.Utils.getShopPurchasePayload)
local fFlagEnablePurchasePayloadInExperienceShop = require(parent.SharedFlags).FFlagEnablePurchasePayloadInExperienceShop
local _ = require(inExperienceShop.Types)

return function(p0, p1) --[[ line: 31 | named "initiateShopItemPurchase" ]]
	-- upvalues: fFlagEnablePurchasePayloadInExperienceShop (ref), getShopPurchasePayloadModule (ref), purchasePromptModule (ref)
	if tonumber(p0) == nil then return end
	local var3 = if fFlagEnablePurchasePayloadInExperienceShop then getShopPurchasePayloadModule() else nil
	
	if p1 == "GamePass" then
		purchasePromptModule.initiatePurchaseForProductPayload({ kind = "Gamepass", id = p0, purchasePayload = var3 })
		
		return
	elseif p1 == "Product" then
		purchasePromptModule.initiatePurchaseForProductPayload({
			kind = "Product",
			equipIfPurchased = false,
			id = p0,
			purchasePayload = var3
		})
	end
end