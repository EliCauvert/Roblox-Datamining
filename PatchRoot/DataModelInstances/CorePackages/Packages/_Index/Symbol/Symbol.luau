-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:27 2026 Pacific Standard Time.

local symbolModule = require(script.Symbol)
local tbl = setmetatable({}, {
	__call = function(_, p0) --[[ line: 29 ]]
		-- upvalues: symbolModule (ref)
		return symbolModule.new(p0)
	end
})
tbl.for_ = require(script["Registry.global"]).getOrInit

return tbl