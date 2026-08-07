-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:00 2026 Pacific Standard Time.

local reactModule = require(script.Parent.Parent.React)
local createRefCacheModule = require(script.Parent.createRefCache)

return function() --[[ line: 18 | named "useRefCache" ]]
	-- upvalues: reactModule (ref), createRefCacheModule (ref)
	local var2 = reactModule.useRef(nil)
	
	if var2.current == nil then
		var2.current = createRefCacheModule()
	end
	return var2.current
end