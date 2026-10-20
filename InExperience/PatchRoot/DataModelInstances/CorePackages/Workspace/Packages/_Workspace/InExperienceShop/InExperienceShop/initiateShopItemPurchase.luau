local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local PurchasePromptModule = require(Parent.PurchasePrompt)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetShopPurchasePayloadModule = require(InExperienceShop.Utils.getShopPurchasePayload)
local FFlagCategoryLoggingInShopPurchaseModule = require(InExperienceShop.Flags.FFlagCategoryLoggingInShopPurchase)
local FFlagEnablePurchasePayloadInExperienceShop = SharedFlagsModule.FFlagEnablePurchasePayloadInExperienceShop
local FFlagPassShopPurchaseSurfaceToBuyModal = SharedFlagsModule.FFlagPassShopPurchaseSurfaceToBuyModal
local FFlagSkipBuyDelayForExperienceShop = SharedFlagsModule.FFlagSkipBuyDelayForExperienceShop
local _ = require(InExperienceShop.Types)

return function(Id, p1, p2, p3)
	-- upvalues: FFlagEnablePurchasePayloadInExperienceShop (copy), GetShopPurchasePayloadModule (copy), FFlagCategoryLoggingInShopPurchaseModule (copy), PurchasePromptModule (copy), FFlagPassShopPurchaseSurfaceToBuyModal (copy), InExperienceShop (copy), FFlagSkipBuyDelayForExperienceShop (copy)
	if tonumber(Id) == nil then return end
	local ShopPurchasePayloadModule = if FFlagEnablePurchasePayloadInExperienceShop then GetShopPurchasePayloadModule(if FFlagCategoryLoggingInShopPurchaseModule then p3 else nil) else nil
	local InitiatePurchaseForProductPayloadFunction: (any) -> () = PurchasePromptModule.initiatePurchaseForProductPayload
	
	if FFlagPassShopPurchaseSurfaceToBuyModal and p2 ~= nil then
		local config = {
			surface = require(InExperienceShop.Analytics.getShopPurchaseAnalyticsSurface)(p2)
		}
		
		InitiatePurchaseForProductPayloadFunction = function(p4)
			-- upvalues: PurchasePromptModule (upval), config (copy)
			PurchasePromptModule.initiatePurchaseForProductPayload(p4, config)
		end
	end
	if p1 == "GamePass" then
		InitiatePurchaseForProductPayloadFunction({
			kind = "Gamepass",
			id = Id,
			purchasePayload = ShopPurchasePayloadModule,
			isFromInExperienceShop = if FFlagSkipBuyDelayForExperienceShop then true else nil
		})
		
		return
	end
	if p1 == "Product" then
		InitiatePurchaseForProductPayloadFunction({
			kind = "Product",
			equipIfPurchased = false,
			id = Id,
			purchasePayload = ShopPurchasePayloadModule,
			isFromInExperienceShop = if FFlagSkipBuyDelayForExperienceShop then true else nil
		})
	end
end