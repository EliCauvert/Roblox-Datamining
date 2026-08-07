local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(bulkPurchaseApp.Store.Types)
local _ = require(script.Parent.Parent.BulkPurchaseRequestItem)
local getThumbnailUrlModule = require(bulkPurchaseApp.Utils.getThumbnailUrl)
local fFlagBulkPurchaseEnablePurchaseOptionsModule = require(bulkPurchaseApp.Flags.FFlagBulkPurchaseEnablePurchaseOptions)
local fFlagBulkPurchaseUsesPurchaseOptionDiscountModule = require(bulkPurchaseApp.Flags.FFlagBulkPurchaseUsesPurchaseOptionDiscount)

local function getTimedOptionDays(p0) --[[ line: 16 ]]
	for i, v in p0 do
		if v.purchaseOptionType == "timedOption" and v.durationInSeconds then
			local floored = math.floor(v.durationInSeconds / 86400)
			
			return if floored > 0 then floored else nil
		end
	end
	return nil
end

return function(p1) --[[ line: 29 | named "createPurchasableItem" ]]
	-- upvalues: fFlagBulkPurchaseEnablePurchaseOptionsModule (ref), getTimedOptionDays (ref), fFlagBulkPurchaseUsesPurchaseOptionDiscountModule (ref), getThumbnailUrlModule (ref)
	local var6 = if fFlagBulkPurchaseEnablePurchaseOptionsModule and p1.purchaseOptions then getTimedOptionDays(p1.purchaseOptions) else nil
	local priceRobux = p1.priceRobux
	local originalPrice = nil
	
	if not fFlagBulkPurchaseUsesPurchaseOptionDiscountModule then
		originalPrice = p1.discountInformation and p1.discountInformation.originalPrice
	elseif p1.purchaseOptions then
		local var7 = p1.purchaseOptions[1]
		
		if var7 then
			if var7.priceRobux ~= nil then
				priceRobux = var7.priceRobux
			end
			if var7.discountInformation then
				originalPrice = var7.discountInformation.originalPrice
			end
		end
	end
	return {
		id = p1.id,
		cost = priceRobux,
		name = p1.name,
		image = getThumbnailUrlModule(p1.id, p1.type),
		originalPrice = originalPrice,
		timedOptionDays = var6
	}
end