-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:39 2026 Pacific Standard Time.

local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p0) --[[ line: 21 | named "useLazyRef" ]]
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	
	if var1.current == nil then
		var1.current = p0()
	end
	assert(var1.current ~= nil, "Ref must be defined after initialization function is called")
	
	return var1
end