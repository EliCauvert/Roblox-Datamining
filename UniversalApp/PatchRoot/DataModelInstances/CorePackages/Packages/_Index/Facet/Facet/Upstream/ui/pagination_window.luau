return function(Key: number, p1: number, p2: number, p3: number)
	local Currents = {}
	
	local function _(Key: number, p4)
		-- upvalues: p1 (copy), Currents (copy)
		if Key >= 1 and Key <= p1 and Currents[Key] == nil then
			Currents[Key] = p4
		end
	end
	
	for i = 1, math.min(p3, p1) do
		if i >= 1 and i <= p1 and Currents[i] == nil then
			Currents[i] = "boundary"
		end
	end
	for i1 = math.max(p1 - p3 + 1, p3 + 1), p1 do
		if i1 >= 1 and i1 <= p1 and Currents[i1] == nil then
			Currents[i1] = "boundary"
		end
	end
	local Largest = math.max(math.min(Key - p2, p1 - p3 - p2 * 2 - 1), p3 + 2)
	local Smallest = math.min(math.max(Key + p2, p3 + p2 * 2 + 2), p1 - p3 - 1)
	
	for i2 = Largest, Smallest do
		local Current: string = if i2 == Key then "current" else "neighbor"
		
		if i2 >= 1 and i2 <= p1 and Currents[i2] == nil then
			Currents[i2] = Current
		end
	end
	if Largest == p3 + 2 then
		local v1 = p3 + 1
		
		if v1 >= 1 and v1 <= p1 and Currents[v1] == nil then
			Currents[v1] = "boundary"
		end
	end
	if Smallest == p1 - p3 - 1 then
		local v2 = p1 - p3
		
		if v2 >= 1 and v2 <= p1 and Currents[v2] == nil then
			Currents[v2] = "boundary"
		end
	end
	Currents[Key] = "current"
	local List = {}
	
	for Page, current in Currents do
		table.insert(List, { page = Page, role = current })
	end
	table.sort(List, function(A, B): boolean
		return A.page < B.page
	end)
	
	return List
end