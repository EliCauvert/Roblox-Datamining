local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local PurchasePromptModule = require(Parent.PurchasePrompt)
local PurchasePromptLiteModule = require(Parent.PurchasePromptLite)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetShopPurchasePayloadModule = require(InExperienceShop.Utils.getShopPurchasePayload)
local FFlagCategoryLoggingInShopPurchaseModule = require(InExperienceShop.Flags.FFlagCategoryLoggingInShopPurchase)
local FFlagEnableNotificationsBuyModalSurfaceModule = require(InExperienceShop.Flags.FFlagEnableNotificationsBuyModalSurface)
local FFlagEnablePurchasePayloadInExperienceShop = SharedFlagsModule.FFlagEnablePurchasePayloadInExperienceShop
local FFlagSkipBuyDelayForExperienceShop = SharedFlagsModule.FFlagSkipBuyDelayForExperienceShop
local _ = require(InExperienceShop.Types)

return function(Id, p1, p2, p3, Tooltip)
	-- upvalues: FFlagEnableNotificationsBuyModalSurfaceModule (copy), PurchasePromptLiteModule (copy), FFlagEnablePurchasePayloadInExperienceShop (copy), GetShopPurchasePayloadModule (copy), FFlagCategoryLoggingInShopPurchaseModule (copy), PurchasePromptModule (copy), InExperienceShop (copy), FFlagSkipBuyDelayForExperienceShop (copy)
	if tonumber(Id) == nil then return end
	local TopBarChip = if FFlagEnableNotificationsBuyModalSurfaceModule and Tooltip == PurchasePromptLiteModule.Enums.ProductPurchaseSurface.TopBarChip then "topBarChip" elseif FFlagEnableNotificationsBuyModalSurfaceModule and Tooltip == PurchasePromptLiteModule.Enums.ProductPurchaseSurface.Tooltip then "tooltip" else nil
	local ShopPurchasePayloadModule = if FFlagEnablePurchasePayloadInExperienceShop then GetShopPurchasePayloadModule(if FFlagCategoryLoggingInShopPurchaseModule then p3 else nil, TopBarChip) else nil
	local InitiatePurchaseForProductPayloadFunction: (any) -> () = PurchasePromptModule.initiatePurchaseForProductPayload
	local Surface = nil
	
	if FFlagEnableNotificationsBuyModalSurfaceModule and Tooltip ~= nil then
		Surface = Tooltip
	elseif p2 ~= nil then
		Surface = require(InExperienceShop.Analytics.getShopPurchaseAnalyticsSurface)(p2)
	end
	if Surface ~= nil then
		local config = { surface = Surface }
		
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