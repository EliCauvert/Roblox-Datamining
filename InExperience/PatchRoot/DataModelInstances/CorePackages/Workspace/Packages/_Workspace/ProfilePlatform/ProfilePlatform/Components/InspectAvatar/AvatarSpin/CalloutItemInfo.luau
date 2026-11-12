local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local _ = require(Parent.Foundation)
local _ = require(ProfilePlatform.Common.Types)
local InspectAvatarUtilsModule = require(script.Parent.Parent.InspectAvatarUtils)
local _ = require(script.Parent.CalloutScoring)
local GetPriceLineContentFunction = require(Parent.AvatarExperienceInspectAndBuy).Utils.getPriceLineContent
local IsItemPurchasableFunction = InspectAvatarUtilsModule.isItemPurchasable
local GetPriceStatusFunction = InspectAvatarUtilsModule.getPriceStatus
local PriceStatusEnum = InspectAvatarUtilsModule.PriceStatusEnum

return {
	getStatusKind = function(p1): string
		-- upvalues: GetPriceStatusFunction (copy), PriceStatusEnum (copy), IsItemPurchasableFunction (copy)
		local PriceStatus = GetPriceStatusFunction(p1)
		
		return if p1.isOwned or PriceStatus == PriceStatusEnum.Owned then "owned" elseif IsItemPurchasableFunction(p1) then if PriceStatus == PriceStatusEnum.PurchaseFromResale then "resale" else "purchasable" else "unavailable"
	end,
	getCurrentPriceLine = function(p1, p2, p3)
		-- upvalues: GetPriceLineContentFunction (copy)
		local PriceLineContent = GetPriceLineContentFunction(p1, p2, p3, { isShopContext = true })
		
		if not PriceLineContent then
			return nil
		end
		local PriceLineContentEntry = nil
		for i = #PriceLineContent, 1, -1 do
			PriceLineContentEntry = PriceLineContent[i]
			
			if not PriceLineContentEntry.strikethrough then
				if PriceLineContentEntry.type == "price" then
					return {
						type = "price",
						price = PriceLineContentEntry.price,
						colorStyle = PriceLineContentEntry.colorStyle
					}
				end
				if PriceLineContentEntry.type == "text" then
					return {
						type = "text",
						text = PriceLineContentEntry.text,
						colorStyle = PriceLineContentEntry.colorStyle
					}
				end
			end
		end
		return nil
	end
}