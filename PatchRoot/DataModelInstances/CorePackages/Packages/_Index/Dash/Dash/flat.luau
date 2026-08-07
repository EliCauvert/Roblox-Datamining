-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

local parent = script.Parent
local appendModule = require(parent.append)
local forEachModule = require(parent.forEach)

return function(p0) --[[ line: 14 | named "flat" ]]
	-- upvalues: forEachModule (ref), appendModule (ref)
	local t = {}
	forEachModule(p0, function(p1) --[[ line: 16 ]]
		-- upvalues: appendModule (copy), t (ref)
		appendModule(t, p1)
	end)
	
	return t
end