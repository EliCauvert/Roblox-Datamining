local parent = script.Parent
local noneModule = require(parent.None)
local forEachArgsModule = require(parent.forEachArgs)
local forEachModule = require(parent.forEach)
local insert = table.insert

return function(p1, ...)
	-- upvalues: forEachArgsModule (ref), noneModule (ref), forEachModule (ref), insert (ref)
	forEachArgsModule(function(p2)
		-- upvalues: noneModule (copy), forEachModule (copy), p1 (ref), insert (copy)
		if p2 == noneModule or p2 == nil then
			return
		end
		forEachModule(p2, function(p3)
			-- upvalues: p1 (copy), insert (copy)
			insert(p1, p3)
		end)
	end, ...)
	
	return p1
end