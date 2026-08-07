-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:10 2026 Pacific Standard Time.

local calculatePotentialAudibilityModule = require(script:FindFirstAncestor("SceneUnderstanding").audio.calculatePotentialAudibility)

return function(p0) --[[ line: 19 | named "isAudible" ]]
	-- upvalues: calculatePotentialAudibilityModule (ref)
	return calculatePotentialAudibilityModule(p0) > 0.01
end