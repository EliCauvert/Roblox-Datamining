local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local mapModule = require(parent.Map)
local objectModule = require(parent_1.Object)
local instanceOfModule = require(parent_2.InstanceOf)
local _ = require(parent_2.ES7Types)

return function(p1)
	-- upvalues: instanceOfModule (ref), mapModule (ref), objectModule (ref)
	return if instanceOfModule(p1, mapModule) then p1 else mapModule.new(objectModule.entries(p1))
end