local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local MapModule = require(Parent.Map)
local InstanceOfModule = require(Parent2.InstanceOf)
local ReduceModule = require(Parent1.Array.reduce)
local _ = require(Parent2.ES7Types)

return function(p1) --[[ Line: 27 | Named "coerceToTable" ]]
	-- upvalues: InstanceOfModule (copy), MapModule (copy), ReduceModule (copy)
	return if InstanceOfModule(p1, MapModule) then ReduceModule(p1:entries(), function(p2, Entry) --[[ Line: 33 ]]
		p2[Entry[1]] = Entry[2]
		
		return p2
	end, {}) else p1
end