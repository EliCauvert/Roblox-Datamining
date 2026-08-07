-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:07 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local parent_1 = parent.Parent
local getDeepValueModule = require(parent.getDeepValue)
local _ = require(parent.roduxFriendsTypes)
local object = require(parent_1.LuauPolyfill).Object

return function(p0) --[[ line: 9 ]]
	-- upvalues: getDeepValueModule (ref), object (ref)
	local keyPath = p0.keyPath
	
	return function(p1) --[[ line: 11 ]]
		-- upvalues: getDeepValueModule (copy), keyPath (ref), object (copy)
		return function(p2) --[[ line: 12 ]]
			-- upvalues: getDeepValueModule (copy), p1 (ref), keyPath (copy), object (copy)
			return object.keys(getDeepValueModule(p1, string.format("%s.recommendations.bySource.%s", keyPath, p2 or "")) or {})
		end
	end
end