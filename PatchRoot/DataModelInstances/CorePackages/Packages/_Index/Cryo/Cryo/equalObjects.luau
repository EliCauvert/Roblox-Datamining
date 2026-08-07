-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:56 2026 Pacific Standard Time.

return function(...) --[[ line: 2 | named "equalObjects" ]]
	local var0 = select(1, ...)
	
	for i = 2, select("#", ...) do
		if var0 == select(i, ...) then
			continue
		end
		return false
	end
	return true
end