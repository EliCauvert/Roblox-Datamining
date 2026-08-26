local productTypeEnum = require(script:FindFirstAncestor("PurchasePrompt").types).ProductTypeEnum

local function buildPermanentRowsFromIds(p1)
	local list = table.create(#p1)
	
	for i, v in p1 do
		if type(v) == "string" and v ~= "" then
			table.insert(list, { isPermanent = true, collectibleItemId = v })
		end
	end
	return list
end

return function(p2, p3, p4)
	-- upvalues: productTypeEnum (ref), buildPermanentRowsFromIds (ref)
	if type(p3) == "table" and p3.kind == productTypeEnum.Look then
		local cartPricingRequestedItems = p3.cartPricingRequestedItems
		
		if type(cartPricingRequestedItems) == "table" and #cartPricingRequestedItems > 0 then
			local list = table.create(#cartPricingRequestedItems)
			
			for i, v in cartPricingRequestedItems do
				local rentalDays = v.rentalDays
				local var1 = type(rentalDays) == "number" and rentalDays > 0
				table.insert(list, {
					collectibleItemId = v.collectibleItemId,
					rentalDays = if var1 then rentalDays else nil,
					isPermanent = if var1 then nil else true
				})
			end
			return list
		else
			local var2 = if type(p4) == "table" then p4.collectibleItemIds else nil
			
			if type(var2) == "table" and #var2 > 0 then
				local var3 = buildPermanentRowsFromIds(var2)
				
				return if #var3 > 0 then var3 else nil
			elseif p2 == nil or p2 == "" then
				return nil
			end
			local t = { collectibleItemId = p2 }
			
			if type(p3) == "table" and p3.kind == productTypeEnum.Asset then
				local timedOptionDays = p3.timedOptionDays
				
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