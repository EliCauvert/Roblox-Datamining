-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:36 2026 Pacific Standard Time.

local reactCurrentBatchConfig = require(script.Parent.Parent.Shared).ReactSharedInternals.ReactCurrentBatchConfig

return {
	NoTransition = 0,
	requestCurrentTransition = function() --[[ line: 20 ]]
		-- upvalues: reactCurrentBatchConfig (ref)
		return reactCurrentBatchConfig.transition
	end
}