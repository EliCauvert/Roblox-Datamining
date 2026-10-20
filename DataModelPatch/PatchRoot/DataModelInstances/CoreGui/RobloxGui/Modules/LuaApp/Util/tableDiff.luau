local Proxy = newproxy(true)

getmetatable(Proxy).__tostring = function(): string
	return "<removed>"
end

local function tableDiff(List, List1, p1)
	-- upvalues: Proxy (copy), tableDiff (copy)
	local P2 = p1 or 0
	
	if P2 == 10 then
		return nil
	end
	if List1 == nil then
		return Proxy
	end
	if typeof(List1) ~= "table" then
		return List1
	end
	local t = {}
	
	if typeof(List) == "table" then
		for i, value in pairs(List) do
			if List1[i] ~= value then
				t[i] = tableDiff(value, List1[i], P2 + 1)
			end
		end
	end
	for i1, value1 in pairs(List1) do
		if typeof(List) ~= "table" or List[i1] == nil then
			t[i1] = tableDiff(nil, value1, P2 + 1)
		end
	end
	return if next(t) then t else nil
end

return tableDiff