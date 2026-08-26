local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(bulkPurchaseApp.Store.Types)
local _ = require(script.Parent.Parent.BulkPurchaseRequestItem)
local getThumbnailUrlModule = require(bulkPurchaseApp.Utils.getThumbnailUrl)
local fFlagBulkPurchaseEnablePurchaseOptionsModule = require(bulkPurchaseApp.Flags.FFlagBulkPurchaseEnablePurchaseOptions)
local fFlagBulkPurchaseUsesPurchaseOptionDiscountModule = require(bulkPurchaseApp.Flags.FFlagBulkPurchaseUsesPurchaseOptionDiscount)

local function getTimedOptionDays(p1)
	for i, v in p1 do
		if v.purchaseOptionType == "timedOption" and v.durationInSeconds then
			local floored = math.floor(v.durationInSeconds / 86400)
			
			return if floored > 0 then floored else nil
		end
	end
	return nil
end

return function(p2)
	-- upvalues: fFlagBulkPurchaseEnablePurchaseOptionsModule (ref), getTimedOptionDays (ref), fFlagBulkPurchaseUsesPurchaseOptionDiscountModule (ref), getThumbnailUrlModule (ref)
	local var1 = if fFlagBulkPurchaseEnablePurchaseOptionsModule and p2.purchaseOptions then getTimedOptionDays(p2.purchaseOptions) else nil
	local priceRobux = p2.priceRobux
	local originalPrice = nil
	
	if not fFlagBulkPurchaseUsesPurchaseOptionDiscountModule then
		originalPrice = p2.discountInformation and p2.discountInformation.originalPrice
	elseif p2.purchaseOptions then
		local var2 = p2.purchaseOptions[1]
		
		if var2 then
			if var2.priceRobux ~= nil then
				priceRobux = var2.priceRobux
			end
			if var2.discountInformation then
				originalPrice = var2.discountInformation.originalPrice
			end
		end
	end
	return {
		id = p2.id,
		cost = priceRobux,
		name = p2.name,
		image = getThumbnailUrlModule(p2.id, p2.type),
		originalPrice = originalPrice,
		timedOptionDays = var1
	}
end