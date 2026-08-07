-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:36 2026 Pacific Standard Time.

local number = require(script.Parent.Parent.Parent.LuauPolyfill).Number

return function(p0) --[[ line: 17 | named "toBeNaN" ]]
	-- upvalues: number (ref)
	local var0 = number.isNaN(p0)
	
	return if var0 then { pass = var0 } else {
		pass = false,
		message = ("expected: NaN (number), got: \"%s\" (%s) instead"):format(tostring(p0), typeof(p0))
	}
end