local parent = script.Parent
local parent_1 = parent.Parent.Parent
local setModule = require(parent.Parent.Set)
local _ = require(parent_1.ES7Types)
local instanceOfModule = require(parent_1.InstanceOf)

return function(p0)
	-- upvalues: instanceOfModule (ref), setModule (ref)
	if p0 == nil then
		error("cannot extract keys from a nil value")
	end
	local var2 = typeof(p0)
	local list = nil
	
	if var2 == "table" then
		list = {}
		
		if instanceOfModule(p0, setModule) then
			return list
		end
		for i in pairs(p0) do
			table.insert(list, i)
		end
		return list
	elseif var2 == "string" then
		local var4 = p0:len()
		list = table.create(var4)
		
		for i = 1, var4 do
			list[i] = tostring(i)
		end
	end
	return list
end