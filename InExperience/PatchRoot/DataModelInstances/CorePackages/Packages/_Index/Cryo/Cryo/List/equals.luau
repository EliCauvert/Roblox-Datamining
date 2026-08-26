local equalObjectsModule = require(script.Parent.Parent.equalObjects)

local function compare(p1, p2)
	if type(p1) ~= "table" or type(p2) ~= "table" then
		return p1 == p2
	elseif #p1 ~= #p2 then
		return false
	end
	for i = 1, #p1 do
		if p1[i] == p2[i] then
			continue
		end
		return false
	end
	return true
end

return function(...)
	-- upvalues: equalObjectsModule (ref), compare (ref)
	if equalObjectsModule(...) then
		return true
	end
	local var1 = select(1, ...)
	
	for i = 2, select("#", ...) do
		if compare(var1, select(i, ...)) then
			continue
		end
		return false
	end
	return true
end