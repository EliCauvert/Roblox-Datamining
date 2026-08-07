-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:08 2026 Pacific Standard Time.

local symbol = require(script.Parent.Parent.LuauPolyfill).Symbol

return {
	isAsyncIterable = function(p0) --[[ line: 12 ]]
		-- upvalues: symbol (ref)
		local asyncIterator = symbol.asyncIterator
		
		return typeof(p0) == "table" and (p0 ~= nil and (asyncIterator and (p0[asyncIterator] and typeof(p0[asyncIterator]) == "function")))
	end
}