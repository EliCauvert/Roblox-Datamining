return function(p0, p1, p2, p3) --[[ line: 1 | named "resolveRefreshedExpectedPrice" ]]
	local price = nil
	
	if p2 and p2 ~= "" then
		if p1 ~= nil and p1.data ~= nil then
			for i, v in ipairs(p1.data) do
				if v.collectibleItemInstanceId == p2 then
					price = v.price
					break
				end
			end
		end
		if price == nil and p0 ~= nil then
			price = p0.lowestResalePrice
			
			return price
		end
	elseif p3 and p3 ~= 0 then
		if p0 == nil or not p0.timedOptions then
			return price
		end
		for i, v in ipairs(p0.timedOptions) do
			if v.days == p3 then
				price = v.price
				
				return price
			end
		end
		return price
	elseif p0 ~= nil then
		price = p0.price
	end
end