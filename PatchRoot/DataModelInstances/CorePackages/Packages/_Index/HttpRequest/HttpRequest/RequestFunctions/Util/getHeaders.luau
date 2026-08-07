-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:40 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 1 ]]
	p0 = p0 or {}
	
	if (p1 == "POST" or p1 == "PATCH") and not p0["Content-Type"] then
		p0["Content-Type"] = "application/json"
	end
	return p0
end