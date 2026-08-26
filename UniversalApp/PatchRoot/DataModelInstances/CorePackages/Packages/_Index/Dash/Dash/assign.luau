local parent = script.Parent
local noneModule = require(parent.None)
local _ = require(parent.Types)
local forEachModule = require(parent.forEach)
local forEachArgsModule = require(parent.forEachArgs)

return function(value, ...)
	-- upvalues: forEachArgsModule (ref), noneModule (ref), forEachModule (ref)
	forEachArgsModule(function(p1)
		-- upvalues: noneModule (copy), forEachModule (copy), value (ref)
		if p1 == nil or p1 == noneModule then
			return
		end
		forEachModule(p1, function(p2, p3)
			-- upvalues: noneModule (copy), value (copy)
			if p2 == noneModule then
				value[p3] = nil
				
				return
			end
			value[p3] = p2
		end)
	end, ...)
	
	return value
end