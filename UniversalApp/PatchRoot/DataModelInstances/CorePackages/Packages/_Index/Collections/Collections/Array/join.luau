local Parent = script.Parent
local _ = require(Parent.Parent.Parent.ES7Types)
local MapModule = require(Parent.map)

return function(p1, p2): string --[[ Line: 22 ]]
	-- upvalues: MapModule (copy)
	return if #p1 == 0 then "" else table.concat(MapModule(p1, function(p3): string --[[ Line: 27 ]]
		return (tostring(p3))
	end), p2 or ",")
end