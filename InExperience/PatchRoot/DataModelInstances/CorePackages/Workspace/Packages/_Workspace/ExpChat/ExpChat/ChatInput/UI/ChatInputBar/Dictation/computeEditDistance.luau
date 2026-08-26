return function(p1, p2)
	if p1 == p2 then
		return 0
	end
	local p0Count = #p1
	local p1Count = #p2
	
	if p0Count == 0 then
		return p1Count
	elseif p1Count == 0 then
		return p0Count
	elseif p0Count < p1Count then
		p2 = p1
		p1 = p2
		local var1 = p1Count
		p1Count = p0Count
		p0Count = var1
	end
	local list = table.create(p1Count + 1)
	local list_1 = table.create(p1Count + 1)
	
	for i = 0, p1Count do
		list[i + 1] = i
	end
	for i_2 = 1, p0Count do
		list_1[1] = i_2
		local byteValue = string.byte(p1, i_2)
		
		for i_1 = 1, p1Count do
			local var2 = if byteValue == string.byte(p2, i_1) then 0 else 1
			local var3 = list[i_1 + 1] + 1
			local var4 = list_1[i_1] + 1
			local var5 = list[i_1] + var2
			local var6 = var3
			
			if var4 < var6 then
				var6 = var4
			end
			if var5 < var6 then
				var6 = var5
			end
			list_1[i_1 + 1] = var6
		end
		local var7 = list_1
		list_1 = list
		list = var7
	end
	return list[p1Count + 1]
end