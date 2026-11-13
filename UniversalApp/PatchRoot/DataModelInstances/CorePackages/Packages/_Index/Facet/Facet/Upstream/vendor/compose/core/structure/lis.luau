--!native

local t = {}
local t1 = {}

return function(p1, p2)
	-- upvalues: t (copy), t1 (copy)
	local CountP0 = if p2 == nil then #p1 else p2
	local List = {}
	
	if CountP0 == 0 then
		return List
	end
	local v1 = 0
	
	for i = 1, CountP0 do
		local v2 = p1[i]
		local v3 = 1
		local v4: number = v1
		while v3 <= v4 do
			local v5 = (v3 + v4) // 2
			
			if p1[t[v5]] < v2 then
				v3 = v5 + 1
			else
				v4 = v5 - 1
			end
		end
		t1[i] = if v3 > 1 then t[v3 - 1] else 0
		t[v3] = i
		
		if v1 < v3 then
			v1 = v3
		end
	end
	local Entry = t[v1]
	while Entry ~= 0 and Entry ~= nil do
		table.insert(List, Entry)
		Entry = t1[Entry]
	end
	return List
end