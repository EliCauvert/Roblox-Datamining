-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:34 2026 Pacific Standard Time.

local _ = require(script.Parent.Parent.Parent.LuauPolyfill)

return {
	printPathArray = function(p0) --[[ line: 15 ]]
		local t = {}
		
		for i = 1, #p0 do
			local var1 = p0[i]
			t[i] = if typeof(var1) == "number" then "[" .. tostring(var1) .. "]" else "." .. var1
		end
		return table.concat(t, "")
	end
}