-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:44 2026 Pacific Standard Time.

local var0 = require(script.Parent.pageLogger):new()
var0:setContext({ bar = "bar" })

return function() --[[ line: 4 ]]
	-- upvalues: var0 (ref)
	var0:info("calling {root} {foo} {bar}")
	
	return "done"
end