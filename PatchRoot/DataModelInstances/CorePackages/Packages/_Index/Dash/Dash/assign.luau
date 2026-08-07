-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:56 2026 Pacific Standard Time.

local parent = script.Parent
local noneModule = require(parent.None)
local _ = require(parent.Types)
local forEachModule = require(parent.forEach)
local forEachArgsModule = require(parent.forEachArgs)

return function(value, ...) --[[ line: 54 | named "assign" ]]
	-- upvalues: forEachArgsModule (ref), noneModule (ref), forEachModule (ref)
	forEachArgsModule(function(p0) --[[ line: 56 ]]
		-- upvalues: noneModule (copy), forEachModule (copy), value (ref)
		if p0 == nil or p0 == noneModule then
			return
		end
		forEachModule(p0, function(p1, p2) --[[ line: 62 ]]
			-- upvalues: noneModule (copy), value (copy)
			if p1 == noneModule then
				value[p2] = nil
				
				return
			end
			value[p2] = p1
		end)
	end, ...)
	
	return value
end