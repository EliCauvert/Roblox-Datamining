-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

local _ = require(script.Parent.Types)

return function(...) --[[ line: 10 | named "joinArrays" ]]
	local t = {}
	
	for i, v in { ... } do
		if v then
			table.move(v, 1, #v, #t + 1, t)
		end
	end
	return t
end