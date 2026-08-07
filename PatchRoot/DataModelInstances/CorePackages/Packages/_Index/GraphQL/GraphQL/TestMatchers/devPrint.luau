-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:36 2026 Pacific Standard Time.

local inspect = require(script.Parent.Parent.Parent.LuauPolyfill).util.inspect

return function(...) --[[ line: 19 | named "devPrint" ]]
	-- upvalues: inspect (ref)
	local t = {}
	
	for i = 1, select("#", ...) do
		t[i] = inspect(select(i, ...))
	end
	print(table.unpack(t))
end