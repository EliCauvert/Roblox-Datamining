-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:22 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 2 ]]
	for i = 1, #p1 do
		p0:sendText(p1:sub(i, i))
	end
	wait(0)
end