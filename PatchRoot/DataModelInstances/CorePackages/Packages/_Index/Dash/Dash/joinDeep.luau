-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

local parent = script.Parent
local noneModule = require(parent.None)
local _ = require(parent.Types)
local forEachModule = require(parent.forEach)

local function joinDeep(p0, p1) --[[ line: 21 ]]
	-- upvalues: forEachModule (ref), joinDeep (ref), noneModule (ref)
	local cloned = table.clone(p0)
	forEachModule(p1, function(p2, p3) --[[ line: 24 ]]
		-- upvalues: p0 (ref), cloned (ref), joinDeep (copy), noneModule (copy)
		if typeof(p0[p3]) == "table" and typeof(p2) == "table" then
			cloned[p3] = joinDeep(p0[p3], p2)
			
			return
		elseif p2 == noneModule then
			cloned[p3] = nil
			
			return
		end
		cloned[p3] = p2
	end)
	
	return cloned
end

return joinDeep