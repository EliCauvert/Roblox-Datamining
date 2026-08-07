-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:48 2026 Pacific Standard Time.

local magicMockModule = require(script.Parent.Parent.MagicMock)

return function(p0) --[[ line: 4 ]]
	-- upvalues: magicMockModule (ref)
	local var1 = magicMockModule.is(p0)
	
	return {
		pass = var1,
		message = if var1 then "Expected object to be anything but a MagicMock." else string.format("Expected object to be a MagicMock. Got %q instead.", tostring(p0))
	}
end