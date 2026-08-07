-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:25 2026 Pacific Standard Time.

local getDeepValueModule = require(script.Parent.Parent.Dictionary.getDeepValue)

return function(p0) --[[ line: 3 ]]
	-- upvalues: getDeepValueModule (ref)
	return function(p1) --[[ line: 7 ]]
		-- upvalues: getDeepValueModule (copy), p0 (ref)
		return getDeepValueModule((p1 or {})[p0.layerName] or {}, p0.variantName) or false
	end
end