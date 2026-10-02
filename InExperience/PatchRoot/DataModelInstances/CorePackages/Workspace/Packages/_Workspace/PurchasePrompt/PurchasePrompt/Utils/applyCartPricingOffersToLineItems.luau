local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local _ = require(purchasePrompt.Parent.IAPExperience)
local _ = require(purchasePrompt.types)

return function(p1, p2, p3)
	local t = {}
	
	for i, v in p3 do
		t[v] = true
	end
	local t_1 = {}
	
	for i_1, v_1 in p2.items or {} do
		local discountInformation = v_1.discountInformation
		local t_2 = {}
		
		for i_2, v_2 in if discountInformation then discountInformation.discounts else {} do
			local discountId = v_2.discountId
			
			if discountId ~= nil and t[discountId] then
				table.insert(t_2, discountId)
			end
		end
		if #t_2 > 0 then
			t_1[v_1.collectibleItemId] = { offerIds = t_2, priceInRobux = v_1.priceInRobux }
		end
	end
	local t_2 = {}
	
	for i_2, v_2 in p1 do
		local collectibleItemId = t_1[v_2.collectibleItemId]
		
		if collectibleItemId == nil then
			table.insert(t_2, v_2)
		else
			local cloned = table.clone(v_2)
			cloned.offerIds = collectibleItemId.offerIds
			
			if collectibleItemId.priceInRobux ~= nil then
				cloned.agreedPriceRobux = collectibleItemId.priceInRobux
			end
			table.insert(t_2, cloned)
		end
	end
	return t_2
end