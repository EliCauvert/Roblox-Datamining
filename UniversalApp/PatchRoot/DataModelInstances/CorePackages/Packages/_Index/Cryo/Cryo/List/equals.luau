local equalObjectsModule = require(script.Parent.Parent.equalObjects)

local function compare(p0, p1) --[[ line: 3 ]]
	if type(p0) ~= "table" or type(p1) ~= "table" then
		return p0 == p1
	elseif #p0 ~= #p1 then
		return false
	end
	for i = 1, #p0 do
		if p0[i] == p1[i] then
			continue
		end
		return false
	end
	return true
end

return function(...) --[[ line: 21 | named "equals" ]]
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