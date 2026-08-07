-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:56 2026 Pacific Standard Time.

local parent = script.Parent
local noneModule = require(parent.None)
local forEachArgsModule = require(parent.forEachArgs)
local forEachModule = require(parent.forEach)
local insert = table.insert

return function(p0, ...) --[[ line: 16 | named "append" ]]
	-- upvalues: forEachArgsModule (ref), noneModule (ref), forEachModule (ref), insert (ref)
	forEachArgsModule(function(p1) --[[ line: 17 ]]
		-- upvalues: noneModule (copy), forEachModule (copy), p0 (ref), insert (copy)
		if p1 == noneModule or p1 == nil then
			return
		end
		forEachModule(p1, function(p2) --[[ line: 21 ]]
			-- upvalues: p0 (copy), insert (copy)
			insert(p0, p2)
		end)
	end, ...)
	
	return p0
end