-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:33 2026 Pacific Standard Time.

local promiseModule = require(script.Parent.Parent.Parent.Promise)

return function() --[[ line: 11 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.defer(function(p0) --[[ line: 13 ]]
		p0(nil)
	end)
end