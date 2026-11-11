local ObjectIsModule = require(script.Parent.objectIs)

return function(List, List1): boolean
	-- upvalues: ObjectIsModule (copy)
	if ObjectIsModule(List, List1) then
		return true
	end
	if typeof(List) ~= "table" or List == nil or typeof(List1) ~= "table" or List1 == nil then
		return false
	end
	for i, value in List do
		if not ObjectIsModule(List1[i], value) then
			return false
		end
	end
	for i1, value1 in List1 do
		if not ObjectIsModule(List[i1], value1) then
			return false
		end
	end
	return true
end