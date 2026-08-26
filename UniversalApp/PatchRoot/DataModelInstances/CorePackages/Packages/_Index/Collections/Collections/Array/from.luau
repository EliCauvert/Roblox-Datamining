local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local setModule = require(parent_1.Set)
local mapModule = require(parent_1.Map.Map)
local isArrayModule = require(parent.isArray)
local instanceOfModule = require(parent_2.InstanceOf)
local _ = require(parent_2.ES7Types)
local fromStringModule = require(script.fromString)
local fromSetModule = require(script.fromSet)
local fromMapModule = require(script.fromMap)
local fromArrayModule = require(script.fromArray)

return function(p1, p2, p3)
	-- upvalues: isArrayModule (ref), fromArrayModule (ref), instanceOfModule (ref), setModule (ref), fromSetModule (ref), mapModule (ref), fromMapModule (ref), fromStringModule (ref)
	if p1 == nil then
		error("cannot create array from a nil value")
	end
	local var1 = typeof(p1)
	local _ = nil
	
	return if var1 == "table" and isArrayModule(p1) then fromArrayModule(p1, p2, p3) elseif instanceOfModule(p1, setModule) then fromSetModule(p1, p2, p3) elseif instanceOfModule(p1, mapModule) then fromMapModule(p1, p2, p3) elseif var1 == "string" then fromStringModule(p1, p2, p3) else {}
end