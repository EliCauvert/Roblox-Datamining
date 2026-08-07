-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:48 2026 Pacific Standard Time.

local spyModule = require(script.Parent.Parent.Spy)

return function(p0) --[[ line: 4 ]]
	-- upvalues: spyModule (ref)
	local var1 = spyModule.is(p0)
	
	return {
		pass = var1,
		message = if var1 then "Expected object to be anything but a Spy." else string.format("Expected object to be a Spy. Got %q instead.", tostring(p0))
	}
end