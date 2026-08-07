local equalObjectsModule = require(script.Parent.Parent.equalObjects)

local function equalsDeepOneWay(p0, p1) --[[ line: 4 ]]
	-- upvalues: equalsDeepOneWay (ref)
	if type(p0) == "table" and type(p1) == "table" then
		for i = 1, #p0 do
			if equalsDeepOneWay(p0[i], p1[i]) then
				continue
			end
			return false
		end
	else
		return p0 == p1
	end
end

return function(...) --[[ line: 20 | named "equalsDeep" ]]
	-- upvalues: equalObjectsModule (ref), equalsDeepOneWay (ref)
	if equalObjectsModule(...) then
		return true
	end
	local var2 = select("#", ...)
	
	for i_1 = 1, var2 do
		local var3 = select(i_1, ...)
		
		for i = 1, var2 do
			if i == i_1 or equalsDeepOneWay(var3, select(i, ...)) then
				continue
			end
			return false
		end
	end
	return true
end