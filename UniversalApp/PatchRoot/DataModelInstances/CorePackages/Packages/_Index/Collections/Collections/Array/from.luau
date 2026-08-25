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

return function(p0, p1, p2)
	-- upvalues: isArrayModule (ref), fromArrayModule (ref), instanceOfModule (ref), setModule (ref), fromSetModule (ref), mapModule (ref), fromMapModule (ref), fromStringModule (ref)
	if p0 == nil then
		error("cannot create array from a nil value")
	end
	local var8 = typeof(p0)
	local _ = nil
	
	return if var8 == "table" and isArrayModule(p0) then fromArrayModule(p0, p1, p2) elseif instanceOfModule(p0, setModule) then fromSetModule(p0, p1, p2) elseif instanceOfModule(p0, mapModule) then fromMapModule(p0, p1, p2) elseif var8 == "string" then fromStringModule(p0, p1, p2) else {}
end