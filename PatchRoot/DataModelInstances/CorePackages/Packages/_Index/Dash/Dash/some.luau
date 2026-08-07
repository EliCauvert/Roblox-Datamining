-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 12 | named "some" ]]
	for i, v in p0 do
		if p1(v, i) then
			return true
		end
	end
	return false
end