local TableDifferenceModule = require(script.Parent.tableDifference)

local function _(p1) --[[ Line: 8 | Named "membershipTable" ]]
	local t = {}
	
	for i = 1, #p1 do
		t[p1[i]] = true
	end
	return t
end

local _ = function(List) --[[ Line: 20 | Named "listOfKeys" ]]
	local List1 = {}
	
	for i, _ in pairs(List) do
		table.insert(List1, i)
	end
	return List1
end

return function(p2, p3) --[[ Line: 33 ]]
	-- upvalues: TableDifferenceModule (copy)
	local t = {}
	
	for i = 1, #p2 do
		t[p2[i]] = true
	end
	local t1 = {}
	
	for i1 = 1, #p3 do
		t1[p3[i1]] = true
	end
	local List = {}
	
	for i2, _ in pairs((TableDifferenceModule(t, t1))) do
		table.insert(List, i2)
	end
	return List
end