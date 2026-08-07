-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:56 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 6 | named "filter" ]]
	local t = {}
	
	for i, v in p0 do
		if p1(v, i) then
			t[i] = v
		end
	end
	return t
end