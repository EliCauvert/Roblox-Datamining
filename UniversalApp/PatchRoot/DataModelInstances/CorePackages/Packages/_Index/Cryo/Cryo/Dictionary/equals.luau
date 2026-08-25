local equalObjectsModule = require(script.Parent.Parent.equalObjects)

local function compare(p0, p1)
	if type(p0) ~= "table" or type(p1) ~= "table" then
		return p0 == p1
	end
	for i, v in p0 do
		if p1[i] ~= v then
			return false
		end
	end
	for i, v in p1 do
		if p0[i] ~= v then
			return false
		end
	end
	return true
end

return function(...)
	-- upvalues: equalObjectsModule (ref), compare (ref)
	if equalObjectsModule(...) then
		return true
	end
	local var2 = select(1, ...)
	
	for i = 2, select("#", ...) do
		if compare(var2, select(i, ...)) then
			continue
		end
		return false
	end
	return true
end