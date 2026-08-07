-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

local parent = script.Parent
local collectSetModule = require(parent.collectSet)
local forEachModule = require(parent.forEach)
local _ = require(parent.Types)

return function(p0, p1) --[[ line: 16 | named "omit" ]]
	-- upvalues: collectSetModule (ref), forEachModule (ref)
	local t = {}
	local var3 = collectSetModule(p1)
	forEachModule(p0, function(_, p2) --[[ line: 19 ]]
		-- upvalues: var3 (ref), t (ref), p0 (ref)
		if not var3[p2] then
			t[p2] = p0[p2]
		end
	end)
	
	return t
end