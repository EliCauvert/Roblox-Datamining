return function(p1, p2, p3, p4)
	local price = nil
	
	if p3 and p3 ~= "" then
		if p2 ~= nil and p2.data ~= nil then
			for i, v in ipairs(p2.data) do
				if v.collectibleItemInstanceId == p3 then
					price = v.price
					break
				end
			end
		end
		if price == nil and p1 ~= nil then
			price = p1.lowestResalePrice
			
			return price
		end
	elseif p4 and p4 ~= 0 then
		if p1 == nil or not p1.timedOptions then
			return price
		end
		for i, v in ipairs(p1.timedOptions) do
			if v.days == p4 then
				price = v.price
				
				return price
			end
		end
		return price
	elseif p1 ~= nil then
		price = p1.price
	end
end