local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local _ = require(PurchasePrompt.Parent.IAPExperience)
local _ = require(PurchasePrompt.types)

return function(List, p1, List1)
	local t = {}
	
	for _, value in List1 do
		t[value] = true
	end
	local t1 = {}
	local Items = p1.items or {}
	for _, item in Items do
		local DiscountInformation = item.discountInformation
		local OfferIds = {}
		local Discounts = DiscountInformation and DiscountInformation.discounts or {}
		for _, discount in Discounts do
			local DiscountId = discount.discountId
			
			if DiscountId ~= nil and t[DiscountId] then
				table.insert(OfferIds, DiscountId)
			end
		end
		if #OfferIds > 0 then
			t1[item.collectibleItemId] = { offerIds = OfferIds, priceInRobux = item.priceInRobux }
		end
	end
	local List2 = {}
	
	for _, value1 in List do
		local Entry = t1[value1.collectibleItemId]
		
		if Entry == nil then
			table.insert(List2, value1)
		else
			local Copy = table.clone(value1)
			Copy.offerIds = Entry.offerIds
			
			if Entry.priceInRobux ~= nil then
				Copy.agreedPriceRobux = Entry.priceInRobux
			end
			table.insert(List2, Copy)
		end
	end
	return List2
end