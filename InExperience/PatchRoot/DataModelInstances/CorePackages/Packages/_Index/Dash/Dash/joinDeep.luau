local parent = script.Parent
local noneModule = require(parent.None)
local _ = require(parent.Types)
local forEachModule = require(parent.forEach)

local function joinDeep(p0, p1)
	-- upvalues: forEachModule (ref), joinDeep (ref), noneModule (ref)
	local cloned = table.clone(p0)
	forEachModule(p1, function(p2, p3)
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