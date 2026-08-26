local parent = script.Parent
local _ = require(parent.Parent.Parent.ES7Types)
local mapModule = require(parent.map)

return function(p1, p2)
	-- upvalues: mapModule (ref)
	return if #p1 == 0 then "" else table.concat(mapModule(p1, function(p3)
		return tostring(p3)
	end), p2 or ",")
end