-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:29 2026 Pacific Standard Time.

local tableDifferenceModule = require(script.Parent.tableDifference)

local function _(p0) --[[ line: 8 | named "membershipTable" ]]
	local t = {}
	
	for i = 1, #p0 do
		t[p0[i]] = true
	end
	return t
end

local _ = function(p1) --[[ line: 20 | named "listOfKeys" ]]
	local t = {}
	
	for i, v in pairs(p1) do
		table.insert(t, i)
	end
	return t
end

return function(p2, p3) --[[ line: 33 ]]
	-- upvalues: tableDifferenceModule (ref)
	local t = {}
	
	for i = 1, #p2 do
		t[p2[i]] = true
	end
	local t_1 = {}
	
	for i_1 = 1, #p3 do
		t_1[p3[i_1]] = true
	end
	local t_2 = {}
	
	for i_2, v in pairs(tableDifferenceModule(t, t_1)) do
		table.insert(t_2, i_2)
	end
	return t_2
end