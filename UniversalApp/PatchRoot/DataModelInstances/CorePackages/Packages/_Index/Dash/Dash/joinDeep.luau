local parent = script.Parent
local noneModule = require(parent.None)
local _ = require(parent.Types)
local forEachModule = require(parent.forEach)

local function joinDeep(p1, p2)
	-- upvalues: forEachModule (ref), joinDeep (ref), noneModule (ref)
	local cloned = table.clone(p1)
	forEachModule(p2, function(p3, p4)
		-- upvalues: p1 (ref), cloned (ref), joinDeep (copy), noneModule (copy)
		if typeof(p1[p4]) == "table" and typeof(p3) == "table" then
			cloned[p4] = joinDeep(p1[p4], p3)
			
			return
		elseif p3 == noneModule then
			cloned[p4] = nil
			
			return
		end
		cloned[p4] = p3
	end)
	
	return cloned
end

return joinDeep