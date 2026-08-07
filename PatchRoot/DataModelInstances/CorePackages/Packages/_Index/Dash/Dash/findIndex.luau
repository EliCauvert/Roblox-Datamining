-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 10 | named "findIndex" ]]
	for i, v in ipairs(p0) do
		if p1(v, i) then
			return i
		end
	end
	return nil
end