local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local PurchasePromptModule = require(Parent.PurchasePrompt)
local GetShopPurchasePayloadModule = require(InExperienceShop.Utils.getShopPurchasePayload)
local FFlagEnablePurchasePayloadInExperienceShop = require(Parent.SharedFlags).FFlagEnablePurchasePayloadInExperienceShop
local _ = require(InExperienceShop.Types)

return function(Id, p1)
	-- upvalues: FFlagEnablePurchasePayloadInExperienceShop (copy), GetShopPurchasePayloadModule (copy), PurchasePromptModule (copy)
	if tonumber(Id) == nil then return end
	local ShopPurchasePayloadModule = if FFlagEnablePurchasePayloadInExperienceShop then GetShopPurchasePayloadModule() else nil
	
	if p1 == "GamePass" then
		PurchasePromptModule.initiatePurchaseForProductPayload({
			kind = "Gamepass",
			id = Id,
			purchasePayload = ShopPurchasePayloadModule
		})
		
		return
	end
	if p1 == "Product" then
		PurchasePromptModule.initiatePurchaseForProductPayload({
			kind = "Product",
			equipIfPurchased = false,
			id = Id,
			purchasePayload = ShopPurchasePayloadModule
		})
	end
end