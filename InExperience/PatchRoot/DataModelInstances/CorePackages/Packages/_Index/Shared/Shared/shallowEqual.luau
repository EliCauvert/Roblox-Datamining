local objectIsModule = require(script.Parent.objectIs)

return function(p1, p2)
	-- upvalues: objectIsModule (ref)
	if objectIsModule(p1, p2) then
		return true
	elseif typeof(p1) ~= "table" or p1 == nil or (typeof(p2) ~= "table" or p2 == nil) then
		return false
	end
	for i, v in p1 do
		if not objectIsModule(p2[i], v) then
			return false
		end
	end
	for i, v in p2 do
		if not objectIsModule(p1[i], v) then
			return false
		end
	end
	return true
end