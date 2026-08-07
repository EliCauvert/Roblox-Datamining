local parent = script.Parent
local _ = require(parent.Parent.Parent.ES7Types)
local mapModule = require(parent.map)

return function(p0, p1) --[[ line: 22 ]]
	-- upvalues: mapModule (ref)
	return if #p0 == 0 then "" else table.concat(mapModule(p0, function(p2) --[[ line: 27 ]]
		return tostring(p2)
	end), p1 or ",")
end