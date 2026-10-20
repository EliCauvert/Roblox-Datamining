local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local MapModule = require(Parent.Map)
local ObjectModule = require(Parent1.Object)
local InstanceOfModule = require(Parent2.InstanceOf)
local _ = require(Parent2.ES7Types)

return function(p1)
	-- upvalues: InstanceOfModule (copy), MapModule (copy), ObjectModule (copy)
	return InstanceOfModule(p1, MapModule) and p1 or MapModule.new(ObjectModule.entries(p1))
end