local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local mapModule = require(parent.Map)
local instanceOfModule = require(parent_2.InstanceOf)
local reduceModule = require(parent_1.Array.reduce)
local _ = require(parent_2.ES7Types)

return function(p1)
	-- upvalues: instanceOfModule (ref), mapModule (ref), reduceModule (ref)
	return if instanceOfModule(p1, mapModule) then reduceModule(p1:entries(), function(p2, p3)
		p2[p3[1]] = p3[2]
		
		return p2
	end, {}) else p1
end