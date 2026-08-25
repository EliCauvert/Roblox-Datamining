local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local mapModule = require(parent.Map)
local instanceOfModule = require(parent_2.InstanceOf)
local reduceModule = require(parent_1.Array.reduce)
local _ = require(parent_2.ES7Types)

return function(p0)
	-- upvalues: instanceOfModule (ref), mapModule (ref), reduceModule (ref)
	return if instanceOfModule(p0, mapModule) then reduceModule(p0:entries(), function(p1, p2)
		p1[p2[1]] = p2[2]
		
		return p1
	end, {}) else p0
end