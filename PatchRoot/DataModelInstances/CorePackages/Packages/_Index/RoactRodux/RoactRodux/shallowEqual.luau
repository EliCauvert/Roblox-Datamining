-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:03 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 1 | named "shallowEqual" ]]
	if p0 == nil then
		return p1 == nil
	elseif p1 == nil then
		return p0 == nil
	end
	for i, v in pairs(p0) do
		if v ~= p1[i] then
			return false
		end
	end
	for i, v in pairs(p1) do
		if v ~= p0[i] then
			return false
		end
	end
	return true
end