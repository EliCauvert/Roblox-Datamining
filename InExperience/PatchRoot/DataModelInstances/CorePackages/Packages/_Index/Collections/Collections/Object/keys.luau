local parent = script.Parent
local parent_1 = parent.Parent.Parent
local setModule = require(parent.Parent.Set)
local _ = require(parent_1.ES7Types)
local instanceOfModule = require(parent_1.InstanceOf)

return function(p1)
	-- upvalues: instanceOfModule (ref), setModule (ref)
	if p1 == nil then
		error("cannot extract keys from a nil value")
	end
	local var1 = typeof(p1)
	local list = nil
	
	if var1 == "table" then
		list = {}
		
		if instanceOfModule(p1, setModule) then
			return list
		end
		for i in pairs(p1) do
			table.insert(list, i)
		end
		return list
	elseif var1 == "string" then
		local var2 = p1:len()
		list = table.create(var2)
		
		for i = 1, var2 do
			list[i] = tostring(i)
		end
	end
	return list
end