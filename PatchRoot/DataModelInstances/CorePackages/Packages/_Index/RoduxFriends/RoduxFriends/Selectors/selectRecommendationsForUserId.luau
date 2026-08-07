-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:07 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local getDeepValueModule = require(parent.getDeepValue)
local _ = require(parent.roduxFriendsTypes)
local filterByKeysModule = require(script.Parent.filterByKeys)

return function(p0) --[[ line: 10 ]]
	-- upvalues: getDeepValueModule (ref), filterByKeysModule (ref)
	local keyPath = p0.keyPath
	
	return function(p1) --[[ line: 12 ]]
		-- upvalues: getDeepValueModule (copy), keyPath (ref), filterByKeysModule (copy)
		return function(p2, p3) --[[ line: 13 ]]
			-- upvalues: getDeepValueModule (copy), p1 (ref), keyPath (copy), filterByKeysModule (copy)
			local var2 = getDeepValueModule(p1, string.format("%s.recommendations.byUserId.%s", keyPath, p2 or "")) or {}
			
			return if p3 then filterByKeysModule(p3, var2) else var2
		end
	end
end