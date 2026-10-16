local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(BulkPurchaseApp.Store.Types)
local _ = require(script.Parent.Parent.BulkPurchaseRequestItem)
local GetThumbnailUrlModule = require(BulkPurchaseApp.Utils.getThumbnailUrl)
local FFlagBulkPurchaseEnablePurchaseOptionsModule = require(BulkPurchaseApp.Flags.FFlagBulkPurchaseEnablePurchaseOptions)
local FFlagBulkPurchaseUsesPurchaseOptionDiscountModule = require(BulkPurchaseApp.Flags.FFlagBulkPurchaseUsesPurchaseOptionDiscount)

local function getTimedOptionDays(PurchaseOptions) --[[ Line: 16 ]]
	for _, purchaseOption in PurchaseOptions do
		if purchaseOption.purchaseOptionType == "timedOption" and purchaseOption.durationInSeconds then
			local Floored = math.floor(purchaseOption.durationInSeconds / 86400)
			
			return if Floored > 0 then Floored else nil
		end
	end
	return nil
end

return function(p1) --[[ Line: 29 | Named "createPurchasableItem" ]]
	-- upvalues: FFlagBulkPurchaseEnablePurchaseOptionsModule (copy), getTimedOptionDays (copy), FFlagBulkPurchaseUsesPurchaseOptionDiscountModule (copy), GetThumbnailUrlModule (copy)
	local TimedOptionDays = if FFlagBulkPurchaseEnablePurchaseOptionsModule and p1.purchaseOptions then getTimedOptionDays(p1.purchaseOptions) else nil
	local PriceRobux = p1.priceRobux
	local OriginalPrice = nil
	
	if FFlagBulkPurchaseUsesPurchaseOptionDiscountModule then
		if p1.purchaseOptions then
			local PurchaseOption = p1.purchaseOptions[1]
			
			if PurchaseOption then
				if PurchaseOption.priceRobux ~= nil then
					PriceRobux = PurchaseOption.priceRobux
				end
				if PurchaseOption.discountInformation then
					OriginalPrice = PurchaseOption.discountInformation.originalPrice
				end
			end
		end
	else
		OriginalPrice = p1.discountInformation and p1.discountInformation.originalPrice
	end
	return {
		id = p1.id,
		cost = PriceRobux,
		name = p1.name,
		image = GetThumbnailUrlModule(p1.id, p1.type),
		originalPrice = OriginalPrice,
		timedOptionDays = TimedOptionDays
	}
end