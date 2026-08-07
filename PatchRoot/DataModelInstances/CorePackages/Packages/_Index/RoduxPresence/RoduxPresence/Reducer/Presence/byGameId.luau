-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:09 2026 Pacific Standard Time.

local createReducerSliceModule = require(script.Parent.createReducerSlice)

return function(p0) --[[ line: 2 ]]
	-- upvalues: createReducerSliceModule (ref)
	return createReducerSliceModule("byGameId", "universeId", p0)
end