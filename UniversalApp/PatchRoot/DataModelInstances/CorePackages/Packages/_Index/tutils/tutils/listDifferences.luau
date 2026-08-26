local tableDifferenceModule = require(script.Parent.tableDifference)

local function _(p1)
	local t = {}
	
	for i = 1, #p1 do
		t[p1[i]] = true
	end
	return t
end

local _ = function(p2)
	local t = {}
	
	for i, v in pairs(p2) do
		table.insert(t, i)
	end
	return t
end

return function(p3, p4)
	-- upvalues: tableDifferenceModule (ref)
	local t = {}
	
	for i = 1, #p3 do
		t[p3[i]] = true
	end
	local t_1 = {}
	
	for i_1 = 1, #p4 do
		t_1[p4[i_1]] = true
	end
	local t_2 = {}
	
	for i_2, v in pairs(tableDifferenceModule(t, t_1)) do
		table.insert(t_2, i_2)
	end
	return t_2
end