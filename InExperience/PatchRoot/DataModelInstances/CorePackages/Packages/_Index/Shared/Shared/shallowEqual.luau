local objectIsModule = require(script.Parent.objectIs)

return function(p0, p1) --[[ line: 18 | named "shallowEqual" ]]
	-- upvalues: objectIsModule (ref)
	if objectIsModule(p0, p1) then
		return true
	elseif typeof(p0) ~= "table" or p0 == nil or (typeof(p1) ~= "table" or p1 == nil) then
		return false
	end
	for i, v in p0 do
		if not objectIsModule(p1[i], v) then
			return false
		end
	end
	for i, v in p1 do
		if not objectIsModule(p0[i], v) then
			return false
		end
	end
	return true
end