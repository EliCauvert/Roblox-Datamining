-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:10 2026 Pacific Standard Time.

local error = require(script.Parent.Parent.Parent.LuauPolyfill).Error

return function(p0, p1, ...) --[[ line: 24 | named "invariant" ]]
	-- upvalues: error (ref)
	if not p0 then
		error(error(string.format(p1, ...)))
	end
end