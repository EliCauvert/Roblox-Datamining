-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:05 2026 Pacific Standard Time.

local flagsModule = require(script:FindFirstAncestor("Foundation").Utility.Flags)

return function(p0, p1, p2, p3, p4) --[[ line: 7 | named "calculateNumberInputValueFromPositions" ]]
	-- upvalues: flagsModule (ref)
	return p0 + (if flagsModule.FoundationNumberInputBeta then math.floor((p2 - p1) * (p4 or 1)) else p2 - p1) * p3
end