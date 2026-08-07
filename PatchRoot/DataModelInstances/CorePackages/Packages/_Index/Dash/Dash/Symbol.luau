-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

local var0 = require(script.Parent.class)("Symbol", function(p0) --[[ line: 20 ]]
	return { name = p0 }
end)

function var0.toString(p1) --[[ line: 26 ]]
	return ("Symbol(%s)"):format(p1.name)
end

return var0