-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:43:03 2026 Pacific Standard Time.

local _ = require(script.Parent.ReactInternalTypes)
local getStackByFiberInDevAndProd = require(script.Parent.ReactFiberComponentStack).getStackByFiberInDevAndProd

return {
	createCapturedValue = function(p0, p1) --[[ line: 26 ]]
		-- upvalues: getStackByFiberInDevAndProd (ref)
		return {
			value = p0,
			source = p1,
			stack = getStackByFiberInDevAndProd(p1)
		}
	end
}