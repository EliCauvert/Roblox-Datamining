-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:41 2026 Pacific Standard Time.

return function(...) --[[ line: 2 | named "equalObjects" ]]
	for i = 1, select("#", ...) - 1 do
		if select(i, ...) == select(i + 1, ...) then
			continue
		end
		return false
	end
	return true
end