-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:30 2026 Pacific Standard Time.

local parent = script:FindFirstAncestor("Foundation").Parent
local _ = require(parent.React)
local useClock = require(parent.ReactUtils).useClock

return function(p0) --[[ line: 11 | named "useRotation" ]]
	-- upvalues: useClock (ref)
	return useClock():map(function(p1) --[[ line: 14 ]]
		-- upvalues: p0 (ref)
		return p1 * 360 * (p0 or 1)
	end)
end