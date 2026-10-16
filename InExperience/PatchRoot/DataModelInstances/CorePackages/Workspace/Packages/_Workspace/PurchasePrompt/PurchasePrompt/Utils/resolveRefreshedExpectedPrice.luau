return function(p1, p2, CollectibleItemInstanceId, Days) --[[ Line: 1 | Named "resolveRefreshedExpectedPrice" ]]
	local Price = nil
	
	if CollectibleItemInstanceId and CollectibleItemInstanceId ~= "" then
		if p2 ~= nil and p2.data ~= nil then
			for _, entry in ipairs(p2.data) do
				if entry.collectibleItemInstanceId == CollectibleItemInstanceId then
					Price = entry.price
					break
				end
			end
		end
		if Price == nil and p1 ~= nil then
			Price = p1.lowestResalePrice
			
			return Price
		end
	elseif Days and Days ~= 0 then
		if p1 ~= nil and p1.timedOptions then
			for _, timedOption in ipairs(p1.timedOptions) do
				if timedOption.days == Days then
					Price = timedOption.price
					
					return Price
				end
			end
			return Price
		end
	elseif p1 ~= nil then
		Price = p1.price
	end
	return Price
end