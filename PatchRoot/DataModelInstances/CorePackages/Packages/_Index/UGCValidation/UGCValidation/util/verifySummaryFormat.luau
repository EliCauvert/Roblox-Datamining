-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:40 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 1 | named "verifySummaryFormat" ]]
	if p0 == nil or typeof(p0) ~= "table" then
		return false
	end
	local t = {}
	
	for i, v in p1 do
		t[v] = true
	end
	for i_1, v_1 in p1 do
		if p0[v_1] == nil or typeof(p0[v_1]) ~= "number" then
			return false
		end
	end
	for i_2, v_1 in p0 do
		if not t[i_2] then
			return false
		end
	end
	return true
end