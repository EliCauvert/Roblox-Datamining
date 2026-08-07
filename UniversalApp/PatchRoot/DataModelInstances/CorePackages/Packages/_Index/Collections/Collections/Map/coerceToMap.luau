local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local mapModule = require(parent.Map)
local objectModule = require(parent_1.Object)
local instanceOfModule = require(parent_2.InstanceOf)
local _ = require(parent_2.ES7Types)

return function(p0) --[[ line: 27 | named "coerceToMap" ]]
	-- upvalues: instanceOfModule (ref), mapModule (ref), objectModule (ref)
	return if instanceOfModule(p0, mapModule) then p0 else mapModule.new(objectModule.entries(p0))
end