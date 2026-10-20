local ProductTypeEnum = require(script:FindFirstAncestor("PurchasePrompt").types).ProductTypeEnum

local function buildPermanentRowsFromIds(CollectibleItemIds)
	local Buffer = table.create(#CollectibleItemIds)
	
	for _, collectibleItemId in CollectibleItemIds do
		if type(collectibleItemId) == "string" and collectibleItemId ~= "" then
			table.insert(Buffer, {
				isPermanent = true,
				collectibleItemId = collectibleItemId
			})
		end
	end
	return Buffer
end

return function(CollectibleItemId, p1, p2)
	-- upvalues: ProductTypeEnum (copy), buildPermanentRowsFromIds (copy)
	if type(p1) == "table" and p1.kind == ProductTypeEnum.Look then
		local CartPricingRequestedItems = p1.cartPricingRequestedItems
		
		if type(CartPricingRequestedItems) == "table" and #CartPricingRequestedItems > 0 then
			local Buffer = table.create(#CartPricingRequestedItems)
			
			for _, cartPricingRequestedItem in CartPricingRequestedItems do
				local RentalDays: number = cartPricingRequestedItem.rentalDays
				local IsRentalDaysAbove: boolean = type(RentalDays) == "number" and RentalDays > 0
				table.insert(Buffer, {
					collectibleItemId = cartPricingRequestedItem.collectibleItemId,
					rentalDays = if IsRentalDaysAbove then RentalDays else nil,
					isPermanent = not IsRentalDaysAbove or nil
				})
			end
			return Buffer
		else
			local CollectibleItemIds = if type(p2) == "table" then p2.collectibleItemIds else nil
			
			if type(CollectibleItemIds) == "table" and #CollectibleItemIds > 0 then
				local PermanentRowsFromIds = buildPermanentRowsFromIds(CollectibleItemIds)
				
				if #PermanentRowsFromIds > 0 then
					return PermanentRowsFromIds
				end
			end
			return nil
		end
	else
		if CollectibleItemId == nil or CollectibleItemId == "" then
			return nil
		end
		local config = { collectibleItemId = CollectibleItemId }
		
		if type(p1) == "table" and p1.kind == ProductTypeEnum.Asset then
			local TimedOptionDays: number = p1.timedOptionDays
			
			if type(TimedOptionDays) == "number" and TimedOptionDays > 0 then
				config.rentalDays = TimedOptionDays
			end
		end
		if config.rentalDays == nil then
			config.isPermanent = true
		end
		return { config }
	end
end