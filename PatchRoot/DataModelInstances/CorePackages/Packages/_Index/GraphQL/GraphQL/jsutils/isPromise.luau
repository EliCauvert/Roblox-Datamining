-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:34 2026 Pacific Standard Time.

local promiseModule = require(script.Parent.Parent.Parent.Promise)

return {
	isPromise = function(p0) --[[ line: 17 ]]
		-- upvalues: promiseModule (ref)
		return promiseModule.is(p0)
	end
}