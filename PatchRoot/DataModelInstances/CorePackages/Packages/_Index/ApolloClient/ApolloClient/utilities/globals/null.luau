-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:17 2026 Pacific Standard Time.

local boolean = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Boolean
local t = { __value = "null" }

return {
	NULL = t,
	toJSBoolean = function(p0) --[[ line: 19 ]]
		-- upvalues: boolean (ref), t (ref)
		return boolean.toJSBoolean(p0) and p0 ~= t
	end
}