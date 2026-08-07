-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:56 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 5 | named "findWhere" ]]
	for i = 1, #p0 do
		if not p1(p0[i], i) then
			continue
		end
		return i
	end
	return nil
end