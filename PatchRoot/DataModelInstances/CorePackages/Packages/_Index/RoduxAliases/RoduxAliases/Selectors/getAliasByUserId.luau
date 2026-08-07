-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:05 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local getDeepValueModule = require(parent.getDeepValue)
local _ = require(parent.RoduxAliasesTypes)

return function(p0) --[[ line: 8 ]]
	-- upvalues: getDeepValueModule (ref)
	local keyPath = p0.keyPath
	
	return function(p1, p2) --[[ line: 10 ]]
		-- upvalues: getDeepValueModule (copy), keyPath (ref)
		return getDeepValueModule(p1, keyPath .. ".byUserId")[p2]
	end
end