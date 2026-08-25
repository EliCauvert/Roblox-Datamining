local productTypeEnum = require(script:FindFirstAncestor("PurchasePrompt").types).ProductTypeEnum

local function buildPermanentRowsFromIds(p0)
	local list = table.create(#p0)
	
	for i, v in p0 do
		if type(v) == "string" and v ~= "" then
			table.insert(list, { isPermanent = true, collectibleItemId = v })
		end
	end
	return list
end

return function(p1, p2, p3)
	-- upvalues: productTypeEnum (ref), buildPermanentRowsFromIds (ref)
	if type(p2) == "table" and p2.kind == productTypeEnum.Look then
		local cartPricingRequestedItems = p2.cartPricingRequestedItems
		
		if type(cartPricingRequestedItems) == "table" and #cartPricingRequestedItems > 0 then
			local list = table.create(#cartPricingRequestedItems)
			
			for i, v in cartPricingRequestedItems do
				local rentalDays = v.rentalDays
				local var3 = type(rentalDays) == "number" and rentalDays > 0
				table.insert(list, {
					collectibleItemId = v.collectibleItemId,
					rentalDays = if var3 then rentalDays else nil,
					isPermanent = if var3 then nil else true
				})
			end
			return list
		else
			local var4 = if type(p3) == "table" then p3.collectibleItemIds else nil
			
			if type(var4) == "table" and #var4 > 0 then
				local var5 = buildPermanentRowsFromIds(var4)
				
				return if #var5 > 0 then var5 else nil
			elseif p1 == nil or p1 == "" then
				return nil
			end
			local t = { collectibleItemId = p1 }
			
			if type(p2) == "table" and p2.kind == productTypeEnum.Asset then
				local timedOptionDays = p2.timedOptionDays
				
				if type(timedOptionDays) == "number" and timedOptionDays > 0 then
					t.rentalDays = timedOptionDays
				end
			end
			if t.rentalDays == nil then
				t.isPermanent = true
			end
			return { t }
		end
	end
end