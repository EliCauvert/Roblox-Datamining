-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 10 | named "includes" ]]
	if p1 == nil then
		return false
	end
	for i, v in p0 do
		if v == p1 then
			return true
		end
	end
	return false
end