local parent = script.Parent
local noneModule = require(parent.None)
local _ = require(parent.Types)
local forEachModule = require(parent.forEach)
local forEachArgsModule = require(parent.forEachArgs)

return function(value, ...)
	-- upvalues: forEachArgsModule (ref), noneModule (ref), forEachModule (ref)
	forEachArgsModule(function(p0)
		-- upvalues: noneModule (copy), forEachModule (copy), value (ref)
		if p0 == nil or p0 == noneModule then
			return
		end
		forEachModule(p0, function(p1, p2)
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