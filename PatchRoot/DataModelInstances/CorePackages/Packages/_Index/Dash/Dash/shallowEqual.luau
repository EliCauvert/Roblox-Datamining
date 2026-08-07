-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 8 | named "shallowEqual" ]]
	if p0 == p1 then
		return true
	elseif typeof(p0) ~= "table" or typeof(p1) ~= "table" or #p0 ~= #p1 then
		return false
	elseif p0 == nil or p1 == nil then
		return false
	end
	for i, v in p0 do
		if p1[i] ~= v then
			return false
		end
	end
	for i, v in p1 do
		if p0[i] ~= v then
			return false
		end
	end
	return true
end