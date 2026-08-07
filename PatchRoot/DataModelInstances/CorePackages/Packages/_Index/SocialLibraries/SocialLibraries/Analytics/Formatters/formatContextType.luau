-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:23 2026 Pacific Standard Time.

local contextTypes = require(script.Parent.Parent.Parent.Analytics.Enums).ContextTypes

return function(p0) --[[ line: 6 ]]
	-- upvalues: contextTypes (ref)
	return if p0 == nil then nil else contextTypes[p0.rawValue()].rawValue()
end