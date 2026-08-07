-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:29 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local constantsModule = require(foundation.Constants)
local _ = require(foundation.Components.Types)

return function(p0, p1) --[[ line: 6 ]]
	-- upvalues: constantsModule (ref)
	return if p1 then {
		Color3 = p0.Color3,
		Transparency = 1 - (1 - (p0.Transparency or 0)) * constantsModule.DISABLED_TRANSPARENCY
	} else p0
end