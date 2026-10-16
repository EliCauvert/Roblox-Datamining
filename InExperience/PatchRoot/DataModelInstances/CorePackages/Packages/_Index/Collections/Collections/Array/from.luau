local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local SetModule = require(Parent1.Set)
local MapModule = require(Parent1.Map.Map)
local IsArrayModule = require(Parent.isArray)
local InstanceOfModule = require(Parent2.InstanceOf)
local _ = require(Parent2.ES7Types)
local FromStringModule = require(script.fromString)
local FromSetModule = require(script.fromSet)
local FromMapModule = require(script.fromMap)
local FromArrayModule = require(script.fromArray)

return function(p1, p2, p3) --[[ Line: 37 ]]
	-- upvalues: IsArrayModule (copy), FromArrayModule (copy), InstanceOfModule (copy), SetModule (copy), FromSetModule (copy), MapModule (copy), FromMapModule (copy), FromStringModule (copy)
	if p1 == nil then
		error("cannot create array from a nil value")
	end
	local ValueType = typeof(p1)
	
	return if ValueType == "table" and IsArrayModule(p1) then FromArrayModule(p1, p2, p3) elseif InstanceOfModule(p1, SetModule) then FromSetModule(p1, p2, p3) elseif InstanceOfModule(p1, MapModule) then FromMapModule(p1, p2, p3) elseif ValueType == "string" then FromStringModule(p1, p2, p3) else {}
end