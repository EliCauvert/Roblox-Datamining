-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:39 2026 Pacific Standard Time.

local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p0) --[[ line: 31 | named "useRefToState" ]]
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(p0)
	var1.current = p0
	
	return var1
end