return function(p0, p1) --[[ line: 2 | named "computeEditDistance" ]]
	if p0 == p1 then
		return 0
	end
	local p0Count = #p0
	local p1Count = #p1
	
	if p0Count == 0 then
		return p1Count
	elseif p1Count == 0 then
		return p0Count
	elseif p0Count < p1Count then
		p1 = p0
		p0 = p1
		local var2 = p1Count
		p1Count = p0Count
		p0Count = var2
	end
	local list = table.create(p1Count + 1)
	local list_1 = table.create(p1Count + 1)
	
	for i = 0, p1Count do
		list[i + 1] = i
	end
	for i_2 = 1, p0Count do
		list_1[1] = i_2
		local byteValue = string.byte(p0, i_2)
		
		for i_1 = 1, p1Count do
			local var6 = if byteValue == string.byte(p1, i_1) then 0 else 1
			local var7 = list[i_1 + 1] + 1
			local var8 = list_1[i_1] + 1
			local var9 = list[i_1] + var6
			local var10 = var7
			
			if var8 < var10 then
				var10 = var8
			end
			if var9 < var10 then
				var10 = var9
			end
			list_1[i_1 + 1] = var10
		end
		local var11 = list_1
		list_1 = list
		list = var11
	end
	return list[p1Count + 1]
end